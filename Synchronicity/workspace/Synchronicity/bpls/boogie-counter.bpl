                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/boogie-counter.anchor:                   
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
       Node next isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(int item,Node next) {                                                               
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class LockBasedStack {                                                                          
      volatile Node head isLocal(this, tid)                                                         
       ? B                                                                                          
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.head == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.head.next == old(this.head) && this.head.item == item;                         
      }                                                                                             
      public void push(int item) {                                                                  
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        node.init(item,tmp1)                                                                        
        release(this);                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures old(this.head) != Node.null;                                                        
        ensures $result == old(this.head.item) && this.head == old(this.head.next);                 
      }                                                                                             
      public int pop() {                                                                            
        while (true)   {                                                                            
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            Node tmp4;                                                                              
            tmp4 := this.head;                                                                      
            tmp3 = tmp4 != Node.null;                                                               
            if (tmp3 /* == this.head != Node.null */) {                                             
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        int value;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        value := tmp5.item;                                                                         
        Node tmp6;                                                                                  
        Node tmp7;                                                                                  
        tmp7 := this.head;                                                                          
        tmp6 := tmp7.next;                                                                          
        this.head := tmp6;                                                                          
        release(this);                                                                              
         return value;                                                                              
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(int item,Node next) {                                                               
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class LockBasedStack {                                                                          
      volatile Node head isLocal(this, tid)                                                         
       ? B                                                                                          
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        modifies this;                                                                              
        ensures this.head.next == old(this.head) && this.head.item == item;                         
      }                                                                                             
      public void push(int item) {                                                                  
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        node.init(item,tmp1)                                                                        
        release(this);                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures old(this.head) != Node.null;                                                        
        ensures $result == old(this.head.item) && this.head == old(this.head.next);                 
      }                                                                                             
      public int pop() {                                                                            
        while (true)   {                                                                            
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            Node tmp4;                                                                              
            tmp4 := this.head;                                                                      
            tmp3 = tmp4 != Node.null;                                                               
            if (tmp3 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        int value;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        value := tmp5.item;                                                                         
        Node tmp6;                                                                                  
        Node tmp7;                                                                                  
        tmp7 := this.head;                                                                          
        tmp6 := tmp7.next;                                                                          
        this.head := tmp6;                                                                          
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(int item,Node next) {                                                               
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class LockBasedStack {                                                                          
      volatile Node head isLocal(this, tid)                                                         
       ? B                                                                                          
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        modifies this;                                                                              
        ensures this.head.next == old(this.head) && this.head.item == item;                         
      }                                                                                             
      public void push(int item) {                                                                  
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        {                                                                                           
          inlined node.init(item,tmp1);                                                             
          exit$16: {                                                                                
            int item$16;                                                                            
            Node next$16;                                                                           
            Node this$16;                                                                           
            item$16 = item;                                                                         
            next$16 = tmp1;                                                                         
            this$16 = node;                                                                         
            {                                                                                       
              assume this$16.item == 0;                                                             
              assume this$16.next == Node.null;                                                     
              {                                                                                     
                this$16.item := item$16;                                                            
                this$16.next := next$16;                                                            
                {                                                                                   
                  break exit$16;                                                                    
                }                                                                                   
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
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures old(this.head) != Node.null;                                                        
        ensures $result == old(this.head.item) && this.head == old(this.head.next);                 
      }                                                                                             
      public int pop() {                                                                            
        while (true)   {                                                                            
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            Node tmp4;                                                                              
            tmp4 := this.head;                                                                      
            tmp3 = tmp4 != Node.null;                                                               
            if (tmp3 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        int value;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        value := tmp5.item;                                                                         
        Node tmp6;                                                                                  
        Node tmp7;                                                                                  
        tmp7 := this.head;                                                                          
        tmp6 := tmp7.next;                                                                          
        this.head := tmp6;                                                                          
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
       int item isLocal(this, tid)                                                                  
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(int item,Node next) {                                                               
        assume this.item == 0;                                                                      
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.item := item;                                                                        
          this.next := next;                                                                        
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class LockBasedStack {                                                                          
      volatile Node head isLocal(this, tid)                                                         
       ? B                                                                                          
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
        modifies this;                                                                              
        ensures this.head.next == old(this.head) && this.head.item == item;                         
      }                                                                                             
      public void push(int item) {                                                                  
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        {                                                                                           
          inlined node.init(item,tmp1);                                                             
          exit$16: {                                                                                
            int item$16;                                                                            
            Node next$16;                                                                           
            Node this$16;                                                                           
            item$16 = item;                                                                         
            next$16 = tmp1;                                                                         
            this$16 = node;                                                                         
            {                                                                                       
              assume this$16.item == 0;                                                             
              assume this$16.next == Node.null;                                                     
              {                                                                                     
                this$16.item := item$16;                                                            
                this$16.next := next$16;                                                            
                {                                                                                   
                  break exit$16;                                                                    
                }                                                                                   
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
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures old(this.head) != Node.null;                                                        
        ensures $result == old(this.head.item) && this.head == old(this.head.next);                 
      }                                                                                             
      public int pop() {                                                                            
        while (true)   {                                                                            
          boolean tmp2;                                                                             
          tmp2 = true;                                                                              
          if (!tmp2) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            boolean tmp3;                                                                           
            Node tmp4;                                                                              
            tmp4 := this.head;                                                                      
            tmp3 = tmp4 != Node.null;                                                               
            if (tmp3 /* == this.head != Node.null */) {                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            release(this);                                                                          
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        int value;                                                                                  
        Node tmp5;                                                                                  
        tmp5 := this.head;                                                                          
        value := tmp5.item;                                                                         
        Node tmp6;                                                                                  
        Node tmp7;                                                                                  
        tmp7 := this.head;                                                                          
        tmp6 := tmp7.next;                                                                          
        this.head := tmp6;                                                                          
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
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
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.item: [Node]int;                                                                           
                                                                                                    
function {:inline} ReadEval.Node.item(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
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
                                                                                                    
function {:inline} WriteEval.Node.item(tid: Tid,this : Node,newValue: int,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
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
                                                                                                    
var Node.next: [Node]Node;                                                                          
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl LockBasedStack ***/                                                                 
                                                                                                    
type LockBasedStack;                                                                                
const unique LockBasedStack.null: LockBasedStack;                                                   
var LockBasedStack._state: [LockBasedStack]State;                                                   
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var LockBasedStack.head: [LockBasedStack]Node;                                                      
                                                                                                    
function {:inline} ReadEval.LockBasedStack.head(tid: Tid,this : LockBasedStack,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(LockBasedStack._state[this], tid)) then                                                
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((isAccessible(LockBasedStack._state[this], tid) && LockBasedStack._lock[this] == tid)) then   
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.LockBasedStack.head(tid: Tid,this : LockBasedStack,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(LockBasedStack._state[this], tid)) then                                                
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((isAccessible(LockBasedStack._state[this], tid) && LockBasedStack._lock[this] == tid)) then   
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var LockBasedStack._lock: [LockBasedStack]Tid;                                                      
                                                                                                    
function {:inline} ReadEval.LockBasedStack._lock(tid: Tid,this : LockBasedStack,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(LockBasedStack._state[this], tid)) then                                                
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((LockBasedStack._lock[this]==tid)) then                                                      
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((LockBasedStack._lock[this]==Tid.null)&&(newValue==tid))) then                              
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((LockBasedStack._lock[this]==tid)&&(newValue==Tid.null))) then                             
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.LockBasedStack._lock(tid: Tid,this : LockBasedStack,newValue: Tid,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(LockBasedStack._state[this], tid)) then                                                
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((LockBasedStack._lock[this]==tid)) then                                                      
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((LockBasedStack._lock[this]==Tid.null)&&(newValue==tid))) then                              
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((LockBasedStack._lock[this]==tid)&&(newValue==Tid.null))) then                             
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  LockBasedStack.push(tid:Tid, this : LockBasedStack, item : int)                          
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies LockBasedStack._state;                                                                     
modifies LockBasedStack.head;                                                                       
modifies LockBasedStack._lock;                                                                      
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.5): Bad tid
requires isShared(LockBasedStack._state[this]);                                                            // (15.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
{                                                                                                   
 var $pc442895: Phase;                                                                              
 var next$16442880: Node;                                                                           
 var tid442877: Tid;                                                                                
 var path442842: int;                                                                               
 var moverPath442877: MoverPath;                                                                    
 var mover442880: Mover;                                                                            
 var Node.next442842: [Node]Node;                                                                   
 var Node.next442895: [Node]Node;                                                                   
 var Node.item442880: [Node]int;                                                                    
 var Node._state442880: [Node]State;                                                                
 var node: Node;                                                                                    
 var LockBasedStack._lock442880: [LockBasedStack]Tid;                                               
 var $recorded.state442880: int;                                                                    
 var node442880: Node;                                                                              
 var node442895: Node;                                                                              
 var $pc442877: Phase;                                                                              
 var Node.item442877: [Node]int;                                                                    
 var Node._state442842: [Node]State;                                                                
 var this442895: LockBasedStack;                                                                    
 var item442895: int;                                                                               
 var LockBasedStack.head442842: [LockBasedStack]Node;                                               
 var node442877: Node;                                                                              
 var Node.item442895: [Node]int;                                                                    
 var $recorded.state442877: int;                                                                    
 var tid442895: Tid;                                                                                
 var Node._state442895: [Node]State;                                                                
 var item442877: int;                                                                               
 var LockBasedStack.head442895: [LockBasedStack]Node;                                               
 var item442880: int;                                                                               
 var mover442842: Mover;                                                                            
 var Node.next442880: [Node]Node;                                                                   
 var tmp1: Node;                                                                                    
 var tid442880: Tid;                                                                                
 var Node.item442842: [Node]int;                                                                    
 var moverPath442880: MoverPath;                                                                    
 var LockBasedStack.head442880: [LockBasedStack]Node;                                               
 var LockBasedStack.head442877: [LockBasedStack]Node;                                               
 var Node._state442877: [Node]State;                                                                
 var mover442877: Mover;                                                                            
 var moverPath442842: MoverPath;                                                                    
 var item$16: int;                                                                                  
 var $recorded.state442842: int;                                                                    
 var LockBasedStack._state442880: [LockBasedStack]State;                                            
 var LockBasedStack._state442877: [LockBasedStack]State;                                            
 var Node._lock442877: [Node]Tid;                                                                   
 var LockBasedStack._lock442877: [LockBasedStack]Tid;                                               
 var tid442842: Tid;                                                                                
 var $pc442842: Phase;                                                                              
 var next$16: Node;                                                                                 
 var LockBasedStack._state442895: [LockBasedStack]State;                                            
 var tmp1442877: Node;                                                                              
 var Node.next442877: [Node]Node;                                                                   
 var LockBasedStack._lock442895: [LockBasedStack]Tid;                                               
 var this$16: Node;                                                                                 
 var LockBasedStack._state442842: [LockBasedStack]State;                                            
 var this442877: LockBasedStack;                                                                    
 var node442842: Node;                                                                              
 var item$16442877: int;                                                                            
 var $pc442880: Phase;                                                                              
 var item442842: int;                                                                               
 var next$16442877: Node;                                                                           
 var Node._lock442895: [Node]Tid;                                                                   
 var tmp1442842: Node;                                                                              
 var LockBasedStack._lock442842: [LockBasedStack]Tid;                                               
 var this442842: LockBasedStack;                                                                    
 var this$16442880: Node;                                                                           
 var item$16442880: int;                                                                            
 var this$16442877: Node;                                                                           
 var Node._lock442842: [Node]Tid;                                                                   
 var Node._lock442880: [Node]Tid;                                                                   
 var path442880: int;                                                                               
 var tmp1442880: Node;                                                                              
 var path442877: int;                                                                               
 var $recorded.state442895: int;                                                                    
 var this442880: LockBasedStack;                                                                    
 var tmp1442895: Node;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume LockBasedStack._lock[this] == Tid.null;                                                     
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 LockBasedStack._lock[this] := tid;                                                                 
                                                                                                    
 // 19.9: Node node;                                                                                
                                                                                                    
                                                                                                    
 // 19.9: node = new Node();                                                                        
                                                                                                    
 havoc node;                                                                                        
 assume node != Node.null && isFresh(Node._state[node]);                                            
 Node._state[node] := LOCAL(tid);                                                                   
 assume Node.item[node]  == 0;                                                                      
 assume Node.next[node]  == Node.null;                                                              
 assume Node._lock[node]  == Tid.null;                                                              
                                                                                                    
 // 19.9: Node tmp1;                                                                                
                                                                                                    
                                                                                                    
 // 19.9: tmp1 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath442842 := ReadEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442842 := m#moverPath(moverPath442842);                                                       
 path442842 := p#moverPath(moverPath442842);                                                        
 assume Node._state442842 == Node._state && Node.item442842 == Node.item && Node.next442842 == Node.next && Node._lock442842 == Node._lock && LockBasedStack._state442842 == LockBasedStack._state && LockBasedStack.head442842 == LockBasedStack.head && LockBasedStack._lock442842 == LockBasedStack._lock && tmp1442842 == tmp1 && node442842 == node && item442842 == item && this442842 == this && tid442842 == tid && $pc442842 == $pc;
 assume $recorded.state442842 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (19.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover442842);                                                               
 assert $pc != PhaseError;                                                                                 // (19.9): Reduction failure
 tmp1 := LockBasedStack.head[this];                                                                 
 // inlined: node.init(item,tmp1)}                                                                  
 exit$16_top:                                                                                       
                                                                                                    
 // 19.9: int item$16;                                                                              
                                                                                                    
                                                                                                    
 // 19.9: Node next$16;                                                                             
                                                                                                    
                                                                                                    
 // 19.9: Node this$16;                                                                             
                                                                                                    
                                                                                                    
 // 19.9: item$16 = item;                                                                           
                                                                                                    
 item$16 := item;                                                                                   
                                                                                                    
 // 19.9: next$16 = tmp1;                                                                           
                                                                                                    
 next$16 := tmp1;                                                                                   
                                                                                                    
 // 19.9: this$16 = node;                                                                           
                                                                                                    
 this$16 := node;                                                                                   
                                                                                                    
 // 5.5: assume this$16.item == 0;                                                                  
                                                                                                    
 assume (Node.item[this$16]==0);                                                                    
                                                                                                    
 // 5.5: assume this$16.next == Node.null;                                                          
                                                                                                    
 assume (Node.next[this$16]==Node.null);                                                            
                                                                                                    
                                                                                                    
 // 6.9: this$16.item := item$16;                                                                   
                                                                                                    
                                                                                                    
 moverPath442877 := WriteEval.Node.item(tid: Tid,this$16: Node,item$16: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442877 := m#moverPath(moverPath442877);                                                       
 path442877 := p#moverPath(moverPath442877);                                                        
 assume Node._state442877 == Node._state && Node.item442877 == Node.item && Node.next442877 == Node.next && Node._lock442877 == Node._lock && LockBasedStack._state442877 == LockBasedStack._state && LockBasedStack.head442877 == LockBasedStack.head && LockBasedStack._lock442877 == LockBasedStack._lock && this$16442877 == this$16 && next$16442877 == next$16 && item$16442877 == item$16 && tmp1442877 == tmp1 && node442877 == node && item442877 == item && this442877 == this && tid442877 == tid && $pc442877 == $pc;
 assume $recorded.state442877 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this$16 != Node.null;                                                                      
 } else {                                                                                           
  assert this$16 != Node.null;                                                                             // (6.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover442877);                                                               
 assert $pc != PhaseError;                                                                                 // (6.9): Reduction failure
 Node.item[this$16] := item$16;                                                                     
                                                                                                    
                                                                                                    
 // 7.9: this$16.next := next$16;                                                                   
                                                                                                    
                                                                                                    
 moverPath442880 := WriteEval.Node.next(tid: Tid,this$16: Node,next$16: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442880 := m#moverPath(moverPath442880);                                                       
 path442880 := p#moverPath(moverPath442880);                                                        
 assume Node._state442880 == Node._state && Node.item442880 == Node.item && Node.next442880 == Node.next && Node._lock442880 == Node._lock && LockBasedStack._state442880 == LockBasedStack._state && LockBasedStack.head442880 == LockBasedStack.head && LockBasedStack._lock442880 == LockBasedStack._lock && this$16442880 == this$16 && next$16442880 == next$16 && item$16442880 == item$16 && tmp1442880 == tmp1 && node442880 == node && item442880 == item && this442880 == this && tid442880 == tid && $pc442880 == $pc;
 assume $recorded.state442880 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this$16 != Node.null;                                                                      
 } else {                                                                                           
  assert this$16 != Node.null;                                                                             // (7.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover442880);                                                               
 assert $pc != PhaseError;                                                                                 // (7.9): Reduction failure
 Node.next[this$16] := next$16;                                                                     
 if (isLocal(Node._state[next$16], tid)) {                                                          
  Node._state[next$16] := SHARED();                                                                 
  assert isSharedAssignable(Node._state[Node.next[next$16]]);                                              // (7.9): next$16 became shared, but next$16.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 5.31: break exit$16;                                                                            
                                                                                                    
 goto exit$16_bottom;                                                                               
 exit$16_bottom:                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (21.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert LockBasedStack._lock[this] == tid;                                                                 // (21.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (21.9): Reduction failure
 LockBasedStack._lock[this] := Tid.null;                                                            
                                                                                                    
 // 17.32: // return;                                                                               
                                                                                                    
 assume Node._state442895 == Node._state && Node.item442895 == Node.item && Node.next442895 == Node.next && Node._lock442895 == Node._lock && LockBasedStack._state442895 == LockBasedStack._state && LockBasedStack.head442895 == LockBasedStack.head && LockBasedStack._lock442895 == LockBasedStack._lock && tmp1442895 == tmp1 && node442895 == node && item442895 == item && this442895 == this && tid442895 == tid;
 assume $recorded.state442895 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  LockBasedStack.pop(tid:Tid, this : LockBasedStack)                                       
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies LockBasedStack._state;                                                                     
modifies LockBasedStack.head;                                                                       
modifies LockBasedStack._lock;                                                                      
                                                                                                    
requires ValidTid(tid);                                                                                    // (24.5): Bad tid
requires isShared(LockBasedStack._state[this]);                                                            // (24.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
{                                                                                                   
 var LockBasedStack._lock442937_bottom: [LockBasedStack]Tid;                                        
 var LockBasedStack.head442961: [LockBasedStack]Node;                                               
 var mover442961: Mover;                                                                            
 var $pc442937_bottom: Phase;                                                                       
 var value442961: int;                                                                              
 var LockBasedStack.head442918: [LockBasedStack]Node;                                               
 var tid442964: Tid;                                                                                
 var tmp3442918: bool;                                                                              
 var Node._lock442958: [Node]Tid;                                                                   
 var this442968: LockBasedStack;                                                                    
 var Node._state442949: [Node]State;                                                                
 var $pc442918: Phase;                                                                              
 var Node._lock442937_bottom: [Node]Tid;                                                            
 var LockBasedStack._lock442968: [LockBasedStack]Tid;                                               
 var Node.next442934_post: [Node]Node;                                                              
 var tid442934: Tid;                                                                                
 var tmp6442958: Node;                                                                              
 var tmp4: Node;                                                                                    
 var LockBasedStack.head442972: [LockBasedStack]Node;                                               
 var $recorded.state442937: int;                                                                    
 var value442946: int;                                                                              
 var LockBasedStack._state442937: [LockBasedStack]State;                                            
 var Node.item442937_bottom: [Node]int;                                                             
 var path442964: int;                                                                               
 var $result442961: int;                                                                            
 var Node.next442972: [Node]Node;                                                                   
 var LockBasedStack._lock442949: [LockBasedStack]Tid;                                               
 var tmp5442968: Node;                                                                              
 var Node.item442918: [Node]int;                                                                    
 var tmp7: Node;                                                                                    
 var LockBasedStack._state442946: [LockBasedStack]State;                                            
 var $result442958: int;                                                                            
 var $result442946: int;                                                                            
 var LockBasedStack._state442961: [LockBasedStack]State;                                            
 var tmp2442934_post: bool;                                                                         
 var this442937: LockBasedStack;                                                                    
 var $result442934: int;                                                                            
 var phase442937: Phase;                                                                            
 var LockBasedStack.head442946: [LockBasedStack]Node;                                               
 var Node.item442937: [Node]int;                                                                    
 var Node._state442937_bottom: [Node]State;                                                         
 var this442972: LockBasedStack;                                                                    
 var tid442937_bottom: Tid;                                                                         
 var $result442934_post: int;                                                                       
 var $recorded.state442958: int;                                                                    
 var moverPath442961: MoverPath;                                                                    
 var $recorded.state442968: int;                                                                    
 var this442949: LockBasedStack;                                                                    
 var value442949: int;                                                                              
 var moverPath442949: MoverPath;                                                                    
 var tmp2: bool;                                                                                    
 var moverPath442958: MoverPath;                                                                    
 var tid442934_post: Tid;                                                                           
 var $result442972: int;                                                                            
 var tmp5442964: Node;                                                                              
 var $pc442934: Phase;                                                                              
 var Node.item442934: [Node]int;                                                                    
 var Node._state442937: [Node]State;                                                                
 var LockBasedStack.head442949: [LockBasedStack]Node;                                               
 var $result442964: int;                                                                            
 var LockBasedStack._state442972: [LockBasedStack]State;                                            
 var value: int;                                                                                    
 var LockBasedStack._state442937_bottom: [LockBasedStack]State;                                     
 var Node.next442918: [Node]Node;                                                                   
 var this442958: LockBasedStack;                                                                    
 var tmp6442972: Node;                                                                              
 var tmp3442934: bool;                                                                              
 var $result442918: int;                                                                            
 var LockBasedStack.head442934_post: [LockBasedStack]Node;                                          
 var Node._lock442937: [Node]Tid;                                                                   
 var LockBasedStack._state442968: [LockBasedStack]State;                                            
 var $pc442958: Phase;                                                                              
 var tid442949: Tid;                                                                                
 var Node._state442961: [Node]State;                                                                
 var Node.item442968: [Node]int;                                                                    
 var tmp6442961: Node;                                                                              
 var Node.next442968: [Node]Node;                                                                   
 var tmp5442949: Node;                                                                              
 var Node._lock442934: [Node]Tid;                                                                   
 var Node.item442958: [Node]int;                                                                    
 var tmp5442972: Node;                                                                              
 var LockBasedStack._lock442964: [LockBasedStack]Tid;                                               
 var LockBasedStack._state442934_post: [LockBasedStack]State;                                       
 var Node._state442964: [Node]State;                                                                
 var LockBasedStack._state442934: [LockBasedStack]State;                                            
 var $recorded.state442934_post: int;                                                               
 var this442946: LockBasedStack;                                                                    
 var Node.next442964: [Node]Node;                                                                   
 var Node._state442972: [Node]State;                                                                
 var Node._lock442972: [Node]Tid;                                                                   
 var Node._lock442968: [Node]Tid;                                                                   
 var LockBasedStack._state442958: [LockBasedStack]State;                                            
 var value442964: int;                                                                              
 var $result442937: int;                                                                            
 var tmp7442961: Node;                                                                              
 var $recorded.state442918: int;                                                                    
 var LockBasedStack.head442937: [LockBasedStack]Node;                                               
 var Node._lock442949: [Node]Tid;                                                                   
 var Node._lock442934_post: [Node]Tid;                                                              
 var tmp7442958: Node;                                                                              
 var this442964: LockBasedStack;                                                                    
 var tmp3442934_post: bool;                                                                         
 var tmp6442964: Node;                                                                              
 var LockBasedStack._state442918: [LockBasedStack]State;                                            
 var tid442918: Tid;                                                                                
 var $recorded.state442946: int;                                                                    
 var LockBasedStack._state442949: [LockBasedStack]State;                                            
 var $pc442937: Phase;                                                                              
 var mover442964: Mover;                                                                            
 var $recorded.state442961: int;                                                                    
 var Node._state442934: [Node]State;                                                                
 var path442949: int;                                                                               
 var LockBasedStack._lock442946: [LockBasedStack]Tid;                                               
 var LockBasedStack._lock442972: [LockBasedStack]Tid;                                               
 var LockBasedStack.head442958: [LockBasedStack]Node;                                               
 var mover442918: Mover;                                                                            
 var tmp5442958: Node;                                                                              
 var Node._lock442964: [Node]Tid;                                                                   
 var tmp7442964: Node;                                                                              
 var Node._state442934_post: [Node]State;                                                           
 var mover442949: Mover;                                                                            
 var Node.item442949: [Node]int;                                                                    
 var path442946: int;                                                                               
 var tmp5442946: Node;                                                                              
 var tmp5: Node;                                                                                    
 var Node.item442946: [Node]int;                                                                    
 var value442972: int;                                                                              
 var tmp6: Node;                                                                                    
 var value442958: int;                                                                              
 var tid442961: Tid;                                                                                
 var $pc442949: Phase;                                                                              
 var this442934_post: LockBasedStack;                                                               
 var Node._lock442946: [Node]Tid;                                                                   
 var $pc442964: Phase;                                                                              
 var Node._lock442961: [Node]Tid;                                                                   
 var Node._state442958: [Node]State;                                                                
 var tmp2442934: bool;                                                                              
 var Node.item442972: [Node]int;                                                                    
 var Node._state442946: [Node]State;                                                                
 var Node.next442958: [Node]Node;                                                                   
 var tmp5442961: Node;                                                                              
 var $recorded.state442972: int;                                                                    
 var Node._state442918: [Node]State;                                                                
 var LockBasedStack._lock442961: [LockBasedStack]Tid;                                               
 var tmp6442968: Node;                                                                              
 var LockBasedStack.head442964: [LockBasedStack]Node;                                               
 var $pc442946: Phase;                                                                              
 var $pc442961: Phase;                                                                              
 var tid442946: Tid;                                                                                
 var this442937_bottom: LockBasedStack;                                                             
 var $result442937_bottom: int;                                                                     
 var LockBasedStack._state442964: [LockBasedStack]State;                                            
 var $recorded.state442964: int;                                                                    
 var Node.next442937_bottom: [Node]Node;                                                            
 var path442918: int;                                                                               
 var tid442937: Tid;                                                                                
 var LockBasedStack._lock442934: [LockBasedStack]Tid;                                               
 var tmp3: bool;                                                                                    
 var tmp7442968: Node;                                                                              
 var tmp4442918: Node;                                                                              
 var moverPath442964: MoverPath;                                                                    
 var LockBasedStack.head442934: [LockBasedStack]Node;                                               
 var tmp4442934_post: Node;                                                                         
 var this442934: LockBasedStack;                                                                    
 var $recorded.state442949: int;                                                                    
 var $pc442968: Phase;                                                                              
 var Node.item442961: [Node]int;                                                                    
 var tid442968: Tid;                                                                                
 var path442958: int;                                                                               
 var moverPath442918: MoverPath;                                                                    
 var $result442949: int;                                                                            
 var this442918: LockBasedStack;                                                                    
 var Node._state442968: [Node]State;                                                                
 var value442968: int;                                                                              
 var LockBasedStack._lock442918: [LockBasedStack]Tid;                                               
 var Node.item442934_post: [Node]int;                                                               
 var tmp7442972: Node;                                                                              
 var LockBasedStack._lock442958: [LockBasedStack]Tid;                                               
 var $pc442934_post: Phase;                                                                         
 var LockBasedStack._lock442934_post: [LockBasedStack]Tid;                                          
 var Node.next442934: [Node]Node;                                                                   
 var tmp2442918: bool;                                                                              
 var Node.item442964: [Node]int;                                                                    
 var tid442972: Tid;                                                                                
 var Node.next442949: [Node]Node;                                                                   
 var this442961: LockBasedStack;                                                                    
 var mover442946: Mover;                                                                            
 var Node._lock442918: [Node]Tid;                                                                   
 var Node.next442961: [Node]Node;                                                                   
 var $recorded.state442934: int;                                                                    
 var tmp4442934: Node;                                                                              
 var Node.next442937: [Node]Node;                                                                   
 var LockBasedStack._lock442937: [LockBasedStack]Tid;                                               
 var LockBasedStack.head442937_bottom: [LockBasedStack]Node;                                        
 var path442961: int;                                                                               
 var Node.next442946: [Node]Node;                                                                   
 var LockBasedStack.head442968: [LockBasedStack]Node;                                               
 var tid442958: Tid;                                                                                
 var $recorded.state442937_bottom: int;                                                             
 var $pc442972: Phase;                                                                              
 var mover442958: Mover;                                                                            
 var $result442968: int;                                                                            
 var moverPath442946: MoverPath;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state442937 == Node._state && Node.item442937 == Node.item && Node.next442937 == Node.next && Node._lock442937 == Node._lock && LockBasedStack._state442937 == LockBasedStack._state && LockBasedStack.head442937 == LockBasedStack.head && LockBasedStack._lock442937 == LockBasedStack._lock && $result442937 == $result && this442937 == this && tid442937 == tid;
 assume $recorded.state442937 == 1;                                                                 
                                                                                                    
 // 28.9: while (true)   {                                                                          
                                                                                                    
 phase442937 := $pc;                                                                                
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (24.5): Bad tid
  invariant isShared(LockBasedStack._state[this]);                                                         // (24.5): this is not global
                                                                                                    
  invariant StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
  invariant (forall _this : Node :: Invariant.Y_Node.item(tid : Tid, _this, Node.item[_this] ,Node._state442937,Node.item442937,Node.next442937,Node._lock442937,LockBasedStack._state442937,LockBasedStack.head442937,LockBasedStack._lock442937));       // (28.9): Loop does not preserve yields_as annotation for field item
  invariant (forall _this : Node :: Invariant.Y_Node.next(tid : Tid, _this, Node.next[_this] ,Node._state442937,Node.item442937,Node.next442937,Node._lock442937,LockBasedStack._state442937,LockBasedStack.head442937,LockBasedStack._lock442937));       // (28.9): Loop does not preserve yields_as annotation for field next
  invariant (forall _this : LockBasedStack :: Invariant.Y_LockBasedStack.head(tid : Tid, _this, LockBasedStack.head[_this] ,Node._state442937,Node.item442937,Node.next442937,Node._lock442937,LockBasedStack._state442937,LockBasedStack.head442937,LockBasedStack._lock442937));       // (28.9): Loop does not preserve yields_as annotation for field head
  invariant phase442937 == $pc;                                                                            // (28.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (28.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 28.16: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 28.16: tmp2 = true;                                                                            
                                                                                                    
  tmp2 := true;                                                                                     
  if (!(tmp2)) {                                                                                    
                                                                                                    
   // 28.9: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 30.13: boolean tmp3;                                                                           
                                                                                                    
                                                                                                    
  // 30.13: Node tmp4;                                                                              
                                                                                                    
                                                                                                    
  // 30.13: tmp4 := this.head;                                                                      
                                                                                                    
                                                                                                    
  moverPath442918 := ReadEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
  mover442918 := m#moverPath(moverPath442918);                                                      
  path442918 := p#moverPath(moverPath442918);                                                       
  assume Node._state442918 == Node._state && Node.item442918 == Node.item && Node.next442918 == Node.next && Node._lock442918 == Node._lock && LockBasedStack._state442918 == LockBasedStack._state && LockBasedStack.head442918 == LockBasedStack.head && LockBasedStack._lock442918 == LockBasedStack._lock && tmp4442918 == tmp4 && tmp3442918 == tmp3 && tmp2442918 == tmp2 && $result442918 == $result && this442918 == this && tid442918 == tid && $pc442918 == $pc;
  assume $recorded.state442918 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != LockBasedStack.null;                                                              
  } else {                                                                                          
   assert this != LockBasedStack.null;                                                                     // (30.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover442918);                                                              
  assert $pc != PhaseError;                                                                                // (30.13): Reduction failure
  tmp4 := LockBasedStack.head[this];                                                                
                                                                                                    
  // 30.13: tmp3 = tmp4 != Node.null;                                                               
                                                                                                    
  tmp3 := (tmp4!=Node.null);                                                                        
  if (tmp3 /* lowered (LockBasedStack.head[this]!=Node.null) */) {                                  
                                                                                                    
   // 31.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != LockBasedStack.null;                                                              
  } else {                                                                                          
   assert this != LockBasedStack.null;                                                                     // (33.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert LockBasedStack._lock[this] == tid;                                                                // (33.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (33.13): Reduction failure
  LockBasedStack._lock[this] := Tid.null;                                                           
                                                                                                    
  // 34.13: yield;                                                                                  
                                                                                                    
  assume Node._state442934 == Node._state && Node.item442934 == Node.item && Node.next442934 == Node.next && Node._lock442934 == Node._lock && LockBasedStack._state442934 == LockBasedStack._state && LockBasedStack.head442934 == LockBasedStack.head && LockBasedStack._lock442934 == LockBasedStack._lock && tmp4442934 == tmp4 && tmp3442934 == tmp3 && tmp2442934 == tmp2 && $result442934 == $result && this442934 == this && tid442934 == tid;
  assume $recorded.state442934 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Node._state442934_post == Node._state && Node.item442934_post == Node.item && Node.next442934_post == Node.next && Node._lock442934_post == Node._lock && LockBasedStack._state442934_post == LockBasedStack._state && LockBasedStack.head442934_post == LockBasedStack.head && LockBasedStack._lock442934_post == LockBasedStack._lock && tmp4442934_post == tmp4 && tmp3442934_post == tmp3 && tmp2442934_post == tmp2 && $result442934_post == $result && this442934_post == this && tid442934_post == tid;
  assume $recorded.state442934_post == 1;                                                           
  assume Node._state442937_bottom == Node._state && Node.item442937_bottom == Node.item && Node.next442937_bottom == Node.next && Node._lock442937_bottom == Node._lock && LockBasedStack._state442937_bottom == LockBasedStack._state && LockBasedStack.head442937_bottom == LockBasedStack.head && LockBasedStack._lock442937_bottom == LockBasedStack._lock && $result442937_bottom == $result && this442937_bottom == this && tid442937_bottom == tid;
  assume $recorded.state442937_bottom == 1;                                                         
  assert phase442937 == $pc;                                                                               // (28.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 36.9: int value;                                                                                
                                                                                                    
                                                                                                    
 // 36.9: Node tmp5;                                                                                
                                                                                                    
                                                                                                    
 // 36.9: tmp5 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath442946 := ReadEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442946 := m#moverPath(moverPath442946);                                                       
 path442946 := p#moverPath(moverPath442946);                                                        
 assume Node._state442946 == Node._state && Node.item442946 == Node.item && Node.next442946 == Node.next && Node._lock442946 == Node._lock && LockBasedStack._state442946 == LockBasedStack._state && LockBasedStack.head442946 == LockBasedStack.head && LockBasedStack._lock442946 == LockBasedStack._lock && tmp5442946 == tmp5 && value442946 == value && $result442946 == $result && this442946 == this && tid442946 == tid && $pc442946 == $pc;
 assume $recorded.state442946 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (36.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover442946);                                                               
 assert $pc != PhaseError;                                                                                 // (36.9): Reduction failure
 tmp5 := LockBasedStack.head[this];                                                                 
                                                                                                    
 // 36.9: value := tmp5.item;                                                                       
                                                                                                    
                                                                                                    
 moverPath442949 := ReadEval.Node.item(tid: Tid,tmp5: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442949 := m#moverPath(moverPath442949);                                                       
 path442949 := p#moverPath(moverPath442949);                                                        
 assume Node._state442949 == Node._state && Node.item442949 == Node.item && Node.next442949 == Node.next && Node._lock442949 == Node._lock && LockBasedStack._state442949 == LockBasedStack._state && LockBasedStack.head442949 == LockBasedStack.head && LockBasedStack._lock442949 == LockBasedStack._lock && tmp5442949 == tmp5 && value442949 == value && $result442949 == $result && this442949 == this && tid442949 == tid && $pc442949 == $pc;
 assume $recorded.state442949 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume tmp5 != Node.null;                                                                         
 } else {                                                                                           
  assert tmp5 != Node.null;                                                                                // (36.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover442949);                                                               
 assert $pc != PhaseError;                                                                                 // (36.9): Reduction failure
 value := Node.item[tmp5];                                                                          
                                                                                                    
 // 37.9: Node tmp6;                                                                                
                                                                                                    
                                                                                                    
 // 37.9: Node tmp7;                                                                                
                                                                                                    
                                                                                                    
 // 37.9: tmp7 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath442958 := ReadEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442958 := m#moverPath(moverPath442958);                                                       
 path442958 := p#moverPath(moverPath442958);                                                        
 assume Node._state442958 == Node._state && Node.item442958 == Node.item && Node.next442958 == Node.next && Node._lock442958 == Node._lock && LockBasedStack._state442958 == LockBasedStack._state && LockBasedStack.head442958 == LockBasedStack.head && LockBasedStack._lock442958 == LockBasedStack._lock && tmp7442958 == tmp7 && tmp6442958 == tmp6 && tmp5442958 == tmp5 && value442958 == value && $result442958 == $result && this442958 == this && tid442958 == tid && $pc442958 == $pc;
 assume $recorded.state442958 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (37.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover442958);                                                               
 assert $pc != PhaseError;                                                                                 // (37.9): Reduction failure
 tmp7 := LockBasedStack.head[this];                                                                 
                                                                                                    
 // 37.9: tmp6 := tmp7.next;                                                                        
                                                                                                    
                                                                                                    
 moverPath442961 := ReadEval.Node.next(tid: Tid,tmp7: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442961 := m#moverPath(moverPath442961);                                                       
 path442961 := p#moverPath(moverPath442961);                                                        
 assume Node._state442961 == Node._state && Node.item442961 == Node.item && Node.next442961 == Node.next && Node._lock442961 == Node._lock && LockBasedStack._state442961 == LockBasedStack._state && LockBasedStack.head442961 == LockBasedStack.head && LockBasedStack._lock442961 == LockBasedStack._lock && tmp7442961 == tmp7 && tmp6442961 == tmp6 && tmp5442961 == tmp5 && value442961 == value && $result442961 == $result && this442961 == this && tid442961 == tid && $pc442961 == $pc;
 assume $recorded.state442961 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume tmp7 != Node.null;                                                                         
 } else {                                                                                           
  assert tmp7 != Node.null;                                                                                // (37.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover442961);                                                               
 assert $pc != PhaseError;                                                                                 // (37.9): Reduction failure
 tmp6 := Node.next[tmp7];                                                                           
                                                                                                    
                                                                                                    
 // 37.9: this.head := tmp6;                                                                        
                                                                                                    
                                                                                                    
 moverPath442964 := WriteEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,tmp6: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 mover442964 := m#moverPath(moverPath442964);                                                       
 path442964 := p#moverPath(moverPath442964);                                                        
 assume Node._state442964 == Node._state && Node.item442964 == Node.item && Node.next442964 == Node.next && Node._lock442964 == Node._lock && LockBasedStack._state442964 == LockBasedStack._state && LockBasedStack.head442964 == LockBasedStack.head && LockBasedStack._lock442964 == LockBasedStack._lock && tmp7442964 == tmp7 && tmp6442964 == tmp6 && tmp5442964 == tmp5 && value442964 == value && $result442964 == $result && this442964 == this && tid442964 == tid && $pc442964 == $pc;
 assume $recorded.state442964 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (37.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover442964);                                                               
 assert $pc != PhaseError;                                                                                 // (37.9): Reduction failure
 LockBasedStack.head[this] := tmp6;                                                                 
 if (isLocal(Node._state[tmp6], tid)) {                                                             
  Node._state[tmp6] := SHARED();                                                                    
  assert isSharedAssignable(Node._state[Node.next[tmp6]]);                                                 // (37.9): tmp6 became shared, but tmp6.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != LockBasedStack.null;                                                               
 } else {                                                                                           
  assert this != LockBasedStack.null;                                                                      // (38.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert LockBasedStack._lock[this] == tid;                                                                 // (38.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (38.9): Reduction failure
 LockBasedStack._lock[this] := Tid.null;                                                            
                                                                                                    
 // 39.9:  return value;                                                                            
                                                                                                    
 assume Node._state442968 == Node._state && Node.item442968 == Node.item && Node.next442968 == Node.next && Node._lock442968 == Node._lock && LockBasedStack._state442968 == LockBasedStack._state && LockBasedStack.head442968 == LockBasedStack.head && LockBasedStack._lock442968 == LockBasedStack._lock && tmp7442968 == tmp7 && tmp6442968 == tmp6 && tmp5442968 == tmp5 && value442968 == value && $result442968 == $result && this442968 == this && tid442968 == tid;
 assume $recorded.state442968 == 1;                                                                 
 $result := value;                                                                                  
 return;                                                                                            
                                                                                                    
 // 27.22: // return -1;                                                                            
                                                                                                    
 assume Node._state442972 == Node._state && Node.item442972 == Node.item && Node.next442972 == Node.next && Node._lock442972 == Node._lock && LockBasedStack._state442972 == LockBasedStack._state && LockBasedStack.head442972 == LockBasedStack.head && LockBasedStack._lock442972 == LockBasedStack._lock && tmp7442972 == tmp7 && tmp6442972 == tmp6 && tmp5442972 == tmp5 && value442972 == value && $result442972 == $result && this442972 == this && tid442972 == tid;
 assume $recorded.state442972 == 1;                                                                 
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,LockBasedStack._state: [LockBasedStack]State,LockBasedStack.head: [LockBasedStack]Node,LockBasedStack._lock: [LockBasedStack]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  (forall _i: LockBasedStack  :: _i == LockBasedStack.null <==> isNull(LockBasedStack._state[_i])) &&
  (forall _i: Node ::  (isShared(Node._state[_i]) ==> isSharedAssignable(Node._state[Node.next[_i]]))) &&
  (forall _i: Node ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Node._state[_i],_t) ==> isLocalAssignable(Node._state[Node.next[_i]], _t)))) &&
  (forall _i: LockBasedStack ::  (isShared(LockBasedStack._state[_i]) ==> isSharedAssignable(Node._state[LockBasedStack.head[_i]]))) &&
  (forall _i: LockBasedStack ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(LockBasedStack._state[_i],_t) ==> isLocalAssignable(Node._state[LockBasedStack.head[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.item failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)             
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): Node.item failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                 
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                  
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.item;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Node.item[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): Node.item failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Node.next[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,x: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (13.5): LockBasedStack.head failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.LockBasedStack.head(u: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (13.5): LockBasedStack.head failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == LockBasedStack.head[x];                                                                
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 LockBasedStack.head[x] := havocValue;                                                              
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,x: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (13.5): LockBasedStack.head failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == LockBasedStack.head[x];                                                                
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.LockBasedStack.head(u: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (13.5): LockBasedStack.head failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,x: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (13.5): LockBasedStack.head failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, x: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[x], u);                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == LockBasedStack.head[x];                                                                
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 LockBasedStack.head[x] := havocValue;                                                              
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,x: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (13.5): LockBasedStack.head failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.LockBasedStack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.item;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.LockBasedStack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.item;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.LockBasedStack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.item;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var v_mid: int;                                                                                    
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.LockBasedStack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.item;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[y] := w;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.LockBasedStack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.item;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.next;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.next;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.next;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.next;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[y] := w;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies Node.next;                                                                                
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.LockBasedStack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.LockBasedStack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.LockBasedStack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.LockBasedStack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.LockBasedStack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
 modifies Node.item;                                                                                
                                                                                                    
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
 var w0_pre: int;                                                                                   
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: int;                                                                                   
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.LockBasedStack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.LockBasedStack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.LockBasedStack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.LockBasedStack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.LockBasedStack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(Node._state[y], u);                                                          
 modifies LockBasedStack.head;                                                                      
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.LockBasedStack.head.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies LockBasedStack.head;                                                                      
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.LockBasedStack.head.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies LockBasedStack.head;                                                                      
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.LockBasedStack.head.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies LockBasedStack.head;                                                                      
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var x_mid: LockBasedStack;                                                                         
 var $recorded.state_mid: int;                                                                      
 var y_mid: LockBasedStack;                                                                         
 var v_mid: Node;                                                                                   
 var LockBasedStack.head_mid: [LockBasedStack]Node;                                                 
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var LockBasedStack._lock_mid: [LockBasedStack]Tid;                                                 
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
 var LockBasedStack._state_mid: [LockBasedStack]State;                                              
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := LockBasedStack.head[x];                                                                    
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && LockBasedStack._state_mid == LockBasedStack._state && LockBasedStack.head_mid == LockBasedStack.head && LockBasedStack._lock_mid == LockBasedStack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 LockBasedStack.head[x] := tmpV;                                                                    
 LockBasedStack.head[y] := w;                                                                       
 _writeByTPost := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.LockBasedStack.head.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies LockBasedStack.head;                                                                      
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.LockBasedStack.head(u: Tid,y: LockBasedStack,w: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[y] := w;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.LockBasedStack.head(t: Tid,x: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.LockBasedStack.head.LockBasedStack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: LockBasedStack, y: LockBasedStack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(LockBasedStack._state[x], t);                                                
 requires isAccessible(LockBasedStack._state[y], u);                                                
 modifies LockBasedStack.head;                                                                      
 modifies LockBasedStack.head;                                                                      
                                                                                                    
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
 var LockBasedStack._state_pre: [LockBasedStack]State;                                              
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var LockBasedStack.head_pre: [LockBasedStack]Node;                                                 
 var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                 
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var x_pre: LockBasedStack;                                                                         
 var y_pre: LockBasedStack;                                                                         
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var y_post: LockBasedStack;                                                                        
 var $pc_post: Phase;                                                                               
 var x_post: LockBasedStack;                                                                        
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var LockBasedStack._state_post: [LockBasedStack]State;                                             
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                
 var LockBasedStack.head_post: [LockBasedStack]Node;                                                
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.LockBasedStack.head(t: Tid,x: LockBasedStack,v: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 LockBasedStack.head[x] := v;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && LockBasedStack._state_post == LockBasedStack._state && LockBasedStack.head_post == LockBasedStack.head && LockBasedStack._lock_post == LockBasedStack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.LockBasedStack.head(u: Tid,y: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies LockBasedStack._state;                                                                     
modifies LockBasedStack.head;                                                                       
modifies LockBasedStack._lock;                                                                      
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
ensures Y(tid , old(Node._state), old(Node.item), old(Node.next), old(Node._lock), old(LockBasedStack._state), old(LockBasedStack.head), old(LockBasedStack._lock) , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
                                                                                                    
// Node.item:                                                                                       
                                                                                                    
function {:inline} Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.item(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _R)) ==> (Node.item[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.item(u: Tid,this: Node,newValue: int,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, Node.item[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Transitive(tid : Tid, this: Node, newValue : int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var LockBasedStack._state_pre: [LockBasedStack]State;                                               
var newValue_pre: int;                                                                              
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var LockBasedStack.head_pre: [LockBasedStack]Node;                                                  
var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                  
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var LockBasedStack._state_post: [LockBasedStack]State;                                              
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                 
var LockBasedStack.head_post: [LockBasedStack]Node;                                                 
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 assume Y_Node.item(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && LockBasedStack._state_post == LockBasedStack._state_p && LockBasedStack.head_post == LockBasedStack.head_p && LockBasedStack._lock_post == LockBasedStack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _R)) ==> (Node.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var LockBasedStack._state_pre: [LockBasedStack]State;                                               
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var LockBasedStack.head_pre: [LockBasedStack]Node;                                                  
var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                  
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var LockBasedStack._state_post: [LockBasedStack]State;                                              
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                 
var LockBasedStack.head_post: [LockBasedStack]Node;                                                 
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && LockBasedStack._state_post == LockBasedStack._state_p && LockBasedStack.head_post == LockBasedStack.head_p && LockBasedStack._lock_post == LockBasedStack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var newValue_yield: Tid;                                                                            
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _N);
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var LockBasedStack._state_pre: [LockBasedStack]State;                                               
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var LockBasedStack.head_pre: [LockBasedStack]Node;                                                  
var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                  
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var newValue_pre: Tid;                                                                              
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var LockBasedStack._state_post: [LockBasedStack]State;                                              
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                 
var LockBasedStack.head_post: [LockBasedStack]Node;                                                 
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && LockBasedStack._state_post == LockBasedStack._state_p && LockBasedStack.head_post == LockBasedStack.head_p && LockBasedStack._lock_post == LockBasedStack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
// LockBasedStack.head:                                                                             
                                                                                                    
function {:inline} Y_LockBasedStack.head(tid : Tid, this: LockBasedStack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 ((isAccessible(LockBasedStack._state[this], tid) && leq(m#moverPath(ReadEval.LockBasedStack.head(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _R)) ==> (LockBasedStack.head[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_LockBasedStack.head(tid : Tid, this: LockBasedStack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack.head.Subsumes.W(tid : Tid, u : Tid, this: LockBasedStack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Node.item_yield: [Node]int;                                                                     
var this_yield: LockBasedStack;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
 assume isAccessible(LockBasedStack._state[this], u);                                               
 assume !isError(m#moverPath(WriteEval.LockBasedStack.head(u: Tid,this: LockBasedStack,newValue: Node,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_LockBasedStack.head(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack.head.Reflexive(tid : Tid, this: LockBasedStack , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Node.item_yield: [Node]int;                                                                     
var this_yield: LockBasedStack;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_LockBasedStack.head(tid, this, LockBasedStack.head[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack.head.Transitive(tid : Tid, this: LockBasedStack, newValue : Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var LockBasedStack._state_pre: [LockBasedStack]State;                                               
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var LockBasedStack.head_pre: [LockBasedStack]Node;                                                  
var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                  
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var this_pre: LockBasedStack;                                                                       
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var LockBasedStack._state_post: [LockBasedStack]State;                                              
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                 
var LockBasedStack.head_post: [LockBasedStack]Node;                                                 
var this_post: LockBasedStack;                                                                      
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 assume Y_LockBasedStack.head(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && LockBasedStack._state_post == LockBasedStack._state_p && LockBasedStack.head_post == LockBasedStack.head_p && LockBasedStack._lock_post == LockBasedStack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_LockBasedStack.head(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
// LockBasedStack._lock:                                                                            
                                                                                                    
function {:inline} Y_LockBasedStack._lock(tid : Tid, this: LockBasedStack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 ((isAccessible(LockBasedStack._state[this], tid) && leq(m#moverPath(ReadEval.LockBasedStack._lock(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _R)) ==> (LockBasedStack._lock[this] == newValue))
 &&(((LockBasedStack._lock[this]==tid)==(newValue==tid)))                                           
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_LockBasedStack._lock(tid : Tid, this: LockBasedStack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack._lock.Subsumes.W(tid : Tid, u : Tid, this: LockBasedStack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Node.item_yield: [Node]int;                                                                     
var newValue_yield: Tid;                                                                            
var this_yield: LockBasedStack;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
 assume isAccessible(LockBasedStack._state[this], u);                                               
 assume !isError(m#moverPath(WriteEval.LockBasedStack._lock(u: Tid,this: LockBasedStack,newValue: Tid,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)));
 assume leq(m#moverPath(ReadEval.LockBasedStack._lock(tid: Tid,this: LockBasedStack,Node._state,Node.item,Node.next,Node._lock,LockBasedStack._state,LockBasedStack.head,LockBasedStack._lock)), _N);
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_LockBasedStack._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack._lock.Reflexive(tid : Tid, this: LockBasedStack , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Node.item_yield: [Node]int;                                                                     
var this_yield: LockBasedStack;                                                                     
var LockBasedStack._state_yield: [LockBasedStack]State;                                             
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var LockBasedStack.head_yield: [LockBasedStack]Node;                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var LockBasedStack._lock_yield: [LockBasedStack]Tid;                                                
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && LockBasedStack._state_yield == LockBasedStack._state && LockBasedStack.head_yield == LockBasedStack.head && LockBasedStack._lock_yield == LockBasedStack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_LockBasedStack._lock(tid, this, LockBasedStack._lock[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
procedure Y_LockBasedStack._lock.Transitive(tid : Tid, this: LockBasedStack, newValue : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var LockBasedStack._state_pre: [LockBasedStack]State;                                               
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var LockBasedStack.head_pre: [LockBasedStack]Node;                                                  
var LockBasedStack._lock_pre: [LockBasedStack]Tid;                                                  
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var this_pre: LockBasedStack;                                                                       
var newValue_pre: Tid;                                                                              
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var LockBasedStack._state_post: [LockBasedStack]State;                                              
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var LockBasedStack._lock_post: [LockBasedStack]Tid;                                                 
var LockBasedStack.head_post: [LockBasedStack]Node;                                                 
var newValue_post: Tid;                                                                             
var this_post: LockBasedStack;                                                                      
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && LockBasedStack._state_pre == LockBasedStack._state && LockBasedStack.head_pre == LockBasedStack.head && LockBasedStack._lock_pre == LockBasedStack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(LockBasedStack._state[this], tid);                                             
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
 assume Y_LockBasedStack._lock(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, LockBasedStack._state_p, LockBasedStack.head_p, LockBasedStack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && LockBasedStack._state_post == LockBasedStack._state_p && LockBasedStack.head_post == LockBasedStack.head_p && LockBasedStack._lock_post == LockBasedStack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_LockBasedStack._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, LockBasedStack._state: [LockBasedStack]State, LockBasedStack.head: [LockBasedStack]Node, LockBasedStack._lock: [LockBasedStack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, LockBasedStack._state_p: [LockBasedStack]State, LockBasedStack.head_p: [LockBasedStack]Node, LockBasedStack._lock_p: [LockBasedStack]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.item(tid : Tid, this, Node.item_p[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock))
 && (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock))
 && (forall this: LockBasedStack :: Y_LockBasedStack.head(tid : Tid, this, LockBasedStack.head_p[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock))
 && (forall this: LockBasedStack :: Y_LockBasedStack._lock(tid : Tid, this, LockBasedStack._lock_p[this] , Node._state, Node.item, Node.next, Node._lock, LockBasedStack._state, LockBasedStack.head, LockBasedStack._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
 && (forall _i : LockBasedStack :: isShared(LockBasedStack._state[_i]) ==> isShared(LockBasedStack._state_p[_i]))
 && (forall _i : LockBasedStack :: isLocal(LockBasedStack._state[_i], tid) <==> isLocal(LockBasedStack._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 983.1-1216.2: (Method:15.5)
// 994.1-994.24: (15.5): Bad tid
// 995.1-995.48: (15.5): this is not global
// 1085.1-1085.38: (18.9): Cannot have potential null deference in left-mover part.
// 1089.1-1089.27: (18.9): Reduction failure
// 1091.2-1093.2: (class anchor.sink.VarDeclStmt:19.9)
// 1094.2-1102.39: (class anchor.sink.Alloc:19.9)
// 1103.2-1105.2: (class anchor.sink.VarDeclStmt:19.9)
// 1106.2-1123.36: (class anchor.sink.Read:19.9)
// 1118.1-1118.38: (19.9): Cannot have potential null deference in left-mover part.
// 1122.1-1122.27: (19.9): Reduction failure
// 1126.2-1128.2: (class anchor.sink.VarDeclStmt:19.9)
// 1129.2-1131.2: (class anchor.sink.VarDeclStmt:19.9)
// 1132.2-1134.2: (class anchor.sink.VarDeclStmt:19.9)
// 1135.2-1138.18: (class anchor.sink.Assign:19.9)
// 1139.2-1142.18: (class anchor.sink.Assign:19.9)
// 1143.2-1146.18: (class anchor.sink.Assign:19.9)
// 1147.2-1150.33: (class anchor.sink.Assume:5.5)
// 1151.2-1154.41: (class anchor.sink.Assume:5.5)
// 1156.2-1172.32: (class anchor.sink.Write:6.9)
// 1168.1-1168.31: (6.9): Cannot have potential null deference in left-mover part.
// 1171.1-1171.27: (6.9): Reduction failure
// 1174.2-1195.2: (class anchor.sink.Write:7.9)
// 1186.1-1186.31: (7.9): Cannot have potential null deference in left-mover part.
// 1189.1-1189.27: (7.9): Reduction failure
// 1193.1-1193.62: (7.9): next$16 became shared, but next$16.next may not be shared.
// 1196.2-1199.22: (class anchor.sink.Break:5.31)
// 1204.1-1204.38: (21.9): Cannot have potential null deference in left-mover part.
// 1206.1-1206.43: (21.9): lock not held
// 1208.1-1208.27: (21.9): Reduction failure
// 1210.2-1215.9: (class anchor.sink.Return:17.32)
// 1217.1-1663.2: (Method:24.5)
// 1229.1-1229.24: (24.5): Bad tid
// 1230.1-1230.48: (24.5): this is not global
// 1446.2-1450.14: (class anchor.sink.While:28.9)
// 1452.1-1452.27: (24.5): Bad tid
// 1453.1-1453.51: (24.5): this is not global
// 1456.1-1456.245: (28.9): Loop does not preserve yields_as annotation for field item
// 1457.1-1457.245: (28.9): Loop does not preserve yields_as annotation for field next
// 1458.1-1458.275: (28.9): Loop does not preserve yields_as annotation for field head
// 1459.1-1459.32: (28.9): Phase must be invariant at loop head
// 1460.1-1460.30: (28.9): Potentially infinite loop cannot be in post-commit phase.
// 1462.3-1464.3: (class anchor.sink.VarDeclStmt:28.16)
// 1465.3-1468.16: (class anchor.sink.Assign:28.16)
// 1470.4-1473.10: (class anchor.sink.Break:28.9)
// 1476.3-1478.3: (class anchor.sink.VarDeclStmt:30.13)
// 1479.3-1481.3: (class anchor.sink.VarDeclStmt:30.13)
// 1482.3-1499.37: (class anchor.sink.Read:30.13)
// 1494.1-1494.39: (30.13): Cannot have potential null deference in left-mover part.
// 1498.1-1498.28: (30.13): Reduction failure
// 1500.3-1503.29: (class anchor.sink.Assign:30.13)
// 1505.4-1508.10: (class anchor.sink.Break:31.17)
// 1514.1-1514.39: (33.13): Cannot have potential null deference in left-mover part.
// 1516.1-1516.44: (33.13): lock not held
// 1518.1-1518.28: (33.13): Reduction failure
// 1520.3-1528.42: (class anchor.sink.Yield:34.13)
// 1531.1-1531.29: (28.9): Phase must be invariant at loop head
// 1533.2-1535.2: (class anchor.sink.VarDeclStmt:36.9)
// 1536.2-1538.2: (class anchor.sink.VarDeclStmt:36.9)
// 1539.2-1556.36: (class anchor.sink.Read:36.9)
// 1551.1-1551.38: (36.9): Cannot have potential null deference in left-mover part.
// 1555.1-1555.27: (36.9): Reduction failure
// 1557.2-1574.27: (class anchor.sink.Read:36.9)
// 1569.1-1569.28: (36.9): Cannot have potential null deference in left-mover part.
// 1573.1-1573.27: (36.9): Reduction failure
// 1575.2-1577.2: (class anchor.sink.VarDeclStmt:37.9)
// 1578.2-1580.2: (class anchor.sink.VarDeclStmt:37.9)
// 1581.2-1598.36: (class anchor.sink.Read:37.9)
// 1593.1-1593.38: (37.9): Cannot have potential null deference in left-mover part.
// 1597.1-1597.27: (37.9): Reduction failure
// 1599.2-1616.26: (class anchor.sink.Read:37.9)
// 1611.1-1611.28: (37.9): Cannot have potential null deference in left-mover part.
// 1615.1-1615.27: (37.9): Reduction failure
// 1618.2-1639.2: (class anchor.sink.Write:37.9)
// 1630.1-1630.38: (37.9): Cannot have potential null deference in left-mover part.
// 1633.1-1633.27: (37.9): Reduction failure
// 1637.1-1637.59: (37.9): tmp6 became shared, but tmp6.next may not be shared.
// 1643.1-1643.38: (38.9): Cannot have potential null deference in left-mover part.
// 1645.1-1645.43: (38.9): lock not held
// 1647.1-1647.27: (38.9): Reduction failure
// 1649.2-1655.9: (class anchor.sink.Return:39.9)
// 1656.2-1662.9: (class anchor.sink.Return:27.22)
// 1750.1-1750.34: (2.5): Node.item failed Write-Write Right-Mover Check
// 1815.1-1815.30: (2.5): Node.item failed Write-Read Right-Mover Check
// 1884.1-1884.34: (2.5): Node.item failed Write-Write Left-Mover Check
// 1950.1-1950.30: (2.5): Node.item failed Write-Read Left-Mover Check
// 2013.1-2013.34: (2.5): Node.item failed Read-Write Right-Mover Check
// 2079.1-2079.34: (2.5): Node.item failed Read-Write Left-Mover Check
// 2144.1-2144.34: (3.5): Node.next failed Write-Write Right-Mover Check
// 2209.1-2209.30: (3.5): Node.next failed Write-Read Right-Mover Check
// 2278.1-2278.34: (3.5): Node.next failed Write-Write Left-Mover Check
// 2344.1-2344.30: (3.5): Node.next failed Write-Read Left-Mover Check
// 2407.1-2407.34: (3.5): Node.next failed Read-Write Right-Mover Check
// 2473.1-2473.34: (3.5): Node.next failed Read-Write Left-Mover Check
// 2538.1-2538.34: (13.5): LockBasedStack.head failed Write-Write Right-Mover Check
// 2603.1-2603.30: (13.5): LockBasedStack.head failed Write-Read Right-Mover Check
// 2672.1-2672.34: (13.5): LockBasedStack.head failed Write-Write Left-Mover Check
// 2738.1-2738.30: (13.5): LockBasedStack.head failed Write-Read Left-Mover Check
// 2801.1-2801.34: (13.5): LockBasedStack.head failed Read-Write Right-Mover Check
// 2867.1-2867.34: (13.5): LockBasedStack.head failed Read-Write Left-Mover Check
// 2944.1-2944.140: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
// 2945.1-2945.101: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
// 2946.1-2946.158: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
// 3051.1-3051.140: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
// 3161.1-3161.144: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
// 3162.1-3162.144: (2.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
// 3239.1-3239.136: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
// 3240.1-3240.136: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
// 3241.1-3241.146: (2.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
// 3317.1-3317.136: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
// 3318.1-3318.136: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
// 3319.1-3319.99: (2.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
// 3397.1-3397.140: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
// 3398.1-3398.101: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
// 3399.1-3399.158: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
// 3504.1-3504.140: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
// 3614.1-3614.144: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
// 3615.1-3615.144: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
// 3692.1-3692.136: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
// 3693.1-3693.136: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
// 3694.1-3694.146: (2.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
// 3770.1-3770.136: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
// 3771.1-3771.136: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
// 3772.1-3772.99: (3.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
// 3850.1-3850.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.1)
// 3851.1-3851.101: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.2)
// 3852.1-3852.156: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case A.3)
// 3957.1-3957.140: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case C)
// 4067.1-4067.144: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case D)
// 4068.1-4068.144: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case R)
// 4145.1-4145.136: (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case F)
// 4146.1-4146.136: (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case H)
// 4147.1-4147.144: (2.5): Node.item is not Read-Write Stable with respect to LockBasedStack.head (case I)
// 4223.1-4223.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case J)
// 4224.1-4224.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case K)
// 4225.1-4225.99: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.item (case L)
// 4303.1-4303.140: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
// 4304.1-4304.101: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
// 4305.1-4305.158: (2.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
// 4410.1-4410.140: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
// 4520.1-4520.144: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
// 4521.1-4521.144: (3.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
// 4598.1-4598.136: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
// 4599.1-4599.136: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
// 4600.1-4600.146: (3.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
// 4676.1-4676.136: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
// 4677.1-4677.136: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
// 4678.1-4678.99: (2.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
// 4756.1-4756.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 4757.1-4757.101: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 4758.1-4758.158: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 4863.1-4863.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 4973.1-4973.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 4974.1-4974.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 5051.1-5051.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 5052.1-5052.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 5053.1-5053.146: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 5129.1-5129.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 5130.1-5130.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 5131.1-5131.99: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 5209.1-5209.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.1)
// 5210.1-5210.101: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.2)
// 5211.1-5211.156: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case A.3)
// 5316.1-5316.140: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case C)
// 5426.1-5426.144: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case D)
// 5427.1-5427.144: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case R)
// 5504.1-5504.136: (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case F)
// 5505.1-5505.136: (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case H)
// 5506.1-5506.144: (3.5): Node.next is not Read-Write Stable with respect to LockBasedStack.head (case I)
// 5582.1-5582.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case J)
// 5583.1-5583.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case K)
// 5584.1-5584.99: (13.5): LockBasedStack.head is not Write-Read Stable with respect to Node.next (case L)
// 5662.1-5662.140: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
// 5663.1-5663.101: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
// 5664.1-5664.156: (2.5): Node.item is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
// 5769.1-5769.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case C)
// 5879.1-5879.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case D)
// 5880.1-5880.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.item (case R)
// 5957.1-5957.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case F)
// 5958.1-5958.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case H)
// 5959.1-5959.144: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.item (case I)
// 6035.1-6035.136: (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case J)
// 6036.1-6036.136: (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case K)
// 6037.1-6037.99: (2.5): Node.item is not Write-Read Stable with respect to LockBasedStack.head (case L)
// 6115.1-6115.140: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
// 6116.1-6116.101: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
// 6117.1-6117.156: (3.5): Node.next is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
// 6222.1-6222.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case C)
// 6332.1-6332.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case D)
// 6333.1-6333.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to Node.next (case R)
// 6410.1-6410.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case F)
// 6411.1-6411.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case H)
// 6412.1-6412.144: (13.5): LockBasedStack.head is not Read-Write Stable with respect to Node.next (case I)
// 6488.1-6488.136: (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case J)
// 6489.1-6489.136: (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case K)
// 6490.1-6490.99: (3.5): Node.next is not Write-Read Stable with respect to LockBasedStack.head (case L)
// 6568.1-6568.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.1)
// 6569.1-6569.101: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.2)
// 6570.1-6570.158: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case A.3)
// 6675.1-6675.140: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case C)
// 6785.1-6785.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case D)
// 6786.1-6786.144: (13.5): LockBasedStack.head is not Write-Write Stable with respect to LockBasedStack.head (case R)
// 6863.1-6863.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case F)
// 6864.1-6864.136: (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case H)
// 6865.1-6865.146: (13.5): LockBasedStack.head is not Read-Write Stable with respect to LockBasedStack.head (case I)
// 6941.1-6941.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case J)
// 6942.1-6942.136: (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case K)
// 6943.1-6943.99: (13.5): LockBasedStack.head is not Write-Read Stable with respect to LockBasedStack.head (case L)
// 6978.1-7001.2: (2.5): yields_as clause for Node.item is not valid
// 7006.1-7024.2: (2.5): yields_as clause for Node.item is not reflexive
// 7030.1-7066.2: (2.5): yields_as clause for Node.item is not transitive
// 7085.1-7108.2: (3.5): yields_as clause for Node.next is not valid
// 7113.1-7131.2: (3.5): yields_as clause for Node.next is not reflexive
// 7137.1-7173.2: (3.5): yields_as clause for Node.next is not transitive
// 7193.1-7216.2: (7.32): yields_as clause for Node._lock is not valid
// 7221.1-7239.2: (7.32): yields_as clause for Node._lock is not reflexive
// 7245.1-7281.2: (7.32): yields_as clause for Node._lock is not transitive
// 7300.1-7323.2: (13.5): yields_as clause for LockBasedStack.head is not valid
// 7328.1-7346.2: (13.5): yields_as clause for LockBasedStack.head is not reflexive
// 7352.1-7388.2: (13.5): yields_as clause for LockBasedStack.head is not transitive
// 7408.1-7431.2: (7.32): yields_as clause for LockBasedStack._lock is not valid
// 7436.1-7454.2: (7.32): yields_as clause for LockBasedStack._lock is not reflexive
// 7460.1-7496.2: (7.32): yields_as clause for LockBasedStack._lock is not transitive
