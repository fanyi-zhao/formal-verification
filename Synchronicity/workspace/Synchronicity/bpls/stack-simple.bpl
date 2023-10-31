                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stack-simple.anchor:                    
                                                                                                    
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
    class Stack {                                                                                   
       Node head isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.head == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int push(int item) {                                                                   
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        node.init(item,tmp1)                                                                        
        this.head := node;                                                                          
        release(this);                                                                              
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop() {                                                                            
        int value;                                                                                  
        acquire(this);                                                                              
        boolean tmp2;                                                                               
        Node tmp3;                                                                                  
        tmp3 := this.head;                                                                          
        tmp2 = tmp3 != Node.null;                                                                   
        if (tmp2 /* == this.head != Node.null */) {                                                 
          Node tmp4;                                                                                
          tmp4 := this.head;                                                                        
          value := tmp4.item;                                                                       
          Node tmp5;                                                                                
          Node tmp6;                                                                                
          tmp6 := this.head;                                                                        
          tmp5 := tmp6.next;                                                                        
          this.head := tmp5;                                                                        
        } else {                                                                                    
          value = -1;                                                                               
        }                                                                                           
        release(this);                                                                              
         return value;                                                                              
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop2() {                                                                           
        synchronized (this) {                                                                       
          boolean tmp7;                                                                             
          Node tmp8;                                                                                
          tmp8 := this.head;                                                                        
          tmp7 = tmp8 == Node.null;                                                                 
          if (tmp7 /* == this.head == Node.null */) {                                               
            int tmp9;                                                                               
            tmp9 = -1;                                                                              
             return tmp9;                                                                           
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        }                                                                                           
        synchronized (this) {                                                                       
          int value;                                                                                
          Node tmp10;                                                                               
          tmp10 := this.head;                                                                       
          value := tmp10.item;                                                                      
          Node tmp11;                                                                               
          Node tmp12;                                                                               
          tmp12 := this.head;                                                                       
          tmp11 := tmp12.next;                                                                      
          this.head := tmp11;                                                                       
           return value;                                                                            
        }                                                                                           
        // return -1;                                                                               
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop3() {                                                                           
        synchronized (this) {                                                                       
          boolean tmp13;                                                                            
          Node tmp14;                                                                               
          tmp14 := this.head;                                                                       
          tmp13 = tmp14 == Node.null;                                                               
          if (tmp13 /* == this.head == Node.null */) {                                              
            int tmp15;                                                                              
            tmp15 = -1;                                                                             
             return tmp15;                                                                          
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          boolean tmp16;                                                                            
          Node tmp17;                                                                               
          tmp17 := this.head;                                                                       
          tmp16 = tmp17 != Node.null;                                                               
          assert tmp16 /* == this.head != Node.null */;                                             
          int value;                                                                                
          Node tmp18;                                                                               
          tmp18 := this.head;                                                                       
          value := tmp18.item;                                                                      
          Node tmp19;                                                                               
          Node tmp20;                                                                               
          tmp20 := this.head;                                                                       
          tmp19 := tmp20.next;                                                                      
          this.head := tmp19;                                                                       
           return value;                                                                            
        }                                                                                           
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
    class Stack {                                                                                   
       Node head isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int push(int item) {                                                                   
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        node.init(item,tmp1)                                                                        
        this.head := node;                                                                          
        release(this);                                                                              
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop() {                                                                            
        int value;                                                                                  
        acquire(this);                                                                              
        boolean tmp2;                                                                               
        Node tmp3;                                                                                  
        tmp3 := this.head;                                                                          
        tmp2 = tmp3 != Node.null;                                                                   
        if (tmp2 /* == this.head != Node.null */) {                                                 
          Node tmp4;                                                                                
          tmp4 := this.head;                                                                        
          value := tmp4.item;                                                                       
          Node tmp5;                                                                                
          Node tmp6;                                                                                
          tmp6 := this.head;                                                                        
          tmp5 := tmp6.next;                                                                        
          this.head := tmp5;                                                                        
        } else {                                                                                    
          value = -1;                                                                               
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop2() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp7;                                                                           
            Node tmp8;                                                                              
            tmp8 := this.head;                                                                      
            tmp7 = tmp8 == Node.null;                                                               
            if (tmp7 /* == this.head == Node.null */) {                                             
              int tmp9;                                                                             
              tmp9 = -1;                                                                            
              {                                                                                     
                release(this);                                                                      
                 return tmp9;                                                                       
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int value;                                                                              
            Node tmp10;                                                                             
            tmp10 := this.head;                                                                     
            value := tmp10.item;                                                                    
            Node tmp11;                                                                             
            Node tmp12;                                                                             
            tmp12 := this.head;                                                                     
            tmp11 := tmp12.next;                                                                    
            this.head := tmp11;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop3() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp13;                                                                          
            Node tmp14;                                                                             
            tmp14 := this.head;                                                                     
            tmp13 = tmp14 == Node.null;                                                             
            if (tmp13 /* == this.head == Node.null */) {                                            
              int tmp15;                                                                            
              tmp15 = -1;                                                                           
              {                                                                                     
                release(this);                                                                      
                 return tmp15;                                                                      
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp16;                                                                          
            Node tmp17;                                                                             
            tmp17 := this.head;                                                                     
            tmp16 = tmp17 != Node.null;                                                             
            assert tmp16 /* == this.head != Node.null */;                                           
            int value;                                                                              
            Node tmp18;                                                                             
            tmp18 := this.head;                                                                     
            value := tmp18.item;                                                                    
            Node tmp19;                                                                             
            Node tmp20;                                                                             
            tmp20 := this.head;                                                                     
            tmp19 := tmp20.next;                                                                    
            this.head := tmp19;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
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
    class Stack {                                                                                   
       Node head isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int push(int item) {                                                                   
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        {                                                                                           
          inlined node.init(item,tmp1);                                                             
          exit$255: {                                                                               
            int item$255;                                                                           
            Node next$255;                                                                          
            Node this$255;                                                                          
            item$255 = item;                                                                        
            next$255 = tmp1;                                                                        
            this$255 = node;                                                                        
            {                                                                                       
              assume this$255.item == 0;                                                            
              assume this$255.next == Node.null;                                                    
              {                                                                                     
                this$255.item := item$255;                                                          
                this$255.next := next$255;                                                          
                {                                                                                   
                  break exit$255;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        this.head := node;                                                                          
        release(this);                                                                              
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop() {                                                                            
        int value;                                                                                  
        acquire(this);                                                                              
        boolean tmp2;                                                                               
        Node tmp3;                                                                                  
        tmp3 := this.head;                                                                          
        tmp2 = tmp3 != Node.null;                                                                   
        if (tmp2 /* == this.head != Node.null */) {                                                 
          Node tmp4;                                                                                
          tmp4 := this.head;                                                                        
          value := tmp4.item;                                                                       
          Node tmp5;                                                                                
          Node tmp6;                                                                                
          tmp6 := this.head;                                                                        
          tmp5 := tmp6.next;                                                                        
          this.head := tmp5;                                                                        
        } else {                                                                                    
          value = -1;                                                                               
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop2() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp7;                                                                           
            Node tmp8;                                                                              
            tmp8 := this.head;                                                                      
            tmp7 = tmp8 == Node.null;                                                               
            if (tmp7 /* == this.head == Node.null */) {                                             
              int tmp9;                                                                             
              tmp9 = -1;                                                                            
              {                                                                                     
                release(this);                                                                      
                 return tmp9;                                                                       
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int value;                                                                              
            Node tmp10;                                                                             
            tmp10 := this.head;                                                                     
            value := tmp10.item;                                                                    
            Node tmp11;                                                                             
            Node tmp12;                                                                             
            tmp12 := this.head;                                                                     
            tmp11 := tmp12.next;                                                                    
            this.head := tmp11;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop3() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp13;                                                                          
            Node tmp14;                                                                             
            tmp14 := this.head;                                                                     
            tmp13 = tmp14 == Node.null;                                                             
            if (tmp13 /* == this.head == Node.null */) {                                            
              int tmp15;                                                                            
              tmp15 = -1;                                                                           
              {                                                                                     
                release(this);                                                                      
                 return tmp15;                                                                      
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp16;                                                                          
            Node tmp17;                                                                             
            tmp17 := this.head;                                                                     
            tmp16 = tmp17 != Node.null;                                                             
            assert tmp16 /* == this.head != Node.null */;                                           
            int value;                                                                              
            Node tmp18;                                                                             
            tmp18 := this.head;                                                                     
            value := tmp18.item;                                                                    
            Node tmp19;                                                                             
            Node tmp20;                                                                             
            tmp20 := this.head;                                                                     
            tmp19 := tmp20.next;                                                                    
            this.head := tmp19;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
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
    class Stack {                                                                                   
       Node head isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int push(int item) {                                                                   
        acquire(this);                                                                              
        Node node;                                                                                  
        node = new Node();                                                                          
        Node tmp1;                                                                                  
        tmp1 := this.head;                                                                          
        {                                                                                           
          inlined node.init(item,tmp1);                                                             
          exit$255: {                                                                               
            int item$255;                                                                           
            Node next$255;                                                                          
            Node this$255;                                                                          
            item$255 = item;                                                                        
            next$255 = tmp1;                                                                        
            this$255 = node;                                                                        
            {                                                                                       
              assume this$255.item == 0;                                                            
              assume this$255.next == Node.null;                                                    
              {                                                                                     
                this$255.item := item$255;                                                          
                this$255.next := next$255;                                                          
                {                                                                                   
                  break exit$255;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        this.head := node;                                                                          
        release(this);                                                                              
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop() {                                                                            
        int value;                                                                                  
        acquire(this);                                                                              
        boolean tmp2;                                                                               
        Node tmp3;                                                                                  
        tmp3 := this.head;                                                                          
        tmp2 = tmp3 != Node.null;                                                                   
        if (tmp2 /* == this.head != Node.null */) {                                                 
          Node tmp4;                                                                                
          tmp4 := this.head;                                                                        
          value := tmp4.item;                                                                       
          Node tmp5;                                                                                
          Node tmp6;                                                                                
          tmp6 := this.head;                                                                        
          tmp5 := tmp6.next;                                                                        
          this.head := tmp5;                                                                        
        } else {                                                                                    
          value = -1;                                                                               
        }                                                                                           
        release(this);                                                                              
        {                                                                                           
           return value;                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop2() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp7;                                                                           
            Node tmp8;                                                                              
            tmp8 := this.head;                                                                      
            tmp7 = tmp8 == Node.null;                                                               
            if (tmp7 /* == this.head == Node.null */) {                                             
              int tmp9;                                                                             
              tmp9 = -1;                                                                            
              {                                                                                     
                release(this);                                                                      
                 return tmp9;                                                                       
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int value;                                                                              
            Node tmp10;                                                                             
            tmp10 := this.head;                                                                     
            value := tmp10.item;                                                                    
            Node tmp11;                                                                             
            Node tmp12;                                                                             
            tmp12 := this.head;                                                                     
            tmp11 := tmp12.next;                                                                    
            this.head := tmp11;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return -1;                                                                             
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public int pop3() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp13;                                                                          
            Node tmp14;                                                                             
            tmp14 := this.head;                                                                     
            tmp13 = tmp14 == Node.null;                                                             
            if (tmp13 /* == this.head == Node.null */) {                                            
              int tmp15;                                                                            
              tmp15 = -1;                                                                           
              {                                                                                     
                release(this);                                                                      
                 return tmp15;                                                                      
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean tmp16;                                                                          
            Node tmp17;                                                                             
            tmp17 := this.head;                                                                     
            tmp16 = tmp17 != Node.null;                                                             
            assert tmp16 /* == this.head != Node.null */;                                           
            int value;                                                                              
            Node tmp18;                                                                             
            tmp18 := this.head;                                                                     
            value := tmp18.item;                                                                    
            Node tmp19;                                                                             
            Node tmp20;                                                                             
            tmp20 := this.head;                                                                     
            tmp19 := tmp20.next;                                                                    
            this.head := tmp19;                                                                     
            {                                                                                       
              release(this);                                                                        
               return value;                                                                        
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
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
                                                                                                    
function {:inline} ReadEval.Node.item(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node.item(tid: Tid,this : Node,newValue: int,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} ReadEval.Stack.head(tid: Tid,this : Stack,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isLocal(Stack._state[this], tid)) then                                                        
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Stack._state[this], tid) && Stack._lock[this] == tid)) then                     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack.head(tid: Tid,this : Stack,newValue: Node,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isLocal(Stack._state[this], tid)) then                                                        
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(Stack._state[this], tid) && Stack._lock[this] == tid)) then                     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack._lock: [Stack]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Stack._lock(tid: Tid,this : Stack,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Stack._lock(tid: Tid,this : Stack,newValue: Tid,Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Stack.push(tid:Tid, this : Stack, item : int)                                            
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (18.5): Bad tid
requires isShared(Stack._state[this]);                                                                     // (18.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
{                                                                                                   
 var Stack.head4380898: [Stack]Node;                                                                
 var mover4380883: Mover;                                                                           
 var Node.next4380903: [Node]Node;                                                                  
 var $recorded.state4380883: int;                                                                   
 var this4380903: Stack;                                                                            
 var Node.item4380883: [Node]int;                                                                   
 var $result4380903: int;                                                                           
 var path4380845: int;                                                                              
 var moverPath4380845: MoverPath;                                                                   
 var path4380883: int;                                                                              
 var $recorded.state4380880: int;                                                                   
 var Node._state4380880: [Node]State;                                                               
 var this$255: Node;                                                                                
 var Node.item4380903: [Node]int;                                                                   
 var $recorded.state4380898: int;                                                                   
 var item$255: int;                                                                                 
 var node: Node;                                                                                    
 var Stack.head4380880: [Stack]Node;                                                                
 var Node.item4380898: [Node]int;                                                                   
 var this4380880: Stack;                                                                            
 var Node.item4380845: [Node]int;                                                                   
 var tid4380898: Tid;                                                                               
 var moverPath4380883: MoverPath;                                                                   
 var Node.next4380898: [Node]Node;                                                                  
 var Stack._state4380883: [Stack]State;                                                             
 var $pc4380845: Phase;                                                                             
 var next$2554380880: Node;                                                                         
 var $result4380880: int;                                                                           
 var Node.next4380880: [Node]Node;                                                                  
 var Node._lock4380880: [Node]Tid;                                                                  
 var moverPath4380898: MoverPath;                                                                   
 var $pc4380880: Phase;                                                                             
 var node4380883: Node;                                                                             
 var tid4380903: Tid;                                                                               
 var node4380880: Node;                                                                             
 var Node._state4380898: [Node]State;                                                               
 var Node._state4380845: [Node]State;                                                               
 var Stack.head4380903: [Stack]Node;                                                                
 var Stack._state4380880: [Stack]State;                                                             
 var Stack._state4380898: [Stack]State;                                                             
 var $pc4380903: Phase;                                                                             
 var tmp1: Node;                                                                                    
 var node4380903: Node;                                                                             
 var Stack._lock4380883: [Stack]Tid;                                                                
 var this$2554380880: Node;                                                                         
 var Stack._state4380845: [Stack]State;                                                             
 var Stack._state4380903: [Stack]State;                                                             
 var item4380903: int;                                                                              
 var Stack._lock4380903: [Stack]Tid;                                                                
 var tid4380880: Tid;                                                                               
 var this4380883: Stack;                                                                            
 var Node._lock4380903: [Node]Tid;                                                                  
 var next$2554380883: Node;                                                                         
 var Node.item4380880: [Node]int;                                                                   
 var node4380845: Node;                                                                             
 var tmp14380845: Node;                                                                             
 var mover4380845: Mover;                                                                           
 var $result4380883: int;                                                                           
 var Node.next4380845: [Node]Node;                                                                  
 var node4380898: Node;                                                                             
 var mover4380880: Mover;                                                                           
 var Stack.head4380883: [Stack]Node;                                                                
 var Stack._lock4380845: [Stack]Tid;                                                                
 var Node._lock4380845: [Node]Tid;                                                                  
 var mover4380898: Mover;                                                                           
 var this$2554380883: Node;                                                                         
 var $recorded.state4380903: int;                                                                   
 var Stack.head4380845: [Stack]Node;                                                                
 var tmp14380880: Node;                                                                             
 var moverPath4380880: MoverPath;                                                                   
 var Node._state4380883: [Node]State;                                                               
 var Stack._lock4380898: [Stack]Tid;                                                                
 var this4380898: Stack;                                                                            
 var Node._state4380903: [Node]State;                                                               
 var Node._lock4380898: [Node]Tid;                                                                  
 var path4380880: int;                                                                              
 var tmp14380883: Node;                                                                             
 var $result4380845: int;                                                                           
 var item4380880: int;                                                                              
 var tid4380845: Tid;                                                                               
 var Stack._lock4380880: [Stack]Tid;                                                                
 var Node._lock4380883: [Node]Tid;                                                                  
 var $pc4380898: Phase;                                                                             
 var Node.next4380883: [Node]Node;                                                                  
 var this4380845: Stack;                                                                            
 var item$2554380883: int;                                                                          
 var item$2554380880: int;                                                                          
 var $pc4380883: Phase;                                                                             
 var item4380898: int;                                                                              
 var next$255: Node;                                                                                
 var $recorded.state4380845: int;                                                                   
 var tid4380883: Tid;                                                                               
 var tmp14380898: Node;                                                                             
 var path4380898: int;                                                                              
 var item4380883: int;                                                                              
 var item4380845: int;                                                                              
 var $result4380898: int;                                                                           
 var tmp14380903: Node;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (19.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (19.9): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 20.9: Node node;                                                                                
                                                                                                    
                                                                                                    
 // 20.9: node = new Node();                                                                        
                                                                                                    
 havoc node;                                                                                        
 assume node != Node.null && isFresh(Node._state[node]);                                            
 Node._state[node] := LOCAL(tid);                                                                   
 assume Node.item[node]  == 0;                                                                      
 assume Node.next[node]  == Node.null;                                                              
 assume Node._lock[node]  == Tid.null;                                                              
                                                                                                    
 // 20.9: Node tmp1;                                                                                
                                                                                                    
                                                                                                    
 // 20.9: tmp1 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath4380845 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380845 := m#moverPath(moverPath4380845);                                                     
 path4380845 := p#moverPath(moverPath4380845);                                                      
 assume Node._state4380845 == Node._state && Node.item4380845 == Node.item && Node.next4380845 == Node.next && Node._lock4380845 == Node._lock && Stack._state4380845 == Stack._state && Stack.head4380845 == Stack.head && Stack._lock4380845 == Stack._lock && tmp14380845 == tmp1 && node4380845 == node && $result4380845 == $result && item4380845 == item && this4380845 == this && tid4380845 == tid && $pc4380845 == $pc;
 assume $recorded.state4380845 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4380845);                                                              
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 tmp1 := Stack.head[this];                                                                          
 // inlined: node.init(item,tmp1)}                                                                  
 exit$255_top:                                                                                      
                                                                                                    
 // 20.9: int item$255;                                                                             
                                                                                                    
                                                                                                    
 // 20.9: Node next$255;                                                                            
                                                                                                    
                                                                                                    
 // 20.9: Node this$255;                                                                            
                                                                                                    
                                                                                                    
 // 20.9: item$255 = item;                                                                          
                                                                                                    
 item$255 := item;                                                                                  
                                                                                                    
 // 20.9: next$255 = tmp1;                                                                          
                                                                                                    
 next$255 := tmp1;                                                                                  
                                                                                                    
 // 20.9: this$255 = node;                                                                          
                                                                                                    
 this$255 := node;                                                                                  
                                                                                                    
 // 7.5: assume this$255.item == 0;                                                                 
                                                                                                    
 assume (Node.item[this$255]==0);                                                                   
                                                                                                    
 // 7.5: assume this$255.next == Node.null;                                                         
                                                                                                    
 assume (Node.next[this$255]==Node.null);                                                           
                                                                                                    
                                                                                                    
 // 8.7: this$255.item := item$255;                                                                 
                                                                                                    
                                                                                                    
 moverPath4380880 := WriteEval.Node.item(tid: Tid,this$255: Node,item$255: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380880 := m#moverPath(moverPath4380880);                                                     
 path4380880 := p#moverPath(moverPath4380880);                                                      
 assume Node._state4380880 == Node._state && Node.item4380880 == Node.item && Node.next4380880 == Node.next && Node._lock4380880 == Node._lock && Stack._state4380880 == Stack._state && Stack.head4380880 == Stack.head && Stack._lock4380880 == Stack._lock && this$2554380880 == this$255 && next$2554380880 == next$255 && item$2554380880 == item$255 && tmp14380880 == tmp1 && node4380880 == node && $result4380880 == $result && item4380880 == item && this4380880 == this && tid4380880 == tid && $pc4380880 == $pc;
 assume $recorded.state4380880 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$255 != Node.null;                                                                     
 } else {                                                                                           
  assert this$255 != Node.null;                                                                            // (8.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4380880);                                                              
 assert $pc != PhaseError;                                                                                 // (8.7): Reduction failure
 Node.item[this$255] := item$255;                                                                   
                                                                                                    
                                                                                                    
 // 9.7: this$255.next := next$255;                                                                 
                                                                                                    
                                                                                                    
 moverPath4380883 := WriteEval.Node.next(tid: Tid,this$255: Node,next$255: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380883 := m#moverPath(moverPath4380883);                                                     
 path4380883 := p#moverPath(moverPath4380883);                                                      
 assume Node._state4380883 == Node._state && Node.item4380883 == Node.item && Node.next4380883 == Node.next && Node._lock4380883 == Node._lock && Stack._state4380883 == Stack._state && Stack.head4380883 == Stack.head && Stack._lock4380883 == Stack._lock && this$2554380883 == this$255 && next$2554380883 == next$255 && item$2554380883 == item$255 && tmp14380883 == tmp1 && node4380883 == node && $result4380883 == $result && item4380883 == item && this4380883 == this && tid4380883 == tid && $pc4380883 == $pc;
 assume $recorded.state4380883 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$255 != Node.null;                                                                     
 } else {                                                                                           
  assert this$255 != Node.null;                                                                            // (9.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4380883);                                                              
 assert $pc != PhaseError;                                                                                 // (9.7): Reduction failure
 Node.next[this$255] := next$255;                                                                   
 if (isLocal(Node._state[next$255], tid)) {                                                         
  Node._state[next$255] := SHARED();                                                                
  assert isSharedAssignable(Node._state[Node.next[next$255]]);                                             // (9.7): next$255 became shared, but next$255.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 7.31: break exit$255;                                                                           
                                                                                                    
 goto exit$255_bottom;                                                                              
 exit$255_bottom:                                                                                   
                                                                                                    
                                                                                                    
 // 21.9: this.head := node;                                                                        
                                                                                                    
                                                                                                    
 moverPath4380898 := WriteEval.Stack.head(tid: Tid,this: Stack,node: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380898 := m#moverPath(moverPath4380898);                                                     
 path4380898 := p#moverPath(moverPath4380898);                                                      
 assume Node._state4380898 == Node._state && Node.item4380898 == Node.item && Node.next4380898 == Node.next && Node._lock4380898 == Node._lock && Stack._state4380898 == Stack._state && Stack.head4380898 == Stack.head && Stack._lock4380898 == Stack._lock && tmp14380898 == tmp1 && node4380898 == node && $result4380898 == $result && item4380898 == item && this4380898 == this && tid4380898 == tid && $pc4380898 == $pc;
 assume $recorded.state4380898 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (21.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4380898);                                                              
 assert $pc != PhaseError;                                                                                 // (21.9): Reduction failure
 Stack.head[this] := node;                                                                          
 if (isLocal(Node._state[node], tid)) {                                                             
  Node._state[node] := SHARED();                                                                    
  assert isSharedAssignable(Node._state[Node.next[node]]);                                                 // (21.9): node became shared, but node.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (22.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (22.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.9): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 18.31: // return -1;                                                                            
                                                                                                    
 assume Node._state4380903 == Node._state && Node.item4380903 == Node.item && Node.next4380903 == Node.next && Node._lock4380903 == Node._lock && Stack._state4380903 == Stack._state && Stack.head4380903 == Stack.head && Stack._lock4380903 == Stack._lock && tmp14380903 == tmp1 && node4380903 == node && $result4380903 == $result && item4380903 == item && this4380903 == this && tid4380903 == tid;
 assume $recorded.state4380903 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Stack.pop(tid:Tid, this : Stack)                                                         
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (25.5): Bad tid
requires isShared(Stack._state[this]);                                                                     // (25.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
{                                                                                                   
 var Stack._lock4380969: [Stack]Tid;                                                                
 var tmp3: Node;                                                                                    
 var tmp44380946: Node;                                                                             
 var path4380920: int;                                                                              
 var Stack._state4380937: [Stack]State;                                                             
 var Stack._state4380965: [Stack]State;                                                             
 var tmp44380937: Node;                                                                             
 var this4380965: Stack;                                                                            
 var $result4380949: int;                                                                           
 var value4380952: int;                                                                             
 var Node._lock4380969: [Node]Tid;                                                                  
 var tmp64380949: Node;                                                                             
 var $recorded.state4380965: int;                                                                   
 var Stack._lock4380952: [Stack]Tid;                                                                
 var tmp34380952: Node;                                                                             
 var tmp24380969: bool;                                                                             
 var this4380937: Stack;                                                                            
 var tmp24380952: bool;                                                                             
 var $recorded.state4380946: int;                                                                   
 var Node.item4380920: [Node]int;                                                                   
 var value4380934: int;                                                                             
 var moverPath4380949: MoverPath;                                                                   
 var tmp4: Node;                                                                                    
 var Node.item4380969: [Node]int;                                                                   
 var Node.item4380946: [Node]int;                                                                   
 var Stack._state4380949: [Stack]State;                                                             
 var path4380937: int;                                                                              
 var tmp34380920: Node;                                                                             
 var mover4380949: Mover;                                                                           
 var path4380949: int;                                                                              
 var Stack.head4380969: [Stack]Node;                                                                
 var $pc4380965: Phase;                                                                             
 var Stack.head4380934: [Stack]Node;                                                                
 var $result4380965: int;                                                                           
 var Node._lock4380934: [Node]Tid;                                                                  
 var Node._state4380949: [Node]State;                                                               
 var tmp64380946: Node;                                                                             
 var this4380934: Stack;                                                                            
 var moverPath4380920: MoverPath;                                                                   
 var tmp2: bool;                                                                                    
 var tmp24380949: bool;                                                                             
 var Stack._lock4380934: [Stack]Tid;                                                                
 var Stack._state4380934: [Stack]State;                                                             
 var $recorded.state4380934: int;                                                                   
 var moverPath4380937: MoverPath;                                                                   
 var value: int;                                                                                    
 var Node.item4380934: [Node]int;                                                                   
 var $result4380952: int;                                                                           
 var Stack.head4380952: [Stack]Node;                                                                
 var $recorded.state4380937: int;                                                                   
 var $result4380920: int;                                                                           
 var tmp34380937: Node;                                                                             
 var $recorded.state4380952: int;                                                                   
 var tmp44380952: Node;                                                                             
 var tmp34380946: Node;                                                                             
 var Node.next4380965: [Node]Node;                                                                  
 var tid4380934: Tid;                                                                               
 var Node._lock4380952: [Node]Tid;                                                                  
 var tmp44380934: Node;                                                                             
 var Node.item4380952: [Node]int;                                                                   
 var value4380969: int;                                                                             
 var mover4380920: Mover;                                                                           
 var Stack._lock4380920: [Stack]Tid;                                                                
 var $result4380946: int;                                                                           
 var Node._lock4380949: [Node]Tid;                                                                  
 var $pc4380946: Phase;                                                                             
 var Node.next4380920: [Node]Node;                                                                  
 var Node._lock4380946: [Node]Tid;                                                                  
 var $pc4380969: Phase;                                                                             
 var tmp34380969: Node;                                                                             
 var path4380952: int;                                                                              
 var Stack.head4380946: [Stack]Node;                                                                
 var tmp34380965: Node;                                                                             
 var this4380946: Stack;                                                                            
 var Stack._lock4380946: [Stack]Tid;                                                                
 var $result4380937: int;                                                                           
 var $recorded.state4380920: int;                                                                   
 var moverPath4380952: MoverPath;                                                                   
 var $pc4380949: Phase;                                                                             
 var Node._state4380969: [Node]State;                                                               
 var tmp54380952: Node;                                                                             
 var Stack.head4380965: [Stack]Node;                                                                
 var Node._state4380965: [Node]State;                                                               
 var Node._lock4380920: [Node]Tid;                                                                  
 var tmp24380920: bool;                                                                             
 var moverPath4380934: MoverPath;                                                                   
 var tmp5: Node;                                                                                    
 var Node.item4380965: [Node]int;                                                                   
 var tmp34380949: Node;                                                                             
 var this4380969: Stack;                                                                            
 var Node.next4380934: [Node]Node;                                                                  
 var tmp6: Node;                                                                                    
 var tmp24380946: bool;                                                                             
 var $recorded.state4380969: int;                                                                   
 var tmp24380937: bool;                                                                             
 var Node.item4380937: [Node]int;                                                                   
 var Stack.head4380949: [Stack]Node;                                                                
 var this4380920: Stack;                                                                            
 var path4380946: int;                                                                              
 var Node.next4380969: [Node]Node;                                                                  
 var value4380946: int;                                                                             
 var Stack._state4380969: [Stack]State;                                                             
 var this4380952: Stack;                                                                            
 var moverPath4380946: MoverPath;                                                                   
 var Stack._state4380920: [Stack]State;                                                             
 var Stack.head4380937: [Stack]Node;                                                                
 var Node.next4380952: [Node]Node;                                                                  
 var tid4380949: Tid;                                                                               
 var Node.next4380946: [Node]Node;                                                                  
 var tid4380920: Tid;                                                                               
 var tmp24380934: bool;                                                                             
 var Stack._lock4380965: [Stack]Tid;                                                                
 var Node._state4380952: [Node]State;                                                               
 var Stack._lock4380937: [Stack]Tid;                                                                
 var $pc4380920: Phase;                                                                             
 var Stack._state4380952: [Stack]State;                                                             
 var tid4380969: Tid;                                                                               
 var tid4380952: Tid;                                                                               
 var $pc4380934: Phase;                                                                             
 var mover4380946: Mover;                                                                           
 var tmp34380934: Node;                                                                             
 var $result4380934: int;                                                                           
 var Node._lock4380965: [Node]Tid;                                                                  
 var Stack._state4380946: [Stack]State;                                                             
 var Stack.head4380920: [Stack]Node;                                                                
 var Node._lock4380937: [Node]Tid;                                                                  
 var tmp64380952: Node;                                                                             
 var tid4380965: Tid;                                                                               
 var Node._state4380934: [Node]State;                                                               
 var tmp44380949: Node;                                                                             
 var mover4380934: Mover;                                                                           
 var path4380934: int;                                                                              
 var Node.next4380937: [Node]Node;                                                                  
 var value4380937: int;                                                                             
 var mover4380937: Mover;                                                                           
 var Node._state4380937: [Node]State;                                                               
 var this4380949: Stack;                                                                            
 var tmp24380965: bool;                                                                             
 var mover4380952: Mover;                                                                           
 var value4380965: int;                                                                             
 var tmp54380949: Node;                                                                             
 var $recorded.state4380949: int;                                                                   
 var Node.next4380949: [Node]Node;                                                                  
 var Node._state4380920: [Node]State;                                                               
 var Node._state4380946: [Node]State;                                                               
 var tid4380937: Tid;                                                                               
 var tmp54380946: Node;                                                                             
 var $pc4380952: Phase;                                                                             
 var Node.item4380949: [Node]int;                                                                   
 var Stack._lock4380949: [Stack]Tid;                                                                
 var $result4380969: int;                                                                           
 var value4380949: int;                                                                             
 var $pc4380937: Phase;                                                                             
 var tid4380946: Tid;                                                                               
 var value4380920: int;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 26.7: int value;                                                                                
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (27.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (27.7): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 28.7: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 28.7: Node tmp3;                                                                                
                                                                                                    
                                                                                                    
 // 28.7: tmp3 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath4380920 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380920 := m#moverPath(moverPath4380920);                                                     
 path4380920 := p#moverPath(moverPath4380920);                                                      
 assume Node._state4380920 == Node._state && Node.item4380920 == Node.item && Node.next4380920 == Node.next && Node._lock4380920 == Node._lock && Stack._state4380920 == Stack._state && Stack.head4380920 == Stack.head && Stack._lock4380920 == Stack._lock && tmp34380920 == tmp3 && tmp24380920 == tmp2 && value4380920 == value && $result4380920 == $result && this4380920 == this && tid4380920 == tid && $pc4380920 == $pc;
 assume $recorded.state4380920 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (28.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4380920);                                                              
 assert $pc != PhaseError;                                                                                 // (28.7): Reduction failure
 tmp3 := Stack.head[this];                                                                          
                                                                                                    
 // 28.7: tmp2 = tmp3 != Node.null;                                                                 
                                                                                                    
 tmp2 := (tmp3!=Node.null);                                                                         
 if (tmp2 /* lowered (Stack.head[this]!=Node.null) */) {                                            
                                                                                                    
  // 29.9: Node tmp4;                                                                               
                                                                                                    
                                                                                                    
  // 29.9: tmp4 := this.head;                                                                       
                                                                                                    
                                                                                                    
  moverPath4380934 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4380934 := m#moverPath(moverPath4380934);                                                    
  path4380934 := p#moverPath(moverPath4380934);                                                     
  assume Node._state4380934 == Node._state && Node.item4380934 == Node.item && Node.next4380934 == Node.next && Node._lock4380934 == Node._lock && Stack._state4380934 == Stack._state && Stack.head4380934 == Stack.head && Stack._lock4380934 == Stack._lock && tmp44380934 == tmp4 && tmp34380934 == tmp3 && tmp24380934 == tmp2 && value4380934 == value && $result4380934 == $result && this4380934 == this && tid4380934 == tid && $pc4380934 == $pc;
  assume $recorded.state4380934 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (29.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4380934);                                                             
  assert $pc != PhaseError;                                                                                // (29.9): Reduction failure
  tmp4 := Stack.head[this];                                                                         
                                                                                                    
  // 29.9: value := tmp4.item;                                                                      
                                                                                                    
                                                                                                    
  moverPath4380937 := ReadEval.Node.item(tid: Tid,tmp4: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4380937 := m#moverPath(moverPath4380937);                                                    
  path4380937 := p#moverPath(moverPath4380937);                                                     
  assume Node._state4380937 == Node._state && Node.item4380937 == Node.item && Node.next4380937 == Node.next && Node._lock4380937 == Node._lock && Stack._state4380937 == Stack._state && Stack.head4380937 == Stack.head && Stack._lock4380937 == Stack._lock && tmp44380937 == tmp4 && tmp34380937 == tmp3 && tmp24380937 == tmp2 && value4380937 == value && $result4380937 == $result && this4380937 == this && tid4380937 == tid && $pc4380937 == $pc;
  assume $recorded.state4380937 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp4 != Node.null;                                                                        
  } else {                                                                                          
   assert tmp4 != Node.null;                                                                               // (29.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4380937);                                                             
  assert $pc != PhaseError;                                                                                // (29.9): Reduction failure
  value := Node.item[tmp4];                                                                         
                                                                                                    
  // 30.9: Node tmp5;                                                                               
                                                                                                    
                                                                                                    
  // 30.9: Node tmp6;                                                                               
                                                                                                    
                                                                                                    
  // 30.9: tmp6 := this.head;                                                                       
                                                                                                    
                                                                                                    
  moverPath4380946 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4380946 := m#moverPath(moverPath4380946);                                                    
  path4380946 := p#moverPath(moverPath4380946);                                                     
  assume Node._state4380946 == Node._state && Node.item4380946 == Node.item && Node.next4380946 == Node.next && Node._lock4380946 == Node._lock && Stack._state4380946 == Stack._state && Stack.head4380946 == Stack.head && Stack._lock4380946 == Stack._lock && tmp64380946 == tmp6 && tmp54380946 == tmp5 && tmp44380946 == tmp4 && tmp34380946 == tmp3 && tmp24380946 == tmp2 && value4380946 == value && $result4380946 == $result && this4380946 == this && tid4380946 == tid && $pc4380946 == $pc;
  assume $recorded.state4380946 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (30.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4380946);                                                             
  assert $pc != PhaseError;                                                                                // (30.9): Reduction failure
  tmp6 := Stack.head[this];                                                                         
                                                                                                    
  // 30.9: tmp5 := tmp6.next;                                                                       
                                                                                                    
                                                                                                    
  moverPath4380949 := ReadEval.Node.next(tid: Tid,tmp6: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4380949 := m#moverPath(moverPath4380949);                                                    
  path4380949 := p#moverPath(moverPath4380949);                                                     
  assume Node._state4380949 == Node._state && Node.item4380949 == Node.item && Node.next4380949 == Node.next && Node._lock4380949 == Node._lock && Stack._state4380949 == Stack._state && Stack.head4380949 == Stack.head && Stack._lock4380949 == Stack._lock && tmp64380949 == tmp6 && tmp54380949 == tmp5 && tmp44380949 == tmp4 && tmp34380949 == tmp3 && tmp24380949 == tmp2 && value4380949 == value && $result4380949 == $result && this4380949 == this && tid4380949 == tid && $pc4380949 == $pc;
  assume $recorded.state4380949 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp6 != Node.null;                                                                        
  } else {                                                                                          
   assert tmp6 != Node.null;                                                                               // (30.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover4380949);                                                             
  assert $pc != PhaseError;                                                                                // (30.9): Reduction failure
  tmp5 := Node.next[tmp6];                                                                          
                                                                                                    
                                                                                                    
  // 30.9: this.head := tmp5;                                                                       
                                                                                                    
                                                                                                    
  moverPath4380952 := WriteEval.Stack.head(tid: Tid,this: Stack,tmp5: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
  mover4380952 := m#moverPath(moverPath4380952);                                                    
  path4380952 := p#moverPath(moverPath4380952);                                                     
  assume Node._state4380952 == Node._state && Node.item4380952 == Node.item && Node.next4380952 == Node.next && Node._lock4380952 == Node._lock && Stack._state4380952 == Stack._state && Stack.head4380952 == Stack.head && Stack._lock4380952 == Stack._lock && tmp64380952 == tmp6 && tmp54380952 == tmp5 && tmp44380952 == tmp4 && tmp34380952 == tmp3 && tmp24380952 == tmp2 && value4380952 == value && $result4380952 == $result && this4380952 == this && tid4380952 == tid && $pc4380952 == $pc;
  assume $recorded.state4380952 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (30.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover4380952);                                                             
  assert $pc != PhaseError;                                                                                // (30.9): Reduction failure
  Stack.head[this] := tmp5;                                                                         
  if (isLocal(Node._state[tmp5], tid)) {                                                            
   Node._state[tmp5] := SHARED();                                                                   
   assert isSharedAssignable(Node._state[Node.next[tmp5]]);                                                // (30.9): tmp5 became shared, but tmp5.next may not be shared.
  }                                                                                                 
                                                                                                    
 } else {                                                                                           
                                                                                                    
  // 32.9: value = -1;                                                                              
                                                                                                    
  value := -(1);                                                                                    
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (34.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (34.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (34.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 35.7:  return value;                                                                            
                                                                                                    
 assume Node._state4380965 == Node._state && Node.item4380965 == Node.item && Node.next4380965 == Node.next && Node._lock4380965 == Node._lock && Stack._state4380965 == Stack._state && Stack.head4380965 == Stack.head && Stack._lock4380965 == Stack._lock && tmp34380965 == tmp3 && tmp24380965 == tmp2 && value4380965 == value && $result4380965 == $result && this4380965 == this && tid4380965 == tid;
 assume $recorded.state4380965 == 1;                                                                
 $result := value;                                                                                  
 return;                                                                                            
                                                                                                    
 // 25.22: // return -1;                                                                            
                                                                                                    
 assume Node._state4380969 == Node._state && Node.item4380969 == Node.item && Node.next4380969 == Node.next && Node._lock4380969 == Node._lock && Stack._state4380969 == Stack._state && Stack.head4380969 == Stack.head && Stack._lock4380969 == Stack._lock && tmp34380969 == tmp3 && tmp24380969 == tmp2 && value4380969 == value && $result4380969 == $result && this4380969 == this && tid4380969 == tid;
 assume $recorded.state4380969 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Stack.pop2(tid:Tid, this : Stack)                                                        
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (38.5): Bad tid
requires isShared(Stack._state[this]);                                                                     // (38.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
{                                                                                                   
 var Node.item4381041: [Node]int;                                                                   
 var Node.next4381023: [Node]Node;                                                                  
 var tid4380983: Tid;                                                                               
 var this4380983: Stack;                                                                            
 var Node.next4381035: [Node]Node;                                                                  
 var Node._lock4380983: [Node]Tid;                                                                  
 var $pc4381004: Phase;                                                                             
 var tid4381053: Tid;                                                                               
 var tid4381004: Tid;                                                                               
 var Stack._state4381026: [Stack]State;                                                             
 var Node.item4380983: [Node]int;                                                                   
 var Stack._state4381004: [Stack]State;                                                             
 var tmp12: Node;                                                                                   
 var Stack.head4381035: [Stack]Node;                                                                
 var path4380983: int;                                                                              
 var tid4381035: Tid;                                                                               
 var path4381026: int;                                                                              
 var $result4380983: int;                                                                           
 var Node._lock4381038: [Node]Tid;                                                                  
 var Node._lock4381053: [Node]Tid;                                                                  
 var Stack._lock4381035: [Stack]Tid;                                                                
 var value4381023: int;                                                                             
 var $recorded.state4381004: int;                                                                   
 var Stack._lock4381023: [Stack]Tid;                                                                
 var tmp104381045: Node;                                                                            
 var Stack._lock4381004: [Stack]Tid;                                                                
 var Node.item4381035: [Node]int;                                                                   
 var mover4381023: Mover;                                                                           
 var Stack._state4381045: [Stack]State;                                                             
 var $result4381053: int;                                                                           
 var Stack._state4381035: [Stack]State;                                                             
 var Node.item4381053: [Node]int;                                                                   
 var mover4381041: Mover;                                                                           
 var Node.item4381004: [Node]int;                                                                   
 var Node.item4381045: [Node]int;                                                                   
 var Node.next4381053: [Node]Node;                                                                  
 var mover4381038: Mover;                                                                           
 var Node._lock4381004: [Node]Tid;                                                                  
 var tmp104381038: Node;                                                                            
 var tmp104381035: Node;                                                                            
 var tmp9: int;                                                                                     
 var $pc4381023: Phase;                                                                             
 var value: int;                                                                                    
 var Stack._state4381053: [Stack]State;                                                             
 var moverPath4381035: MoverPath;                                                                   
 var Node.next4381004: [Node]Node;                                                                  
 var this4381038: Stack;                                                                            
 var $pc4381038: Phase;                                                                             
 var Stack._lock4381045: [Stack]Tid;                                                                
 var path4381038: int;                                                                              
 var Node.next4381026: [Node]Node;                                                                  
 var Node._lock4381026: [Node]Tid;                                                                  
 var $recorded.state4381041: int;                                                                   
 var tid4381045: Tid;                                                                               
 var Node.item4381038: [Node]int;                                                                   
 var $pc4381041: Phase;                                                                             
 var Node.next4381045: [Node]Node;                                                                  
 var path4381035: int;                                                                              
 var Stack.head4381041: [Stack]Node;                                                                
 var Node._state4381038: [Node]State;                                                               
 var value4381026: int;                                                                             
 var Node.next4381038: [Node]Node;                                                                  
 var Node._state4381035: [Node]State;                                                               
 var Stack.head4381026: [Stack]Node;                                                                
 var tmp104381041: Node;                                                                            
 var Stack._lock4381053: [Stack]Tid;                                                                
 var Node._lock4381023: [Node]Tid;                                                                  
 var tmp74381004: bool;                                                                             
 var $recorded.state4381053: int;                                                                   
 var path4381041: int;                                                                              
 var moverPath4381026: MoverPath;                                                                   
 var Stack._lock4381038: [Stack]Tid;                                                                
 var tmp84380983: Node;                                                                             
 var tid4381023: Tid;                                                                               
 var $pc4380983: Phase;                                                                             
 var $result4381026: int;                                                                           
 var Node._lock4381035: [Node]Tid;                                                                  
 var value4381045: int;                                                                             
 var $result4381004: int;                                                                           
 var Stack._state4381041: [Stack]State;                                                             
 var $result4381041: int;                                                                           
 var this4381023: Stack;                                                                            
 var this4381041: Stack;                                                                            
 var tmp124381035: Node;                                                                            
 var tmp124381045: Node;                                                                            
 var tmp8: Node;                                                                                    
 var tmp94381004: int;                                                                              
 var $result4381038: int;                                                                           
 var this4381026: Stack;                                                                            
 var this4381004: Stack;                                                                            
 var path4381023: int;                                                                              
 var $pc4381045: Phase;                                                                             
 var tmp10: Node;                                                                                   
 var $pc4381053: Phase;                                                                             
 var tid4381041: Tid;                                                                               
 var moverPath4381041: MoverPath;                                                                   
 var Node._state4381045: [Node]State;                                                               
 var tmp7: bool;                                                                                    
 var Node.next4381041: [Node]Node;                                                                  
 var mover4381026: Mover;                                                                           
 var tmp114381038: Node;                                                                            
 var tmp74380983: bool;                                                                             
 var this4381045: Stack;                                                                            
 var tmp114381045: Node;                                                                            
 var Node._lock4381041: [Node]Tid;                                                                  
 var Node.item4381026: [Node]int;                                                                   
 var Stack._lock4381041: [Stack]Tid;                                                                
 var Stack._lock4381026: [Stack]Tid;                                                                
 var Node._state4381023: [Node]State;                                                               
 var $result4381035: int;                                                                           
 var $recorded.state4380983: int;                                                                   
 var Stack.head4381038: [Stack]Node;                                                                
 var mover4380983: Mover;                                                                           
 var Stack.head4381023: [Stack]Node;                                                                
 var tmp104381026: Node;                                                                            
 var Node._state4381041: [Node]State;                                                               
 var this4381053: Stack;                                                                            
 var tmp114381041: Node;                                                                            
 var $result4381023: int;                                                                           
 var tid4381038: Tid;                                                                               
 var Node._state4381026: [Node]State;                                                               
 var $recorded.state4381045: int;                                                                   
 var tmp11: Node;                                                                                   
 var value4381041: int;                                                                             
 var Stack.head4381045: [Stack]Node;                                                                
 var Node._state4380983: [Node]State;                                                               
 var Stack._state4381038: [Stack]State;                                                             
 var $recorded.state4381026: int;                                                                   
 var Stack.head4381004: [Stack]Node;                                                                
 var Node.item4381023: [Node]int;                                                                   
 var Node.next4380983: [Node]Node;                                                                  
 var tmp114381035: Node;                                                                            
 var Stack._state4380983: [Stack]State;                                                             
 var tid4381026: Tid;                                                                               
 var Node._state4381053: [Node]State;                                                               
 var $recorded.state4381035: int;                                                                   
 var moverPath4380983: MoverPath;                                                                   
 var Stack._state4381023: [Stack]State;                                                             
 var Stack.head4381053: [Stack]Node;                                                                
 var tmp124381038: Node;                                                                            
 var Stack.head4380983: [Stack]Node;                                                                
 var $pc4381035: Phase;                                                                             
 var $pc4381026: Phase;                                                                             
 var moverPath4381023: MoverPath;                                                                   
 var tmp104381023: Node;                                                                            
 var moverPath4381038: MoverPath;                                                                   
 var tmp84381004: Node;                                                                             
 var Node._state4381004: [Node]State;                                                               
 var Node._lock4381045: [Node]Tid;                                                                  
 var tmp124381041: Node;                                                                            
 var $recorded.state4381038: int;                                                                   
 var Stack._lock4380983: [Stack]Tid;                                                                
 var this4381035: Stack;                                                                            
 var mover4381035: Mover;                                                                           
 var $result4381045: int;                                                                           
 var value4381038: int;                                                                             
 var value4381035: int;                                                                             
 var $recorded.state4381023: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (39.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (39.20): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 40.9: boolean tmp7;                                                                             
                                                                                                    
                                                                                                    
 // 40.9: Node tmp8;                                                                                
                                                                                                    
                                                                                                    
 // 40.9: tmp8 := this.head;                                                                        
                                                                                                    
                                                                                                    
 moverPath4380983 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4380983 := m#moverPath(moverPath4380983);                                                     
 path4380983 := p#moverPath(moverPath4380983);                                                      
 assume Node._state4380983 == Node._state && Node.item4380983 == Node.item && Node.next4380983 == Node.next && Node._lock4380983 == Node._lock && Stack._state4380983 == Stack._state && Stack.head4380983 == Stack.head && Stack._lock4380983 == Stack._lock && tmp84380983 == tmp8 && tmp74380983 == tmp7 && $result4380983 == $result && this4380983 == this && tid4380983 == tid && $pc4380983 == $pc;
 assume $recorded.state4380983 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (40.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4380983);                                                              
 assert $pc != PhaseError;                                                                                 // (40.9): Reduction failure
 tmp8 := Stack.head[this];                                                                          
                                                                                                    
 // 40.9: tmp7 = tmp8 == Node.null;                                                                 
                                                                                                    
 tmp7 := (tmp8==Node.null);                                                                         
 if (tmp7 /* lowered (Stack.head[this]==Node.null) */) {                                            
                                                                                                    
  // 40.34: int tmp9;                                                                               
                                                                                                    
                                                                                                    
  // 40.34: tmp9 = -1;                                                                              
                                                                                                    
  tmp9 := -(1);                                                                                     
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (41.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Stack._lock[this] == tid;                                                                         // (41.7): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (41.7): Reduction failure
  Stack._lock[this] := Tid.null;                                                                    
                                                                                                    
  // 40.34:  return tmp9;                                                                           
                                                                                                    
  assume Node._state4381004 == Node._state && Node.item4381004 == Node.item && Node.next4381004 == Node.next && Node._lock4381004 == Node._lock && Stack._state4381004 == Stack._state && Stack.head4381004 == Stack.head && Stack._lock4381004 == Stack._lock && tmp94381004 == tmp9 && tmp84381004 == tmp8 && tmp74381004 == tmp7 && $result4381004 == $result && this4381004 == this && tid4381004 == tid;
  assume $recorded.state4381004 == 1;                                                               
  $result := tmp9;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (41.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (41.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (41.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (42.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (42.20): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 43.9: int value;                                                                                
                                                                                                    
                                                                                                    
 // 43.9: Node tmp10;                                                                               
                                                                                                    
                                                                                                    
 // 43.9: tmp10 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381023 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381023 := m#moverPath(moverPath4381023);                                                     
 path4381023 := p#moverPath(moverPath4381023);                                                      
 assume Node._state4381023 == Node._state && Node.item4381023 == Node.item && Node.next4381023 == Node.next && Node._lock4381023 == Node._lock && Stack._state4381023 == Stack._state && Stack.head4381023 == Stack.head && Stack._lock4381023 == Stack._lock && tmp104381023 == tmp10 && value4381023 == value && $result4381023 == $result && this4381023 == this && tid4381023 == tid && $pc4381023 == $pc;
 assume $recorded.state4381023 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (43.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381023);                                                              
 assert $pc != PhaseError;                                                                                 // (43.9): Reduction failure
 tmp10 := Stack.head[this];                                                                         
                                                                                                    
 // 43.9: value := tmp10.item;                                                                      
                                                                                                    
                                                                                                    
 moverPath4381026 := ReadEval.Node.item(tid: Tid,tmp10: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381026 := m#moverPath(moverPath4381026);                                                     
 path4381026 := p#moverPath(moverPath4381026);                                                      
 assume Node._state4381026 == Node._state && Node.item4381026 == Node.item && Node.next4381026 == Node.next && Node._lock4381026 == Node._lock && Stack._state4381026 == Stack._state && Stack.head4381026 == Stack.head && Stack._lock4381026 == Stack._lock && tmp104381026 == tmp10 && value4381026 == value && $result4381026 == $result && this4381026 == this && tid4381026 == tid && $pc4381026 == $pc;
 assume $recorded.state4381026 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp10 != Node.null;                                                                        
 } else {                                                                                           
  assert tmp10 != Node.null;                                                                               // (43.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381026);                                                              
 assert $pc != PhaseError;                                                                                 // (43.9): Reduction failure
 value := Node.item[tmp10];                                                                         
                                                                                                    
 // 44.9: Node tmp11;                                                                               
                                                                                                    
                                                                                                    
 // 44.9: Node tmp12;                                                                               
                                                                                                    
                                                                                                    
 // 44.9: tmp12 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381035 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381035 := m#moverPath(moverPath4381035);                                                     
 path4381035 := p#moverPath(moverPath4381035);                                                      
 assume Node._state4381035 == Node._state && Node.item4381035 == Node.item && Node.next4381035 == Node.next && Node._lock4381035 == Node._lock && Stack._state4381035 == Stack._state && Stack.head4381035 == Stack.head && Stack._lock4381035 == Stack._lock && tmp124381035 == tmp12 && tmp114381035 == tmp11 && tmp104381035 == tmp10 && value4381035 == value && $result4381035 == $result && this4381035 == this && tid4381035 == tid && $pc4381035 == $pc;
 assume $recorded.state4381035 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381035);                                                              
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 tmp12 := Stack.head[this];                                                                         
                                                                                                    
 // 44.9: tmp11 := tmp12.next;                                                                      
                                                                                                    
                                                                                                    
 moverPath4381038 := ReadEval.Node.next(tid: Tid,tmp12: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381038 := m#moverPath(moverPath4381038);                                                     
 path4381038 := p#moverPath(moverPath4381038);                                                      
 assume Node._state4381038 == Node._state && Node.item4381038 == Node.item && Node.next4381038 == Node.next && Node._lock4381038 == Node._lock && Stack._state4381038 == Stack._state && Stack.head4381038 == Stack.head && Stack._lock4381038 == Stack._lock && tmp124381038 == tmp12 && tmp114381038 == tmp11 && tmp104381038 == tmp10 && value4381038 == value && $result4381038 == $result && this4381038 == this && tid4381038 == tid && $pc4381038 == $pc;
 assume $recorded.state4381038 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp12 != Node.null;                                                                        
 } else {                                                                                           
  assert tmp12 != Node.null;                                                                               // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381038);                                                              
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 tmp11 := Node.next[tmp12];                                                                         
                                                                                                    
                                                                                                    
 // 44.9: this.head := tmp11;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381041 := WriteEval.Stack.head(tid: Tid,this: Stack,tmp11: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381041 := m#moverPath(moverPath4381041);                                                     
 path4381041 := p#moverPath(moverPath4381041);                                                      
 assume Node._state4381041 == Node._state && Node.item4381041 == Node.item && Node.next4381041 == Node.next && Node._lock4381041 == Node._lock && Stack._state4381041 == Stack._state && Stack.head4381041 == Stack.head && Stack._lock4381041 == Stack._lock && tmp124381041 == tmp12 && tmp114381041 == tmp11 && tmp104381041 == tmp10 && value4381041 == value && $result4381041 == $result && this4381041 == this && tid4381041 == tid && $pc4381041 == $pc;
 assume $recorded.state4381041 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4381041);                                                              
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 Stack.head[this] := tmp11;                                                                         
 if (isLocal(Node._state[tmp11], tid)) {                                                            
  Node._state[tmp11] := SHARED();                                                                   
  assert isSharedAssignable(Node._state[Node.next[tmp11]]);                                                // (44.9): tmp11 became shared, but tmp11.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (46.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (46.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (46.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 45.9:  return value;                                                                            
                                                                                                    
 assume Node._state4381045 == Node._state && Node.item4381045 == Node.item && Node.next4381045 == Node.next && Node._lock4381045 == Node._lock && Stack._state4381045 == Stack._state && Stack.head4381045 == Stack.head && Stack._lock4381045 == Stack._lock && tmp124381045 == tmp12 && tmp114381045 == tmp11 && tmp104381045 == tmp10 && value4381045 == value && $result4381045 == $result && this4381045 == this && tid4381045 == tid;
 assume $recorded.state4381045 == 1;                                                                
 $result := value;                                                                                  
 return;                                                                                            
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (46.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (46.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (46.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 38.23: // return -1;                                                                            
                                                                                                    
 assume Node._state4381053 == Node._state && Node.item4381053 == Node.item && Node.next4381053 == Node.next && Node._lock4381053 == Node._lock && Stack._state4381053 == Stack._state && Stack.head4381053 == Stack.head && Stack._lock4381053 == Stack._lock && $result4381053 == $result && this4381053 == this && tid4381053 == tid;
 assume $recorded.state4381053 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Stack.pop3(tid:Tid, this : Stack)                                                        
returns ($result : int)                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (49.5): Bad tid
requires isShared(Stack._state[this]);                                                                     // (49.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
{                                                                                                   
 var tmp174381150: Node;                                                                            
 var Node._state4381147: [Node]State;                                                               
 var Node.next4381165: [Node]Node;                                                                  
 var Node.next4381150: [Node]Node;                                                                  
 var Stack._lock4381108: [Stack]Tid;                                                                
 var tmp204381147: Node;                                                                            
 var $pc4381126: Phase;                                                                             
 var moverPath4381108: MoverPath;                                                                   
 var $result4381108: int;                                                                           
 var Node.next4381135: [Node]Node;                                                                  
 var Node._lock4381108: [Node]Tid;                                                                  
 var Node._lock4381135: [Node]Tid;                                                                  
 var tmp204381153: Node;                                                                            
 var this4381165: Stack;                                                                            
 var tmp204381150: Node;                                                                            
 var Stack._state4381147: [Stack]State;                                                             
 var $pc4381067: Phase;                                                                             
 var tmp20: Node;                                                                                   
 var value4381150: int;                                                                             
 var tid4381067: Tid;                                                                               
 var $pc4381138: Phase;                                                                             
 var this4381097_post: Stack;                                                                       
 var Node._state4381067: [Node]State;                                                               
 var mover4381067: Mover;                                                                           
 var tmp164381153: bool;                                                                            
 var this4381153: Stack;                                                                            
 var $recorded.state4381150: int;                                                                   
 var this4381126: Stack;                                                                            
 var Stack._state4381126: [Stack]State;                                                             
 var tmp194381157: Node;                                                                            
 var tmp164381157: bool;                                                                            
 var Stack._state4381135: [Stack]State;                                                             
 var $result4381147: int;                                                                           
 var Node.item4381108: [Node]int;                                                                   
 var moverPath4381135: MoverPath;                                                                   
 var Node.item4381097_post: [Node]int;                                                              
 var mover4381147: Mover;                                                                           
 var tid4381150: Tid;                                                                               
 var moverPath4381138: MoverPath;                                                                   
 var $pc4381157: Phase;                                                                             
 var $recorded.state4381097_post: int;                                                              
 var mover4381153: Mover;                                                                           
 var $recorded.state4381097: int;                                                                   
 var mover4381138: Mover;                                                                           
 var tid4381126: Tid;                                                                               
 var Stack._lock4381097_post: [Stack]Tid;                                                           
 var Node.next4381067: [Node]Node;                                                                  
 var tmp184381150: Node;                                                                            
 var $pc4381147: Phase;                                                                             
 var tmp174381126: Node;                                                                            
 var tmp184381153: Node;                                                                            
 var tmp16: bool;                                                                                   
 var Node._state4381108: [Node]State;                                                               
 var Stack._state4381067: [Stack]State;                                                             
 var Stack._state4381165: [Stack]State;                                                             
 var tmp174381138: Node;                                                                            
 var this4381135: Stack;                                                                            
 var $recorded.state4381165: int;                                                                   
 var Stack._lock4381147: [Stack]Tid;                                                                
 var $pc4381153: Phase;                                                                             
 var Node._lock4381153: [Node]Tid;                                                                  
 var this4381088: Stack;                                                                            
 var tmp184381138: Node;                                                                            
 var Stack._state4381097: [Stack]State;                                                             
 var value4381153: int;                                                                             
 var tmp174381153: Node;                                                                            
 var tid4381147: Tid;                                                                               
 var $recorded.state4381135: int;                                                                   
 var Node.next4381126: [Node]Node;                                                                  
 var Stack.head4381147: [Stack]Node;                                                                
 var path4381108: int;                                                                              
 var $pc4381135: Phase;                                                                             
 var Node.next4381153: [Node]Node;                                                                  
 var Node._lock4381067: [Node]Tid;                                                                  
 var $recorded.state4381108: int;                                                                   
 var Stack.head4381126: [Stack]Node;                                                                
 var mover4381135: Mover;                                                                           
 var Stack.head4381097: [Stack]Node;                                                                
 var Node.item4381097: [Node]int;                                                                   
 var Stack.head4381097_post: [Stack]Node;                                                           
 var Node.item4381150: [Node]int;                                                                   
 var path4381153: int;                                                                              
 var tmp14: Node;                                                                                   
 var Node._lock4381126: [Node]Tid;                                                                  
 var path4381067: int;                                                                              
 var tmp164381138: bool;                                                                            
 var value: int;                                                                                    
 var Stack._state4381108: [Stack]State;                                                             
 var Node._lock4381097_post: [Node]Tid;                                                             
 var Node.item4381157: [Node]int;                                                                   
 var $recorded.state4381138: int;                                                                   
 var Node.next4381138: [Node]Node;                                                                  
 var $result4381165: int;                                                                           
 var $pc4381088: Phase;                                                                             
 var tmp184381157: Node;                                                                            
 var tmp174381135: Node;                                                                            
 var tmp184381135: Node;                                                                            
 var this4381157: Stack;                                                                            
 var Node._lock4381150: [Node]Tid;                                                                  
 var tmp134381067: bool;                                                                            
 var value4381147: int;                                                                             
 var tmp174381108: Node;                                                                            
 var this4381147: Stack;                                                                            
 var Stack._lock4381150: [Stack]Tid;                                                                
 var path4381150: int;                                                                              
 var $result4381126: int;                                                                           
 var tmp194381147: Node;                                                                            
 var tmp144381067: Node;                                                                            
 var Stack.head4381138: [Stack]Node;                                                                
 var tmp164381150: bool;                                                                            
 var Stack._lock4381157: [Stack]Tid;                                                                
 var Node.item4381088: [Node]int;                                                                   
 var Stack._state4381088: [Stack]State;                                                             
 var Node.item4381067: [Node]int;                                                                   
 var Node.item4381135: [Node]int;                                                                   
 var Stack.head4381157: [Stack]Node;                                                                
 var Stack._state4381138: [Stack]State;                                                             
 var path4381138: int;                                                                              
 var Stack._lock4381135: [Stack]Tid;                                                                
 var Node._lock4381165: [Node]Tid;                                                                  
 var Node._lock4381147: [Node]Tid;                                                                  
 var $recorded.state4381147: int;                                                                   
 var $result4381135: int;                                                                           
 var $pc4381108: Phase;                                                                             
 var $recorded.state4381126: int;                                                                   
 var tmp194381153: Node;                                                                            
 var $result4381067: int;                                                                           
 var tmp194381150: Node;                                                                            
 var this4381097: Stack;                                                                            
 var Stack._lock4381067: [Stack]Tid;                                                                
 var Node.next4381088: [Node]Node;                                                                  
 var tid4381135: Tid;                                                                               
 var tid4381088: Tid;                                                                               
 var path4381135: int;                                                                              
 var $result4381097_post: int;                                                                      
 var tid4381138: Tid;                                                                               
 var this4381108: Stack;                                                                            
 var tmp134381088: bool;                                                                            
 var tmp164381147: bool;                                                                            
 var Stack.head4381067: [Stack]Node;                                                                
 var moverPath4381147: MoverPath;                                                                   
 var tid4381097: Tid;                                                                               
 var tmp15: int;                                                                                    
 var Stack._lock4381097: [Stack]Tid;                                                                
 var Node.next4381097: [Node]Node;                                                                  
 var $result4381153: int;                                                                           
 var $pc4381165: Phase;                                                                             
 var $recorded.state4381153: int;                                                                   
 var value4381135: int;                                                                             
 var Node._lock4381138: [Node]Tid;                                                                  
 var Node.next4381108: [Node]Node;                                                                  
 var tmp144381088: Node;                                                                            
 var Node._lock4381157: [Node]Tid;                                                                  
 var tmp19: Node;                                                                                   
 var this4381150: Stack;                                                                            
 var Node._lock4381097: [Node]Tid;                                                                  
 var Node._state4381157: [Node]State;                                                               
 var $recorded.state4381088: int;                                                                   
 var moverPath4381067: MoverPath;                                                                   
 var tid4381108: Tid;                                                                               
 var mover4381150: Mover;                                                                           
 var $result4381097: int;                                                                           
 var tmp17: Node;                                                                                   
 var moverPath4381150: MoverPath;                                                                   
 var tmp204381157: Node;                                                                            
 var Node.item4381153: [Node]int;                                                                   
 var $pc4381150: Phase;                                                                             
 var Node.item4381138: [Node]int;                                                                   
 var Stack._lock4381165: [Stack]Tid;                                                                
 var tid4381153: Tid;                                                                               
 var Stack.head4381165: [Stack]Node;                                                                
 var Node.item4381147: [Node]int;                                                                   
 var Node._state4381153: [Node]State;                                                               
 var $recorded.state4381067: int;                                                                   
 var Node.item4381126: [Node]int;                                                                   
 var this4381067: Stack;                                                                            
 var Node._state4381097: [Node]State;                                                               
 var this4381138: Stack;                                                                            
 var tmp184381147: Node;                                                                            
 var Stack.head4381135: [Stack]Node;                                                                
 var tmp164381108: bool;                                                                            
 var $result4381088: int;                                                                           
 var Node._state4381150: [Node]State;                                                               
 var Node._state4381165: [Node]State;                                                               
 var Stack._state4381150: [Stack]State;                                                             
 var mover4381108: Mover;                                                                           
 var $result4381157: int;                                                                           
 var Stack._state4381157: [Stack]State;                                                             
 var $pc4381097_post: Phase;                                                                        
 var tid4381097_post: Tid;                                                                          
 var value4381157: int;                                                                             
 var path4381147: int;                                                                              
 var Stack._state4381153: [Stack]State;                                                             
 var Node.next4381097_post: [Node]Node;                                                             
 var Node._lock4381088: [Node]Tid;                                                                  
 var tid4381165: Tid;                                                                               
 var tmp174381157: Node;                                                                            
 var tmp13: bool;                                                                                   
 var moverPath4381153: MoverPath;                                                                   
 var Stack._lock4381088: [Stack]Tid;                                                                
 var Stack.head4381088: [Stack]Node;                                                                
 var tmp174381147: Node;                                                                            
 var Stack._lock4381126: [Stack]Tid;                                                                
 var Node._state4381126: [Node]State;                                                               
 var Stack.head4381153: [Stack]Node;                                                                
 var tid4381157: Tid;                                                                               
 var value4381138: int;                                                                             
 var tmp154381088: int;                                                                             
 var Node._state4381097_post: [Node]State;                                                          
 var $recorded.state4381157: int;                                                                   
 var Stack._lock4381153: [Stack]Tid;                                                                
 var $result4381138: int;                                                                           
 var tmp164381135: bool;                                                                            
 var Node.item4381165: [Node]int;                                                                   
 var Node._state4381088: [Node]State;                                                               
 var Node._state4381135: [Node]State;                                                               
 var Stack.head4381150: [Stack]Node;                                                                
 var Node._state4381138: [Node]State;                                                               
 var Stack.head4381108: [Stack]Node;                                                                
 var Stack._state4381097_post: [Stack]State;                                                        
 var tmp164381126: bool;                                                                            
 var $result4381150: int;                                                                           
 var Stack._lock4381138: [Stack]Tid;                                                                
 var $pc4381097: Phase;                                                                             
 var tmp18: Node;                                                                                   
 var Node.next4381147: [Node]Node;                                                                  
 var Node.next4381157: [Node]Node;                                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (50.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (50.20): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 51.9: boolean tmp13;                                                                            
                                                                                                    
                                                                                                    
 // 51.9: Node tmp14;                                                                               
                                                                                                    
                                                                                                    
 // 51.9: tmp14 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381067 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381067 := m#moverPath(moverPath4381067);                                                     
 path4381067 := p#moverPath(moverPath4381067);                                                      
 assume Node._state4381067 == Node._state && Node.item4381067 == Node.item && Node.next4381067 == Node.next && Node._lock4381067 == Node._lock && Stack._state4381067 == Stack._state && Stack.head4381067 == Stack.head && Stack._lock4381067 == Stack._lock && tmp144381067 == tmp14 && tmp134381067 == tmp13 && $result4381067 == $result && this4381067 == this && tid4381067 == tid && $pc4381067 == $pc;
 assume $recorded.state4381067 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (51.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381067);                                                              
 assert $pc != PhaseError;                                                                                 // (51.9): Reduction failure
 tmp14 := Stack.head[this];                                                                         
                                                                                                    
 // 51.9: tmp13 = tmp14 == Node.null;                                                               
                                                                                                    
 tmp13 := (tmp14==Node.null);                                                                       
 if (tmp13 /* lowered (Stack.head[this]==Node.null) */) {                                           
                                                                                                    
  // 51.34: int tmp15;                                                                              
                                                                                                    
                                                                                                    
  // 51.34: tmp15 = -1;                                                                             
                                                                                                    
  tmp15 := -(1);                                                                                    
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (52.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Stack._lock[this] == tid;                                                                         // (52.7): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (52.7): Reduction failure
  Stack._lock[this] := Tid.null;                                                                    
                                                                                                    
  // 51.34:  return tmp15;                                                                          
                                                                                                    
  assume Node._state4381088 == Node._state && Node.item4381088 == Node.item && Node.next4381088 == Node.next && Node._lock4381088 == Node._lock && Stack._state4381088 == Stack._state && Stack.head4381088 == Stack.head && Stack._lock4381088 == Stack._lock && tmp154381088 == tmp15 && tmp144381088 == tmp14 && tmp134381088 == tmp13 && $result4381088 == $result && this4381088 == this && tid4381088 == tid;
  assume $recorded.state4381088 == 1;                                                               
  $result := tmp15;                                                                                 
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (52.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (52.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (52.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 53.7: yield;                                                                                    
                                                                                                    
 assume Node._state4381097 == Node._state && Node.item4381097 == Node.item && Node.next4381097 == Node.next && Node._lock4381097 == Node._lock && Stack._state4381097 == Stack._state && Stack.head4381097 == Stack.head && Stack._lock4381097 == Stack._lock && $result4381097 == $result && this4381097 == this && tid4381097 == tid;
 assume $recorded.state4381097 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Node._state4381097_post == Node._state && Node.item4381097_post == Node.item && Node.next4381097_post == Node.next && Node._lock4381097_post == Node._lock && Stack._state4381097_post == Stack._state && Stack.head4381097_post == Stack.head && Stack._lock4381097_post == Stack._lock && $result4381097_post == $result && this4381097_post == this && tid4381097_post == tid;
 assume $recorded.state4381097_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (54.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Stack._lock[this] == Tid.null;                                                              
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (54.20): Reduction failure
 Stack._lock[this] := tid;                                                                          
                                                                                                    
 // 55.9: boolean tmp16;                                                                            
                                                                                                    
                                                                                                    
 // 55.9: Node tmp17;                                                                               
                                                                                                    
                                                                                                    
 // 55.9: tmp17 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381108 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381108 := m#moverPath(moverPath4381108);                                                     
 path4381108 := p#moverPath(moverPath4381108);                                                      
 assume Node._state4381108 == Node._state && Node.item4381108 == Node.item && Node.next4381108 == Node.next && Node._lock4381108 == Node._lock && Stack._state4381108 == Stack._state && Stack.head4381108 == Stack.head && Stack._lock4381108 == Stack._lock && tmp174381108 == tmp17 && tmp164381108 == tmp16 && $result4381108 == $result && this4381108 == this && tid4381108 == tid && $pc4381108 == $pc;
 assume $recorded.state4381108 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (55.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381108);                                                              
 assert $pc != PhaseError;                                                                                 // (55.9): Reduction failure
 tmp17 := Stack.head[this];                                                                         
                                                                                                    
 // 55.9: tmp16 = tmp17 != Node.null;                                                               
                                                                                                    
 tmp16 := (tmp17!=Node.null);                                                                       
                                                                                                    
 // 55.9: assert tmp16 /* == this.head != Node.null */;                                             
                                                                                                    
 assume Node._state4381126 == Node._state && Node.item4381126 == Node.item && Node.next4381126 == Node.next && Node._lock4381126 == Node._lock && Stack._state4381126 == Stack._state && Stack.head4381126 == Stack.head && Stack._lock4381126 == Stack._lock && tmp174381126 == tmp17 && tmp164381126 == tmp16 && $result4381126 == $result && this4381126 == this && tid4381126 == tid;
 assume $recorded.state4381126 == 1;                                                                
 assert tmp16 /* lowered (Stack.head[this]!=Node.null) */;                                                 // (55.9): This assertion may not hold.
                                                                                                    
 // 56.9: int value;                                                                                
                                                                                                    
                                                                                                    
 // 56.9: Node tmp18;                                                                               
                                                                                                    
                                                                                                    
 // 56.9: tmp18 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381135 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381135 := m#moverPath(moverPath4381135);                                                     
 path4381135 := p#moverPath(moverPath4381135);                                                      
 assume Node._state4381135 == Node._state && Node.item4381135 == Node.item && Node.next4381135 == Node.next && Node._lock4381135 == Node._lock && Stack._state4381135 == Stack._state && Stack.head4381135 == Stack.head && Stack._lock4381135 == Stack._lock && tmp184381135 == tmp18 && value4381135 == value && tmp174381135 == tmp17 && tmp164381135 == tmp16 && $result4381135 == $result && this4381135 == this && tid4381135 == tid && $pc4381135 == $pc;
 assume $recorded.state4381135 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (56.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381135);                                                              
 assert $pc != PhaseError;                                                                                 // (56.9): Reduction failure
 tmp18 := Stack.head[this];                                                                         
                                                                                                    
 // 56.9: value := tmp18.item;                                                                      
                                                                                                    
                                                                                                    
 moverPath4381138 := ReadEval.Node.item(tid: Tid,tmp18: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381138 := m#moverPath(moverPath4381138);                                                     
 path4381138 := p#moverPath(moverPath4381138);                                                      
 assume Node._state4381138 == Node._state && Node.item4381138 == Node.item && Node.next4381138 == Node.next && Node._lock4381138 == Node._lock && Stack._state4381138 == Stack._state && Stack.head4381138 == Stack.head && Stack._lock4381138 == Stack._lock && tmp184381138 == tmp18 && value4381138 == value && tmp174381138 == tmp17 && tmp164381138 == tmp16 && $result4381138 == $result && this4381138 == this && tid4381138 == tid && $pc4381138 == $pc;
 assume $recorded.state4381138 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp18 != Node.null;                                                                        
 } else {                                                                                           
  assert tmp18 != Node.null;                                                                               // (56.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381138);                                                              
 assert $pc != PhaseError;                                                                                 // (56.9): Reduction failure
 value := Node.item[tmp18];                                                                         
                                                                                                    
 // 57.9: Node tmp19;                                                                               
                                                                                                    
                                                                                                    
 // 57.9: Node tmp20;                                                                               
                                                                                                    
                                                                                                    
 // 57.9: tmp20 := this.head;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381147 := ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381147 := m#moverPath(moverPath4381147);                                                     
 path4381147 := p#moverPath(moverPath4381147);                                                      
 assume Node._state4381147 == Node._state && Node.item4381147 == Node.item && Node.next4381147 == Node.next && Node._lock4381147 == Node._lock && Stack._state4381147 == Stack._state && Stack.head4381147 == Stack.head && Stack._lock4381147 == Stack._lock && tmp204381147 == tmp20 && tmp194381147 == tmp19 && tmp184381147 == tmp18 && value4381147 == value && tmp174381147 == tmp17 && tmp164381147 == tmp16 && $result4381147 == $result && this4381147 == this && tid4381147 == tid && $pc4381147 == $pc;
 assume $recorded.state4381147 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (57.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381147);                                                              
 assert $pc != PhaseError;                                                                                 // (57.9): Reduction failure
 tmp20 := Stack.head[this];                                                                         
                                                                                                    
 // 57.9: tmp19 := tmp20.next;                                                                      
                                                                                                    
                                                                                                    
 moverPath4381150 := ReadEval.Node.next(tid: Tid,tmp20: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381150 := m#moverPath(moverPath4381150);                                                     
 path4381150 := p#moverPath(moverPath4381150);                                                      
 assume Node._state4381150 == Node._state && Node.item4381150 == Node.item && Node.next4381150 == Node.next && Node._lock4381150 == Node._lock && Stack._state4381150 == Stack._state && Stack.head4381150 == Stack.head && Stack._lock4381150 == Stack._lock && tmp204381150 == tmp20 && tmp194381150 == tmp19 && tmp184381150 == tmp18 && value4381150 == value && tmp174381150 == tmp17 && tmp164381150 == tmp16 && $result4381150 == $result && this4381150 == this && tid4381150 == tid && $pc4381150 == $pc;
 assume $recorded.state4381150 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume tmp20 != Node.null;                                                                        
 } else {                                                                                           
  assert tmp20 != Node.null;                                                                               // (57.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover4381150);                                                              
 assert $pc != PhaseError;                                                                                 // (57.9): Reduction failure
 tmp19 := Node.next[tmp20];                                                                         
                                                                                                    
                                                                                                    
 // 57.9: this.head := tmp19;                                                                       
                                                                                                    
                                                                                                    
 moverPath4381153 := WriteEval.Stack.head(tid: Tid,this: Stack,tmp19: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 mover4381153 := m#moverPath(moverPath4381153);                                                     
 path4381153 := p#moverPath(moverPath4381153);                                                      
 assume Node._state4381153 == Node._state && Node.item4381153 == Node.item && Node.next4381153 == Node.next && Node._lock4381153 == Node._lock && Stack._state4381153 == Stack._state && Stack.head4381153 == Stack.head && Stack._lock4381153 == Stack._lock && tmp204381153 == tmp20 && tmp194381153 == tmp19 && tmp184381153 == tmp18 && value4381153 == value && tmp174381153 == tmp17 && tmp164381153 == tmp16 && $result4381153 == $result && this4381153 == this && tid4381153 == tid && $pc4381153 == $pc;
 assume $recorded.state4381153 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (57.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover4381153);                                                              
 assert $pc != PhaseError;                                                                                 // (57.9): Reduction failure
 Stack.head[this] := tmp19;                                                                         
 if (isLocal(Node._state[tmp19], tid)) {                                                            
  Node._state[tmp19] := SHARED();                                                                   
  assert isSharedAssignable(Node._state[Node.next[tmp19]]);                                                // (57.9): tmp19 became shared, but tmp19.next may not be shared.
 }                                                                                                  
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (59.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (59.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (59.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 58.9:  return value;                                                                            
                                                                                                    
 assume Node._state4381157 == Node._state && Node.item4381157 == Node.item && Node.next4381157 == Node.next && Node._lock4381157 == Node._lock && Stack._state4381157 == Stack._state && Stack.head4381157 == Stack.head && Stack._lock4381157 == Stack._lock && tmp204381157 == tmp20 && tmp194381157 == tmp19 && tmp184381157 == tmp18 && value4381157 == value && tmp174381157 == tmp17 && tmp164381157 == tmp16 && $result4381157 == $result && this4381157 == this && tid4381157 == tid;
 assume $recorded.state4381157 == 1;                                                                
 $result := value;                                                                                  
 return;                                                                                            
 if ($pc == PreCommit) {                                                                            
  assume this != Stack.null;                                                                        
 } else {                                                                                           
  assert this != Stack.null;                                                                               // (59.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Stack._lock[this] == tid;                                                                          // (59.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (59.7): Reduction failure
 Stack._lock[this] := Tid.null;                                                                     
                                                                                                    
 // 49.23: // return -1;                                                                            
                                                                                                    
 assume Node._state4381165 == Node._state && Node.item4381165 == Node.item && Node.next4381165 == Node.next && Node._lock4381165 == Node._lock && Stack._state4381165 == Stack._state && Stack.head4381165 == Stack.head && Stack._lock4381165 == Stack._lock && $result4381165 == $result && this4381165 == this && tid4381165 == tid;
 assume $recorded.state4381165 == 1;                                                                
 $result := -1;                                                                                     
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.item: [Node]int,Node.next: [Node]Node,Node._lock: [Node]Tid,Stack._state: [Stack]State,Stack.head: [Stack]Node,Stack._lock: [Stack]Tid) returns (bool) {
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
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Node.item failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)            
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)             
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.item[x];                                                                          
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.item(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Node.item failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                 
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.item(t: Tid, u: Tid, v: int, w: int, x: Node)                  
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Node.item[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.item[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.item(u: Tid,x: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Node.item failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)       
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (16.5): Stack.head failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)        
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Stack.head(u: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (16.5): Stack.head failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)        
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Stack.head[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (16.5): Stack.head failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)         
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Stack.head(u: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (16.5): Stack.head failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)             
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (16.5): Stack.head failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Stack.head(t: Tid, u: Tid, v: Node, w: Node, x: Stack)              
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Stack.head[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,x: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (16.5): Stack.head failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.item(t: Tid, u: Tid, v: int, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Node.next(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.item.Stack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.item.Stack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.item;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._state_pre: [Node]State;                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.item.Stack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.item;                                                                                
 modifies Stack.head;                                                                               
                                                                                                    
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
 var Node._state_pre: [Node]State;                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Node;                                                                                  
 var y_mid: Stack;                                                                                  
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.item[x];                                                                              
 Node.item[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.item[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.item.Stack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.item(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.item.Stack.head(t: Tid, u: Tid, v: int, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Node.item;                                                                                
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node._state_pre: [Node]State;                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Node;                                                                                 
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.item(t: Tid,x: Node,v: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
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
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
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
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
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
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_mid: [Stack]Node;                                                                   
 var Stack._state_mid: [Stack]State;                                                                
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var w_mid: int;                                                                                    
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var x_mid: Stack;                                                                                  
 var Node._state_mid: [Node]State;                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.item[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
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
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.item(u: Tid,y: Node,w: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.item[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.head.Node.item(t: Tid, u: Tid, v: Node, w: int, w0: int, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Stack.head;                                                                               
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
 var Node._state_pre: [Node]State;                                                                  
 var x_pre: Stack;                                                                                  
 var y_pre: Node;                                                                                   
 var w_pre: int;                                                                                    
 var v_pre: Node;                                                                                   
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.head_pre: [Stack]Node;                                                                   
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var Node.item_post: [Node]int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var x_post: Stack;                                                                                 
 var v_post: Node;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.item(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.head.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Node)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Node;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
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
 var Node.item_mid: [Node]int;                                                                      
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.head[x];                                                                             
 Stack.head[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.item_mid == Node.item && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Stack._state_mid == Stack._state && Stack.head_mid == Stack.head && Stack._lock_mid == Stack._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.head[x] := tmpV;                                                                             
 Stack.head[y] := w;                                                                                
 _writeByTPost := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.head(u: Tid,y: Stack,w: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.head(t: Tid,x: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.head.Stack.head(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Stack, y: Stack)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
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
 var Node.item_pre: [Node]int;                                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack.head_post: [Stack]Node;                                                                  
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Node.item_post: [Node]int;                                                                     
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
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.head(t: Tid,x: Stack,v: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.head[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.item_post == Node.item && Node.next_post == Node.next && Node._lock_post == Node._lock && Stack._state_post == Stack._state && Stack.head_post == Stack.head && Stack._lock_post == Stack._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.head(u: Tid,y: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node.item;                                                                                 
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Stack._state;                                                                              
modifies Stack.head;                                                                                
modifies Stack._lock;                                                                               
ensures StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
ensures Y(tid , old(Node._state), old(Node.item), old(Node.next), old(Node._lock), old(Stack._state), old(Stack.head), old(Stack._lock) , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
                                                                                                    
// Node.item:                                                                                       
                                                                                                    
function {:inline} Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.item(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Node.item[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.item(tid : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.item(u: Tid,this: Node,newValue: int,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.item(tid, this, Node.item[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.item.Transitive(tid : Tid, this: Node, newValue : int , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var newValue_pre: int;                                                                              
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var Stack._state_pre: [Stack]State;                                                                 
var Stack.head_pre: [Stack]Node;                                                                    
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Node.item(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.item(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Node.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
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
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
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
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
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
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _N);
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var this_yield: Node;                                                                               
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
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
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Stack.head:                                                                                      
                                                                                                    
function {:inline} Y_Stack.head(tid : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack.head(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Stack.head[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack.head(tid : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node.item_yield: [Node]int;                                                                     
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
 assume !isError(m#moverPath(WriteEval.Stack.head(u: Tid,this: Stack,newValue: Node,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.head(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Reflexive(tid : Tid, this: Stack , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.head(tid, this, Stack.head[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack.head.Transitive(tid : Tid, this: Stack, newValue : Node , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
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
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var this_post: Stack;                                                                               
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Stack.head(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack.head(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
// Stack._lock:                                                                                     
                                                                                                    
function {:inline} Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _R)) ==> (Stack._lock[this] == newValue))
 &&(((Stack._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node.item_yield: [Node]int;                                                                     
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
 assume !isError(m#moverPath(WriteEval.Stack._lock(u: Tid,this: Stack,newValue: Tid,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)));
 assume leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Node._state,Node.item,Node.next,Node._lock,Stack._state,Stack.head,Stack._lock)), _N);
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Reflexive(tid : Tid, this: Stack , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.next_yield: [Node]Node;                                                                    
var Stack._lock_yield: [Stack]Tid;                                                                  
var Node.item_yield: [Node]int;                                                                     
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack.head_yield: [Stack]Node;                                                                  
var Node._lock_yield: [Node]Tid;                                                                    
var Stack._state_yield: [Stack]State;                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.item_yield == Node.item && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Stack._state_yield == Stack._state && Stack.head_yield == Stack.head && Stack._lock_yield == Stack._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, Stack._lock[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Transitive(tid : Tid, this: Stack, newValue : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid)
 requires StateInvariant(Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
 requires StateInvariant(Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
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
var Node.item_pre: [Node]int;                                                                       
                                                                                                    
var Stack.head_post: [Stack]Node;                                                                   
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var this_post: Stack;                                                                               
var Node.item_post: [Node]int;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume Node._state_pre == Node._state && Node.item_pre == Node.item && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Stack._state_pre == Stack._state && Stack.head_pre == Stack.head && Stack._lock_pre == Stack._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
 assume Y_Stack._lock(tid, this, newValue , Node._state_p, Node.item_p, Node.next_p, Node._lock_p, Stack._state_p, Stack.head_p, Stack._lock_p);
assume Node._state_post == Node._state_p && Node.item_post == Node.item_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Stack._state_post == Stack._state_p && Stack.head_post == Stack.head_p && Stack._lock_post == Stack._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack._lock(tid, this, newValue , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.item: [Node]int, Node.next: [Node]Node, Node._lock: [Node]Tid, Stack._state: [Stack]State, Stack.head: [Stack]Node, Stack._lock: [Stack]Tid , Node._state_p: [Node]State, Node.item_p: [Node]int, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Stack._state_p: [Stack]State, Stack.head_p: [Stack]Node, Stack._lock_p: [Stack]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.item(tid : Tid, this, Node.item_p[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Stack :: Y_Stack.head(tid : Tid, this, Stack.head_p[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall this: Stack :: Y_Stack._lock(tid : Tid, this, Stack._lock_p[this] , Node._state, Node.item, Node.next, Node._lock, Stack._state, Stack.head, Stack._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
 && (forall _i : Stack :: isShared(Stack._state[_i]) ==> isShared(Stack._state_p[_i]))              
 && (forall _i : Stack :: isLocal(Stack._state[_i], tid) <==> isLocal(Stack._state_p[_i], tid))     
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1285.1-1565.2: (Method:18.5)
// 1297.1-1297.24: (18.5): Bad tid
// 1298.1-1298.39: (18.5): this is not global
// 1410.1-1410.29: (19.9): Cannot have potential null deference in left-mover part.
// 1414.1-1414.27: (19.9): Reduction failure
// 1416.2-1418.2: (class anchor.sink.VarDeclStmt:20.9)
// 1419.2-1427.39: (class anchor.sink.Alloc:20.9)
// 1428.2-1430.2: (class anchor.sink.VarDeclStmt:20.9)
// 1431.2-1448.27: (class anchor.sink.Read:20.9)
// 1443.1-1443.29: (20.9): Cannot have potential null deference in left-mover part.
// 1447.1-1447.27: (20.9): Reduction failure
// 1451.2-1453.2: (class anchor.sink.VarDeclStmt:20.9)
// 1454.2-1456.2: (class anchor.sink.VarDeclStmt:20.9)
// 1457.2-1459.2: (class anchor.sink.VarDeclStmt:20.9)
// 1460.2-1463.19: (class anchor.sink.Assign:20.9)
// 1464.2-1467.19: (class anchor.sink.Assign:20.9)
// 1468.2-1471.19: (class anchor.sink.Assign:20.9)
// 1472.2-1475.34: (class anchor.sink.Assume:7.5)
// 1476.2-1479.42: (class anchor.sink.Assume:7.5)
// 1481.2-1497.34: (class anchor.sink.Write:8.7)
// 1493.1-1493.32: (8.7): Cannot have potential null deference in left-mover part.
// 1496.1-1496.27: (8.7): Reduction failure
// 1499.2-1520.2: (class anchor.sink.Write:9.7)
// 1511.1-1511.32: (9.7): Cannot have potential null deference in left-mover part.
// 1514.1-1514.27: (9.7): Reduction failure
// 1518.1-1518.63: (9.7): next$255 became shared, but next$255.next may not be shared.
// 1521.2-1524.23: (class anchor.sink.Break:7.31)
// 1527.2-1548.2: (class anchor.sink.Write:21.9)
// 1539.1-1539.29: (21.9): Cannot have potential null deference in left-mover part.
// 1542.1-1542.27: (21.9): Reduction failure
// 1546.1-1546.59: (21.9): node became shared, but node.next may not be shared.
// 1552.1-1552.29: (22.9): Cannot have potential null deference in left-mover part.
// 1554.1-1554.34: (22.9): lock not held
// 1556.1-1556.27: (22.9): Reduction failure
// 1558.2-1564.9: (class anchor.sink.Return:18.31)
// 1566.1-1919.2: (Method:25.5)
// 1578.1-1578.24: (25.5): Bad tid
// 1579.1-1579.39: (25.5): this is not global
// 1745.2-1747.2: (class anchor.sink.VarDeclStmt:26.7)
// 1751.1-1751.29: (27.7): Cannot have potential null deference in left-mover part.
// 1755.1-1755.27: (27.7): Reduction failure
// 1757.2-1759.2: (class anchor.sink.VarDeclStmt:28.7)
// 1760.2-1762.2: (class anchor.sink.VarDeclStmt:28.7)
// 1763.2-1780.27: (class anchor.sink.Read:28.7)
// 1775.1-1775.29: (28.7): Cannot have potential null deference in left-mover part.
// 1779.1-1779.27: (28.7): Reduction failure
// 1781.2-1784.28: (class anchor.sink.Assign:28.7)
// 1786.3-1788.3: (class anchor.sink.VarDeclStmt:29.9)
// 1789.3-1806.28: (class anchor.sink.Read:29.9)
// 1801.1-1801.30: (29.9): Cannot have potential null deference in left-mover part.
// 1805.1-1805.28: (29.9): Reduction failure
// 1807.3-1824.28: (class anchor.sink.Read:29.9)
// 1819.1-1819.29: (29.9): Cannot have potential null deference in left-mover part.
// 1823.1-1823.28: (29.9): Reduction failure
// 1825.3-1827.3: (class anchor.sink.VarDeclStmt:30.9)
// 1828.3-1830.3: (class anchor.sink.VarDeclStmt:30.9)
// 1831.3-1848.28: (class anchor.sink.Read:30.9)
// 1843.1-1843.30: (30.9): Cannot have potential null deference in left-mover part.
// 1847.1-1847.28: (30.9): Reduction failure
// 1849.3-1866.27: (class anchor.sink.Read:30.9)
// 1861.1-1861.29: (30.9): Cannot have potential null deference in left-mover part.
// 1865.1-1865.28: (30.9): Reduction failure
// 1868.3-1889.3: (class anchor.sink.Write:30.9)
// 1880.1-1880.30: (30.9): Cannot have potential null deference in left-mover part.
// 1883.1-1883.28: (30.9): Reduction failure
// 1887.1-1887.60: (30.9): tmp5 became shared, but tmp5.next may not be shared.
// 1891.3-1894.17: (class anchor.sink.Assign:32.9)
// 1899.1-1899.29: (34.7): Cannot have potential null deference in left-mover part.
// 1901.1-1901.34: (34.7): lock not held
// 1903.1-1903.27: (34.7): Reduction failure
// 1905.2-1911.9: (class anchor.sink.Return:35.7)
// 1912.2-1918.9: (class anchor.sink.Return:25.22)
// 1920.1-2322.2: (Method:38.5)
// 1932.1-1932.24: (38.5): Bad tid
// 1933.1-1933.39: (38.5): this is not global
// 2105.1-2105.29: (39.20): Cannot have potential null deference in left-mover part.
// 2109.1-2109.27: (39.20): Reduction failure
// 2111.2-2113.2: (class anchor.sink.VarDeclStmt:40.9)
// 2114.2-2116.2: (class anchor.sink.VarDeclStmt:40.9)
// 2117.2-2134.27: (class anchor.sink.Read:40.9)
// 2129.1-2129.29: (40.9): Cannot have potential null deference in left-mover part.
// 2133.1-2133.27: (40.9): Reduction failure
// 2135.2-2138.28: (class anchor.sink.Assign:40.9)
// 2140.3-2142.3: (class anchor.sink.VarDeclStmt:40.34)
// 2143.3-2146.16: (class anchor.sink.Assign:40.34)
// 2150.1-2150.30: (41.7): Cannot have potential null deference in left-mover part.
// 2152.1-2152.35: (41.7): lock not held
// 2154.1-2154.28: (41.7): Reduction failure
// 2156.3-2162.10: (class anchor.sink.Return:40.34)
// 2168.1-2168.29: (41.7): Cannot have potential null deference in left-mover part.
// 2170.1-2170.34: (41.7): lock not held
// 2172.1-2172.27: (41.7): Reduction failure
// 2177.1-2177.29: (42.20): Cannot have potential null deference in left-mover part.
// 2181.1-2181.27: (42.20): Reduction failure
// 2183.2-2185.2: (class anchor.sink.VarDeclStmt:43.9)
// 2186.2-2188.2: (class anchor.sink.VarDeclStmt:43.9)
// 2189.2-2206.28: (class anchor.sink.Read:43.9)
// 2201.1-2201.29: (43.9): Cannot have potential null deference in left-mover part.
// 2205.1-2205.27: (43.9): Reduction failure
// 2207.2-2224.28: (class anchor.sink.Read:43.9)
// 2219.1-2219.29: (43.9): Cannot have potential null deference in left-mover part.
// 2223.1-2223.27: (43.9): Reduction failure
// 2225.2-2227.2: (class anchor.sink.VarDeclStmt:44.9)
// 2228.2-2230.2: (class anchor.sink.VarDeclStmt:44.9)
// 2231.2-2248.28: (class anchor.sink.Read:44.9)
// 2243.1-2243.29: (44.9): Cannot have potential null deference in left-mover part.
// 2247.1-2247.27: (44.9): Reduction failure
// 2249.2-2266.28: (class anchor.sink.Read:44.9)
// 2261.1-2261.29: (44.9): Cannot have potential null deference in left-mover part.
// 2265.1-2265.27: (44.9): Reduction failure
// 2268.2-2289.2: (class anchor.sink.Write:44.9)
// 2280.1-2280.29: (44.9): Cannot have potential null deference in left-mover part.
// 2283.1-2283.27: (44.9): Reduction failure
// 2287.1-2287.60: (44.9): tmp11 became shared, but tmp11.next may not be shared.
// 2293.1-2293.29: (46.7): Cannot have potential null deference in left-mover part.
// 2295.1-2295.34: (46.7): lock not held
// 2297.1-2297.27: (46.7): Reduction failure
// 2299.2-2305.9: (class anchor.sink.Return:45.9)
// 2309.1-2309.29: (46.7): Cannot have potential null deference in left-mover part.
// 2311.1-2311.34: (46.7): lock not held
// 2313.1-2313.27: (46.7): Reduction failure
// 2315.2-2321.9: (class anchor.sink.Return:38.23)
// 2323.1-2837.2: (Method:49.5)
// 2335.1-2335.24: (49.5): Bad tid
// 2336.1-2336.39: (49.5): this is not global
// 2577.1-2577.29: (50.20): Cannot have potential null deference in left-mover part.
// 2581.1-2581.27: (50.20): Reduction failure
// 2583.2-2585.2: (class anchor.sink.VarDeclStmt:51.9)
// 2586.2-2588.2: (class anchor.sink.VarDeclStmt:51.9)
// 2589.2-2606.28: (class anchor.sink.Read:51.9)
// 2601.1-2601.29: (51.9): Cannot have potential null deference in left-mover part.
// 2605.1-2605.27: (51.9): Reduction failure
// 2607.2-2610.30: (class anchor.sink.Assign:51.9)
// 2612.3-2614.3: (class anchor.sink.VarDeclStmt:51.34)
// 2615.3-2618.17: (class anchor.sink.Assign:51.34)
// 2622.1-2622.30: (52.7): Cannot have potential null deference in left-mover part.
// 2624.1-2624.35: (52.7): lock not held
// 2626.1-2626.28: (52.7): Reduction failure
// 2628.3-2634.10: (class anchor.sink.Return:51.34)
// 2640.1-2640.29: (52.7): Cannot have potential null deference in left-mover part.
// 2642.1-2642.34: (52.7): lock not held
// 2644.1-2644.27: (52.7): Reduction failure
// 2646.2-2654.42: (class anchor.sink.Yield:53.7)
// 2658.1-2658.29: (54.20): Cannot have potential null deference in left-mover part.
// 2662.1-2662.27: (54.20): Reduction failure
// 2664.2-2666.2: (class anchor.sink.VarDeclStmt:55.9)
// 2667.2-2669.2: (class anchor.sink.VarDeclStmt:55.9)
// 2670.2-2687.28: (class anchor.sink.Read:55.9)
// 2682.1-2682.29: (55.9): Cannot have potential null deference in left-mover part.
// 2686.1-2686.27: (55.9): Reduction failure
// 2688.2-2691.30: (class anchor.sink.Assign:55.9)
// 2692.2-2697.59: (class anchor.sink.Assert:55.9)
// 2697.1-2697.59: (55.9): This assertion may not hold.
// 2698.2-2700.2: (class anchor.sink.VarDeclStmt:56.9)
// 2701.2-2703.2: (class anchor.sink.VarDeclStmt:56.9)
// 2704.2-2721.28: (class anchor.sink.Read:56.9)
// 2716.1-2716.29: (56.9): Cannot have potential null deference in left-mover part.
// 2720.1-2720.27: (56.9): Reduction failure
// 2722.2-2739.28: (class anchor.sink.Read:56.9)
// 2734.1-2734.29: (56.9): Cannot have potential null deference in left-mover part.
// 2738.1-2738.27: (56.9): Reduction failure
// 2740.2-2742.2: (class anchor.sink.VarDeclStmt:57.9)
// 2743.2-2745.2: (class anchor.sink.VarDeclStmt:57.9)
// 2746.2-2763.28: (class anchor.sink.Read:57.9)
// 2758.1-2758.29: (57.9): Cannot have potential null deference in left-mover part.
// 2762.1-2762.27: (57.9): Reduction failure
// 2764.2-2781.28: (class anchor.sink.Read:57.9)
// 2776.1-2776.29: (57.9): Cannot have potential null deference in left-mover part.
// 2780.1-2780.27: (57.9): Reduction failure
// 2783.2-2804.2: (class anchor.sink.Write:57.9)
// 2795.1-2795.29: (57.9): Cannot have potential null deference in left-mover part.
// 2798.1-2798.27: (57.9): Reduction failure
// 2802.1-2802.60: (57.9): tmp19 became shared, but tmp19.next may not be shared.
// 2808.1-2808.29: (59.7): Cannot have potential null deference in left-mover part.
// 2810.1-2810.34: (59.7): lock not held
// 2812.1-2812.27: (59.7): Reduction failure
// 2814.2-2820.9: (class anchor.sink.Return:58.9)
// 2824.1-2824.29: (59.7): Cannot have potential null deference in left-mover part.
// 2826.1-2826.34: (59.7): lock not held
// 2828.1-2828.27: (59.7): Reduction failure
// 2830.2-2836.9: (class anchor.sink.Return:49.23)
// 2924.1-2924.34: (4.5): Node.item failed Write-Write Right-Mover Check
// 2989.1-2989.30: (4.5): Node.item failed Write-Read Right-Mover Check
// 3058.1-3058.34: (4.5): Node.item failed Write-Write Left-Mover Check
// 3124.1-3124.30: (4.5): Node.item failed Write-Read Left-Mover Check
// 3187.1-3187.34: (4.5): Node.item failed Read-Write Right-Mover Check
// 3253.1-3253.34: (4.5): Node.item failed Read-Write Left-Mover Check
// 3318.1-3318.34: (5.5): Node.next failed Write-Write Right-Mover Check
// 3383.1-3383.30: (5.5): Node.next failed Write-Read Right-Mover Check
// 3452.1-3452.34: (5.5): Node.next failed Write-Write Left-Mover Check
// 3518.1-3518.30: (5.5): Node.next failed Write-Read Left-Mover Check
// 3581.1-3581.34: (5.5): Node.next failed Read-Write Right-Mover Check
// 3647.1-3647.34: (5.5): Node.next failed Read-Write Left-Mover Check
// 3712.1-3712.34: (16.5): Stack.head failed Write-Write Right-Mover Check
// 3777.1-3777.30: (16.5): Stack.head failed Write-Read Right-Mover Check
// 3846.1-3846.34: (16.5): Stack.head failed Write-Write Left-Mover Check
// 3912.1-3912.30: (16.5): Stack.head failed Write-Read Left-Mover Check
// 3975.1-3975.34: (16.5): Stack.head failed Read-Write Right-Mover Check
// 4041.1-4041.34: (16.5): Stack.head failed Read-Write Left-Mover Check
// 4118.1-4118.140: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.1)
// 4119.1-4119.101: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.2)
// 4120.1-4120.158: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case A.3)
// 4225.1-4225.140: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case C)
// 4335.1-4335.144: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case D)
// 4336.1-4336.144: (4.5): Node.item is not Write-Write Stable with respect to Node.item (case R)
// 4413.1-4413.136: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case F)
// 4414.1-4414.136: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case H)
// 4415.1-4415.146: (4.5): Node.item is not Read-Write Stable with respect to Node.item (case I)
// 4491.1-4491.136: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case J)
// 4492.1-4492.136: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case K)
// 4493.1-4493.99: (4.5): Node.item is not Write-Read Stable with respect to Node.item (case L)
// 4571.1-4571.140: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.1)
// 4572.1-4572.101: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.2)
// 4573.1-4573.158: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case A.3)
// 4678.1-4678.140: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case C)
// 4788.1-4788.144: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case D)
// 4789.1-4789.144: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case R)
// 4866.1-4866.136: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case F)
// 4867.1-4867.136: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case H)
// 4868.1-4868.146: (4.5): Node.item is not Read-Write Stable with respect to Node.next (case I)
// 4944.1-4944.136: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case J)
// 4945.1-4945.136: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case K)
// 4946.1-4946.99: (5.5): Node.next is not Write-Read Stable with respect to Node.item (case L)
// 5024.1-5024.140: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.1)
// 5025.1-5025.101: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.2)
// 5026.1-5026.156: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case A.3)
// 5131.1-5131.140: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case C)
// 5241.1-5241.144: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case D)
// 5242.1-5242.144: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case R)
// 5319.1-5319.136: (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case F)
// 5320.1-5320.136: (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case H)
// 5321.1-5321.144: (4.5): Node.item is not Read-Write Stable with respect to Stack.head (case I)
// 5397.1-5397.136: (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case J)
// 5398.1-5398.136: (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case K)
// 5399.1-5399.99: (16.5): Stack.head is not Write-Read Stable with respect to Node.item (case L)
// 5477.1-5477.140: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.1)
// 5478.1-5478.101: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.2)
// 5479.1-5479.158: (4.5): Node.item is not Write-Write Stable with respect to Node.next (case A.3)
// 5584.1-5584.140: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case C)
// 5694.1-5694.144: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case D)
// 5695.1-5695.144: (5.5): Node.next is not Write-Write Stable with respect to Node.item (case R)
// 5772.1-5772.136: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case F)
// 5773.1-5773.136: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case H)
// 5774.1-5774.146: (5.5): Node.next is not Read-Write Stable with respect to Node.item (case I)
// 5850.1-5850.136: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case J)
// 5851.1-5851.136: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case K)
// 5852.1-5852.99: (4.5): Node.item is not Write-Read Stable with respect to Node.next (case L)
// 5930.1-5930.140: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 5931.1-5931.101: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 5932.1-5932.158: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 6037.1-6037.140: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 6147.1-6147.144: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 6148.1-6148.144: (5.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 6225.1-6225.136: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 6226.1-6226.136: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 6227.1-6227.146: (5.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 6303.1-6303.136: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 6304.1-6304.136: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 6305.1-6305.99: (5.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 6383.1-6383.140: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.1)
// 6384.1-6384.101: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.2)
// 6385.1-6385.156: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case A.3)
// 6490.1-6490.140: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case C)
// 6600.1-6600.144: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case D)
// 6601.1-6601.144: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case R)
// 6678.1-6678.136: (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case F)
// 6679.1-6679.136: (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case H)
// 6680.1-6680.144: (5.5): Node.next is not Read-Write Stable with respect to Stack.head (case I)
// 6756.1-6756.136: (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case J)
// 6757.1-6757.136: (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case K)
// 6758.1-6758.99: (16.5): Stack.head is not Write-Read Stable with respect to Node.next (case L)
// 6836.1-6836.140: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.1)
// 6837.1-6837.101: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.2)
// 6838.1-6838.156: (4.5): Node.item is not Write-Write Stable with respect to Stack.head (case A.3)
// 6943.1-6943.140: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case C)
// 7053.1-7053.144: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case D)
// 7054.1-7054.144: (16.5): Stack.head is not Write-Write Stable with respect to Node.item (case R)
// 7131.1-7131.136: (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case F)
// 7132.1-7132.136: (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case H)
// 7133.1-7133.144: (16.5): Stack.head is not Read-Write Stable with respect to Node.item (case I)
// 7209.1-7209.136: (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case J)
// 7210.1-7210.136: (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case K)
// 7211.1-7211.99: (4.5): Node.item is not Write-Read Stable with respect to Stack.head (case L)
// 7289.1-7289.140: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.1)
// 7290.1-7290.101: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.2)
// 7291.1-7291.156: (5.5): Node.next is not Write-Write Stable with respect to Stack.head (case A.3)
// 7396.1-7396.140: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case C)
// 7506.1-7506.144: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case D)
// 7507.1-7507.144: (16.5): Stack.head is not Write-Write Stable with respect to Node.next (case R)
// 7584.1-7584.136: (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case F)
// 7585.1-7585.136: (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case H)
// 7586.1-7586.144: (16.5): Stack.head is not Read-Write Stable with respect to Node.next (case I)
// 7662.1-7662.136: (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case J)
// 7663.1-7663.136: (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case K)
// 7664.1-7664.99: (5.5): Node.next is not Write-Read Stable with respect to Stack.head (case L)
// 7742.1-7742.140: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.1)
// 7743.1-7743.101: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.2)
// 7744.1-7744.158: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case A.3)
// 7849.1-7849.140: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case C)
// 7959.1-7959.144: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case D)
// 7960.1-7960.144: (16.5): Stack.head is not Write-Write Stable with respect to Stack.head (case R)
// 8037.1-8037.136: (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case F)
// 8038.1-8038.136: (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case H)
// 8039.1-8039.146: (16.5): Stack.head is not Read-Write Stable with respect to Stack.head (case I)
// 8115.1-8115.136: (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case J)
// 8116.1-8116.136: (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case K)
// 8117.1-8117.99: (16.5): Stack.head is not Write-Read Stable with respect to Stack.head (case L)
// 8152.1-8175.2: (4.5): yields_as clause for Node.item is not valid
// 8180.1-8198.2: (4.5): yields_as clause for Node.item is not reflexive
// 8204.1-8240.2: (4.5): yields_as clause for Node.item is not transitive
// 8259.1-8282.2: (5.5): yields_as clause for Node.next is not valid
// 8287.1-8305.2: (5.5): yields_as clause for Node.next is not reflexive
// 8311.1-8347.2: (5.5): yields_as clause for Node.next is not transitive
// 8367.1-8390.2: (7.32): yields_as clause for Node._lock is not valid
// 8395.1-8413.2: (7.32): yields_as clause for Node._lock is not reflexive
// 8419.1-8455.2: (7.32): yields_as clause for Node._lock is not transitive
// 8474.1-8497.2: (16.5): yields_as clause for Stack.head is not valid
// 8502.1-8520.2: (16.5): yields_as clause for Stack.head is not reflexive
// 8526.1-8562.2: (16.5): yields_as clause for Stack.head is not transitive
// 8582.1-8605.2: (7.32): yields_as clause for Stack._lock is not valid
// 8610.1-8628.2: (7.32): yields_as clause for Stack._lock is not reflexive
// 8634.1-8670.2: (7.32): yields_as clause for Stack._lock is not transitive
