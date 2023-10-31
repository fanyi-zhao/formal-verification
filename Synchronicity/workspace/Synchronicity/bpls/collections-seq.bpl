                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/collections-seq.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array S = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
      array T = Seq<int>[holds(this, tid) ? B : E]                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Seq<int> s;                                                                                 
        Seq<Seq<int>> s2;                                                                           
        s = SeqEmpty<int>();                                                                        
        s = SeqUnit<int>(4);                                                                        
        int tmp1;                                                                                   
        tmp1 = SeqNth<int>(s,0);                                                                    
        assert tmp1 == 4;                                                                           
        int tmp2;                                                                                   
        tmp2 = SeqLen<int>(s);                                                                      
        assert tmp2 == 1;                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> t;                                                                                 
        Seq<int> tmp3;                                                                              
        tmp3 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp4;                                                                              
        tmp4 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp3,tmp4);                                                              
        Seq<int> tmp5;                                                                              
        tmp5 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp6;                                                                              
        tmp6 = SeqUnit<int>(2);                                                                     
        t = SeqConcat<int>(tmp5,tmp6);                                                              
        assert s == t;                                                                              
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        synchronized (this) {                                                                       
          [Cow.S{this}] s;                                                                          
          s = new [Cow.S{this}](0);                                                                 
          [Cow.S{this}] t;                                                                          
          t = new [Cow.S{this}](0);                                                                 
          assert s == t;                                                                            
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f4() {                                                                            
        synchronized (this) {                                                                       
          [Cow.T{this}] s;                                                                          
          s = new [Cow.T{this}](0);                                                                 
          [Cow.T{this}] t;                                                                          
          t = new [Cow.T{this}](0);                                                                 
          assert s == t;                                                                            
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f5() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> tmp7;                                                                              
        tmp7 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp8;                                                                              
        tmp8 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp7,tmp8);                                                              
        Seq<int> t;                                                                                 
        Seq<int> tmp9;                                                                              
        tmp9 = SeqUnit<int>(3);                                                                     
        t = SeqConcat<int>(s,tmp9);                                                                 
        Seq<int> tmp10;                                                                             
        tmp10 = SeqExtract<int>(t,0,1);                                                             
        Seq<int> tmp11;                                                                             
        tmp11 = SeqUnit<int>(1);                                                                    
        assert tmp10 == tmp11;                                                                      
        int tmp12;                                                                                  
        tmp12 = SeqLen<int>(t);                                                                     
        assert tmp12 == 3;                                                                          
        Seq<int> tmp13;                                                                             
        tmp13 = SeqExtract<int>(t,1,2);                                                             
        Seq<int> tmp14;                                                                             
        Seq<int> tmp15;                                                                             
        tmp15 = SeqUnit<int>(2);                                                                    
        Seq<int> tmp16;                                                                             
        tmp16 = SeqUnit<int>(3);                                                                    
        tmp14 = SeqConcat<int>(tmp15,tmp16);                                                        
        assert tmp13 == tmp14;                                                                      
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
      requires SeqLen<int>(s) > 0;                                                                  
      requires 0 <= i && i < SeqLen<int>(s) - 1;                                                    
                                                                                                    
      public void f6(Seq<int> s,int i) {                                                            
        Seq<int> t;                                                                                 
        int tmp17;                                                                                  
        int tmp18;                                                                                  
        tmp18 = SeqLen<int>(s);                                                                     
        tmp17 = tmp18 - 1;                                                                          
        t = SeqExtract<int>(s,1,tmp17);                                                             
        int tmp19;                                                                                  
        tmp19 = SeqNth<int>(t,i);                                                                   
        int tmp20;                                                                                  
        int tmp21;                                                                                  
        tmp21 = i + 1;                                                                              
        tmp20 = SeqNth<int>(s,tmp21);                                                               
        assert tmp19 == tmp20;                                                                      
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array S = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
      array T = Seq<int>[holds(this, tid) ? B : E]                                                  
                                                                                                    
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
        Seq<int> s;                                                                                 
        Seq<Seq<int>> s2;                                                                           
        s = SeqEmpty<int>();                                                                        
        s = SeqUnit<int>(4);                                                                        
        int tmp1;                                                                                   
        tmp1 = SeqNth<int>(s,0);                                                                    
        assert tmp1 == 4;                                                                           
        int tmp2;                                                                                   
        tmp2 = SeqLen<int>(s);                                                                      
        assert tmp2 == 1;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> t;                                                                                 
        Seq<int> tmp3;                                                                              
        tmp3 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp4;                                                                              
        tmp4 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp3,tmp4);                                                              
        Seq<int> tmp5;                                                                              
        tmp5 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp6;                                                                              
        tmp6 = SeqUnit<int>(2);                                                                     
        t = SeqConcat<int>(tmp5,tmp6);                                                              
        assert s == t;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.S{this}] s;                                                                        
            s = new [Cow.S{this}](0);                                                               
            [Cow.S{this}] t;                                                                        
            t = new [Cow.S{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.T{this}] s;                                                                        
            s = new [Cow.T{this}](0);                                                               
            [Cow.T{this}] t;                                                                        
            t = new [Cow.T{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f5() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> tmp7;                                                                              
        tmp7 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp8;                                                                              
        tmp8 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp7,tmp8);                                                              
        Seq<int> t;                                                                                 
        Seq<int> tmp9;                                                                              
        tmp9 = SeqUnit<int>(3);                                                                     
        t = SeqConcat<int>(s,tmp9);                                                                 
        Seq<int> tmp10;                                                                             
        tmp10 = SeqExtract<int>(t,0,1);                                                             
        Seq<int> tmp11;                                                                             
        tmp11 = SeqUnit<int>(1);                                                                    
        assert tmp10 == tmp11;                                                                      
        int tmp12;                                                                                  
        tmp12 = SeqLen<int>(t);                                                                     
        assert tmp12 == 3;                                                                          
        Seq<int> tmp13;                                                                             
        tmp13 = SeqExtract<int>(t,1,2);                                                             
        Seq<int> tmp14;                                                                             
        Seq<int> tmp15;                                                                             
        tmp15 = SeqUnit<int>(2);                                                                    
        Seq<int> tmp16;                                                                             
        tmp16 = SeqUnit<int>(3);                                                                    
        tmp14 = SeqConcat<int>(tmp15,tmp16);                                                        
        assert tmp13 == tmp14;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires SeqLen<int>(s) > 0;                                                                  
      requires 0 <= i && i < SeqLen<int>(s) - 1;                                                    
                                                                                                    
      public void f6(Seq<int> s,int i) {                                                            
        Seq<int> t;                                                                                 
        int tmp17;                                                                                  
        int tmp18;                                                                                  
        tmp18 = SeqLen<int>(s);                                                                     
        tmp17 = tmp18 - 1;                                                                          
        t = SeqExtract<int>(s,1,tmp17);                                                             
        int tmp19;                                                                                  
        tmp19 = SeqNth<int>(t,i);                                                                   
        int tmp20;                                                                                  
        int tmp21;                                                                                  
        tmp21 = i + 1;                                                                              
        tmp20 = SeqNth<int>(s,tmp21);                                                               
        assert tmp19 == tmp20;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array S = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
      array T = Seq<int>[holds(this, tid) ? B : E]                                                  
                                                                                                    
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
        Seq<int> s;                                                                                 
        Seq<Seq<int>> s2;                                                                           
        s = SeqEmpty<int>();                                                                        
        s = SeqUnit<int>(4);                                                                        
        int tmp1;                                                                                   
        tmp1 = SeqNth<int>(s,0);                                                                    
        assert tmp1 == 4;                                                                           
        int tmp2;                                                                                   
        tmp2 = SeqLen<int>(s);                                                                      
        assert tmp2 == 1;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> t;                                                                                 
        Seq<int> tmp3;                                                                              
        tmp3 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp4;                                                                              
        tmp4 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp3,tmp4);                                                              
        Seq<int> tmp5;                                                                              
        tmp5 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp6;                                                                              
        tmp6 = SeqUnit<int>(2);                                                                     
        t = SeqConcat<int>(tmp5,tmp6);                                                              
        assert s == t;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.S{this}] s;                                                                        
            s = new [Cow.S{this}](0);                                                               
            [Cow.S{this}] t;                                                                        
            t = new [Cow.S{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.T{this}] s;                                                                        
            s = new [Cow.T{this}](0);                                                               
            [Cow.T{this}] t;                                                                        
            t = new [Cow.T{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f5() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> tmp7;                                                                              
        tmp7 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp8;                                                                              
        tmp8 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp7,tmp8);                                                              
        Seq<int> t;                                                                                 
        Seq<int> tmp9;                                                                              
        tmp9 = SeqUnit<int>(3);                                                                     
        t = SeqConcat<int>(s,tmp9);                                                                 
        Seq<int> tmp10;                                                                             
        tmp10 = SeqExtract<int>(t,0,1);                                                             
        Seq<int> tmp11;                                                                             
        tmp11 = SeqUnit<int>(1);                                                                    
        assert tmp10 == tmp11;                                                                      
        int tmp12;                                                                                  
        tmp12 = SeqLen<int>(t);                                                                     
        assert tmp12 == 3;                                                                          
        Seq<int> tmp13;                                                                             
        tmp13 = SeqExtract<int>(t,1,2);                                                             
        Seq<int> tmp14;                                                                             
        Seq<int> tmp15;                                                                             
        tmp15 = SeqUnit<int>(2);                                                                    
        Seq<int> tmp16;                                                                             
        tmp16 = SeqUnit<int>(3);                                                                    
        tmp14 = SeqConcat<int>(tmp15,tmp16);                                                        
        assert tmp13 == tmp14;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires SeqLen<int>(s) > 0;                                                                  
      requires 0 <= i && i < SeqLen<int>(s) - 1;                                                    
                                                                                                    
      public void f6(Seq<int> s,int i) {                                                            
        Seq<int> t;                                                                                 
        int tmp17;                                                                                  
        int tmp18;                                                                                  
        tmp18 = SeqLen<int>(s);                                                                     
        tmp17 = tmp18 - 1;                                                                          
        t = SeqExtract<int>(s,1,tmp17);                                                             
        int tmp19;                                                                                  
        tmp19 = SeqNth<int>(t,i);                                                                   
        int tmp20;                                                                                  
        int tmp21;                                                                                  
        tmp21 = i + 1;                                                                              
        tmp20 = SeqNth<int>(s,tmp21);                                                               
        assert tmp19 == tmp20;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array S = int[holds(this, tid) ? B : E]                                                       
                                                                                                    
      array T = Seq<int>[holds(this, tid) ? B : E]                                                  
                                                                                                    
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
        Seq<int> s;                                                                                 
        Seq<Seq<int>> s2;                                                                           
        s = SeqEmpty<int>();                                                                        
        s = SeqUnit<int>(4);                                                                        
        int tmp1;                                                                                   
        tmp1 = SeqNth<int>(s,0);                                                                    
        assert tmp1 == 4;                                                                           
        int tmp2;                                                                                   
        tmp2 = SeqLen<int>(s);                                                                      
        assert tmp2 == 1;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f2() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> t;                                                                                 
        Seq<int> tmp3;                                                                              
        tmp3 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp4;                                                                              
        tmp4 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp3,tmp4);                                                              
        Seq<int> tmp5;                                                                              
        tmp5 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp6;                                                                              
        tmp6 = SeqUnit<int>(2);                                                                     
        t = SeqConcat<int>(tmp5,tmp6);                                                              
        assert s == t;                                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.S{this}] s;                                                                        
            s = new [Cow.S{this}](0);                                                               
            [Cow.S{this}] t;                                                                        
            t = new [Cow.S{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            [Cow.T{this}] s;                                                                        
            s = new [Cow.T{this}](0);                                                               
            [Cow.T{this}] t;                                                                        
            t = new [Cow.T{this}](0);                                                               
            assert s == t;                                                                          
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f5() {                                                                            
        Seq<int> s;                                                                                 
        Seq<int> tmp7;                                                                              
        tmp7 = SeqUnit<int>(1);                                                                     
        Seq<int> tmp8;                                                                              
        tmp8 = SeqUnit<int>(2);                                                                     
        s = SeqConcat<int>(tmp7,tmp8);                                                              
        Seq<int> t;                                                                                 
        Seq<int> tmp9;                                                                              
        tmp9 = SeqUnit<int>(3);                                                                     
        t = SeqConcat<int>(s,tmp9);                                                                 
        Seq<int> tmp10;                                                                             
        tmp10 = SeqExtract<int>(t,0,1);                                                             
        Seq<int> tmp11;                                                                             
        tmp11 = SeqUnit<int>(1);                                                                    
        assert tmp10 == tmp11;                                                                      
        int tmp12;                                                                                  
        tmp12 = SeqLen<int>(t);                                                                     
        assert tmp12 == 3;                                                                          
        Seq<int> tmp13;                                                                             
        tmp13 = SeqExtract<int>(t,1,2);                                                             
        Seq<int> tmp14;                                                                             
        Seq<int> tmp15;                                                                             
        tmp15 = SeqUnit<int>(2);                                                                    
        Seq<int> tmp16;                                                                             
        tmp16 = SeqUnit<int>(3);                                                                    
        tmp14 = SeqConcat<int>(tmp15,tmp16);                                                        
        assert tmp13 == tmp14;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
      requires SeqLen<int>(s) > 0;                                                                  
      requires 0 <= i && i < SeqLen<int>(s) - 1;                                                    
                                                                                                    
      public void f6(Seq<int> s,int i) {                                                            
        Seq<int> t;                                                                                 
        int tmp17;                                                                                  
        int tmp18;                                                                                  
        tmp18 = SeqLen<int>(s);                                                                     
        tmp17 = tmp18 - 1;                                                                          
        t = SeqExtract<int>(s,1,tmp17);                                                             
        int tmp19;                                                                                  
        tmp19 = SeqNth<int>(t,i);                                                                   
        int tmp20;                                                                                  
        int tmp21;                                                                                  
        tmp21 = i + 1;                                                                              
        tmp20 = SeqNth<int>(s,tmp21);                                                               
        assert tmp19 == tmp20;                                                                      
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
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
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
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (4.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (4.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var tid837100: Tid;                                                                                
 var this837085: Cow;                                                                               
 var Array.Cow.T._elems837099: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.T._length837099: [Array.Cow.T]int;                                                   
 var Array.Cow.T._length837085: [Array.Cow.T]int;                                                   
 var Cow._lock837100: [Cow]Tid;                                                                     
 var Cow._state837100: [Cow]State;                                                                  
 var tid837099: Tid;                                                                                
 var this837099: Cow;                                                                               
 var s837085: Seq.int;                                                                              
 var Array.Cow.S._elems837100: [Array.Cow.S]([int]int);                                             
 var Array.Cow.S._state837099: [Array.Cow.S]State;                                                  
 var Array.Cow.S._elems837099: [Array.Cow.S]([int]int);                                             
 var Cow._lock837085: [Cow]Tid;                                                                     
 var Array.Cow.S._length837100: [Array.Cow.S]int;                                                   
 var tid837085: Tid;                                                                                
 var tmp2837100: int;                                                                               
 var Cow._state837099: [Cow]State;                                                                  
 var tmp2837099: int;                                                                               
 var tmp1837100: int;                                                                               
 var s2837099: Seq.Seq.int;                                                                         
 var Array.Cow.T._elems837085: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.S._state837085: [Array.Cow.S]State;                                                  
 var Array.Cow.S._length837085: [Array.Cow.S]int;                                                   
 var s2837085: Seq.Seq.int;                                                                         
 var Cow._state837085: [Cow]State;                                                                  
 var s837100: Seq.int;                                                                              
 var s: Seq.int;                                                                                    
 var Array.Cow.T._state837099: [Array.Cow.T]State;                                                  
 var $recorded.state837100: int;                                                                    
 var tmp1: int;                                                                                     
 var this837100: Cow;                                                                               
 var $pc837085: Phase;                                                                              
 var Array.Cow.S._state837100: [Array.Cow.S]State;                                                  
 var Array.Cow.T._elems837100: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.T._state837085: [Array.Cow.T]State;                                                  
 var $recorded.state837085: int;                                                                    
 var tmp1837099: int;                                                                               
 var Array.Cow.S._elems837085: [Array.Cow.S]([int]int);                                             
 var s2837100: Seq.Seq.int;                                                                         
 var s837099: Seq.int;                                                                              
 var Array.Cow.S._length837099: [Array.Cow.S]int;                                                   
 var $pc837100: Phase;                                                                              
 var tmp1837085: int;                                                                               
 var tmp2: int;                                                                                     
 var $recorded.state837099: int;                                                                    
 var Array.Cow.T._length837100: [Array.Cow.T]int;                                                   
 var s2: Seq.Seq.int;                                                                               
 var Cow._lock837099: [Cow]Tid;                                                                     
 var $pc837099: Phase;                                                                              
 var Array.Cow.T._state837100: [Array.Cow.T]State;                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 5.9: Seq<int> s;                                                                                
                                                                                                    
                                                                                                    
 // 6.9: Seq<Seq<int>> s2;                                                                          
                                                                                                    
                                                                                                    
 // 7.9: s = SeqEmpty<int>();                                                                       
                                                                                                    
 s := SeqEmpty.int();                                                                               
                                                                                                    
 // 8.9: s = SeqUnit<int>(4);                                                                       
                                                                                                    
 s := SeqUnit.int(4);                                                                               
                                                                                                    
 // 9.9: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: tmp1 = SeqNth<int>(s,0);                                                                   
                                                                                                    
 tmp1 := SeqNth.int(s,0);                                                                           
                                                                                                    
 // 9.9: assert tmp1 == 4;                                                                          
                                                                                                    
 assume Cow._state837085 == Cow._state && Cow._lock837085 == Cow._lock && Array.Cow.S._state837085 == Array.Cow.S._state && Array.Cow.S._elems837085 == Array.Cow.S._elems && Array.Cow.S._length837085 == Array.Cow.S._length && Array.Cow.T._state837085 == Array.Cow.T._state && Array.Cow.T._elems837085 == Array.Cow.T._elems && Array.Cow.T._length837085 == Array.Cow.T._length && tmp1837085 == tmp1 && s2837085 == s2 && s837085 == s && this837085 == this && tid837085 == tid;
 assume $recorded.state837085 == 1;                                                                 
 assert (tmp1==4);                                                                                         // (9.9): This assertion may not hold.
                                                                                                    
 // 10.9: int tmp2;                                                                                 
                                                                                                    
                                                                                                    
 // 10.9: tmp2 = SeqLen<int>(s);                                                                    
                                                                                                    
 tmp2 := SeqLen.int(s);                                                                             
                                                                                                    
 // 10.9: assert tmp2 == 1;                                                                         
                                                                                                    
 assume Cow._state837099 == Cow._state && Cow._lock837099 == Cow._lock && Array.Cow.S._state837099 == Array.Cow.S._state && Array.Cow.S._elems837099 == Array.Cow.S._elems && Array.Cow.S._length837099 == Array.Cow.S._length && Array.Cow.T._state837099 == Array.Cow.T._state && Array.Cow.T._elems837099 == Array.Cow.T._elems && Array.Cow.T._length837099 == Array.Cow.T._length && tmp2837099 == tmp2 && tmp1837099 == tmp1 && s2837099 == s2 && s837099 == s && this837099 == this && tid837099 == tid;
 assume $recorded.state837099 == 1;                                                                 
 assert (tmp2==1);                                                                                         // (10.9): This assertion may not hold.
                                                                                                    
 // 4.21: // return;                                                                                
                                                                                                    
 assume Cow._state837100 == Cow._state && Cow._lock837100 == Cow._lock && Array.Cow.S._state837100 == Array.Cow.S._state && Array.Cow.S._elems837100 == Array.Cow.S._elems && Array.Cow.S._length837100 == Array.Cow.S._length && Array.Cow.T._state837100 == Array.Cow.T._state && Array.Cow.T._elems837100 == Array.Cow.T._elems && Array.Cow.T._length837100 == Array.Cow.T._length && tmp2837100 == tmp2 && tmp1837100 == tmp1 && s2837100 == s2 && s837100 == s && this837100 == this && tid837100 == tid;
 assume $recorded.state837100 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (14.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (14.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Array.Cow.S._state837169: [Array.Cow.S]State;                                                  
 var Cow._lock837169: [Cow]Tid;                                                                     
 var this837169: Cow;                                                                               
 var s837168: Seq.int;                                                                              
 var t: Seq.int;                                                                                    
 var Array.Cow.S._state837168: [Array.Cow.S]State;                                                  
 var Array.Cow.T._length837168: [Array.Cow.T]int;                                                   
 var tmp5837168: Seq.int;                                                                           
 var tid837169: Tid;                                                                                
 var tmp4837169: Seq.int;                                                                           
 var $pc837169: Phase;                                                                              
 var tmp5: Seq.int;                                                                                 
 var t837169: Seq.int;                                                                              
 var Array.Cow.T._length837169: [Array.Cow.T]int;                                                   
 var Cow._lock837168: [Cow]Tid;                                                                     
 var tid837168: Tid;                                                                                
 var s837169: Seq.int;                                                                              
 var tmp4: Seq.int;                                                                                 
 var Array.Cow.S._length837169: [Array.Cow.S]int;                                                   
 var Array.Cow.S._elems837168: [Array.Cow.S]([int]int);                                             
 var tmp3837169: Seq.int;                                                                           
 var $recorded.state837169: int;                                                                    
 var tmp6: Seq.int;                                                                                 
 var $pc837168: Phase;                                                                              
 var tmp4837168: Seq.int;                                                                           
 var Array.Cow.T._elems837168: [Array.Cow.T]([int]Seq.int);                                         
 var s: Seq.int;                                                                                    
 var Array.Cow.S._length837168: [Array.Cow.S]int;                                                   
 var tmp3837168: Seq.int;                                                                           
 var Array.Cow.T._elems837169: [Array.Cow.T]([int]Seq.int);                                         
 var $recorded.state837168: int;                                                                    
 var t837168: Seq.int;                                                                              
 var tmp5837169: Seq.int;                                                                           
 var tmp6837168: Seq.int;                                                                           
 var Cow._state837168: [Cow]State;                                                                  
 var this837168: Cow;                                                                               
 var tmp3: Seq.int;                                                                                 
 var Array.Cow.T._state837169: [Array.Cow.T]State;                                                  
 var Array.Cow.S._elems837169: [Array.Cow.S]([int]int);                                             
 var Cow._state837169: [Cow]State;                                                                  
 var Array.Cow.T._state837168: [Array.Cow.T]State;                                                  
 var tmp6837169: Seq.int;                                                                           
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 15.9: Seq<int> s;                                                                               
                                                                                                    
                                                                                                    
 // 16.9: Seq<int> t;                                                                               
                                                                                                    
                                                                                                    
 // 17.9: Seq<int> tmp3;                                                                            
                                                                                                    
                                                                                                    
 // 17.9: tmp3 = SeqUnit<int>(1);                                                                   
                                                                                                    
 tmp3 := SeqUnit.int(1);                                                                            
                                                                                                    
 // 17.9: Seq<int> tmp4;                                                                            
                                                                                                    
                                                                                                    
 // 17.9: tmp4 = SeqUnit<int>(2);                                                                   
                                                                                                    
 tmp4 := SeqUnit.int(2);                                                                            
                                                                                                    
 // 17.9: s = SeqConcat<int>(tmp3,tmp4);                                                            
                                                                                                    
 s := SeqConcat.int(tmp3,tmp4);                                                                     
                                                                                                    
 // 18.9: Seq<int> tmp5;                                                                            
                                                                                                    
                                                                                                    
 // 18.9: tmp5 = SeqUnit<int>(1);                                                                   
                                                                                                    
 tmp5 := SeqUnit.int(1);                                                                            
                                                                                                    
 // 18.9: Seq<int> tmp6;                                                                            
                                                                                                    
                                                                                                    
 // 18.9: tmp6 = SeqUnit<int>(2);                                                                   
                                                                                                    
 tmp6 := SeqUnit.int(2);                                                                            
                                                                                                    
 // 18.9: t = SeqConcat<int>(tmp5,tmp6);                                                            
                                                                                                    
 t := SeqConcat.int(tmp5,tmp6);                                                                     
                                                                                                    
 // 19.9: assert s == t;                                                                            
                                                                                                    
 assume Cow._state837168 == Cow._state && Cow._lock837168 == Cow._lock && Array.Cow.S._state837168 == Array.Cow.S._state && Array.Cow.S._elems837168 == Array.Cow.S._elems && Array.Cow.S._length837168 == Array.Cow.S._length && Array.Cow.T._state837168 == Array.Cow.T._state && Array.Cow.T._elems837168 == Array.Cow.T._elems && Array.Cow.T._length837168 == Array.Cow.T._length && tmp6837168 == tmp6 && tmp5837168 == tmp5 && tmp4837168 == tmp4 && tmp3837168 == tmp3 && t837168 == t && s837168 == s && this837168 == this && tid837168 == tid;
 assume $recorded.state837168 == 1;                                                                 
 assert (s==t);                                                                                            // (19.9): This assertion may not hold.
                                                                                                    
 // 14.22: // return;                                                                               
                                                                                                    
 assume Cow._state837169 == Cow._state && Cow._lock837169 == Cow._lock && Array.Cow.S._state837169 == Array.Cow.S._state && Array.Cow.S._elems837169 == Array.Cow.S._elems && Array.Cow.S._length837169 == Array.Cow.S._length && Array.Cow.T._state837169 == Array.Cow.T._state && Array.Cow.T._elems837169 == Array.Cow.T._elems && Array.Cow.T._length837169 == Array.Cow.T._length && tmp6837169 == tmp6 && tmp5837169 == tmp5 && tmp4837169 == tmp4 && tmp3837169 == tmp3 && t837169 == t && s837169 == s && this837169 == this && tid837169 == tid;
 assume $recorded.state837169 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (25.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (25.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var $pc837204: Phase;                                                                              
 var Array.Cow.S._length837204: [Array.Cow.S]int;                                                   
 var Array.Cow.T._length837199: [Array.Cow.T]int;                                                   
 var tid837204: Tid;                                                                                
 var this837204: Cow;                                                                               
 var Array.Cow.T._length837204: [Array.Cow.T]int;                                                   
 var Array.Cow.S._length837199: [Array.Cow.S]int;                                                   
 var s: Array.Cow.S;                                                                                
 var Cow._lock837204: [Cow]Tid;                                                                     
 var Cow._lock837199: [Cow]Tid;                                                                     
 var tid837199: Tid;                                                                                
 var Cow._state837204: [Cow]State;                                                                  
 var t: Array.Cow.S;                                                                                
 var Array.Cow.S._state837199: [Array.Cow.S]State;                                                  
 var Cow._state837199: [Cow]State;                                                                  
 var Array.Cow.T._elems837204: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.S._elems837199: [Array.Cow.S]([int]int);                                             
 var Array.Cow.T._state837199: [Array.Cow.T]State;                                                  
 var $recorded.state837204: int;                                                                    
 var Array.Cow.T._state837204: [Array.Cow.T]State;                                                  
 var $recorded.state837199: int;                                                                    
 var Array.Cow.T._elems837199: [Array.Cow.T]([int]Seq.int);                                         
 var this837199: Cow;                                                                               
 var Array.Cow.S._state837204: [Array.Cow.S]State;                                                  
 var t837199: Array.Cow.S;                                                                          
 var $pc837199: Phase;                                                                              
 var s837199: Array.Cow.S;                                                                          
 var Array.Cow.S._elems837204: [Array.Cow.S]([int]int);                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (26.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (26.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 27.13: [Cow.S{this}] s;                                                                         
                                                                                                    
                                                                                                    
 // 27.13: s = new [Cow.S{this}](0);                                                                
                                                                                                    
 havoc s;                                                                                           
 assume isFresh(Array.Cow.S._state[s]);                                                             
 assume Array.Cow.S._length[s] == 0;                                                                
 assume Array.Cow.S._this[s] == this;                                                               
 Array.Cow.S._state[s] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.S._elems[s][_i] == 0);                            
                                                                                                    
 // 28.13: [Cow.S{this}] t;                                                                         
                                                                                                    
                                                                                                    
 // 28.13: t = new [Cow.S{this}](0);                                                                
                                                                                                    
 havoc t;                                                                                           
 assume isFresh(Array.Cow.S._state[t]);                                                             
 assume Array.Cow.S._length[t] == 0;                                                                
 assume Array.Cow.S._this[t] == this;                                                               
 Array.Cow.S._state[t] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.S._elems[t][_i] == 0);                            
                                                                                                    
 // 32.13: assert s == t;                                                                           
                                                                                                    
 assume Cow._state837199 == Cow._state && Cow._lock837199 == Cow._lock && Array.Cow.S._state837199 == Array.Cow.S._state && Array.Cow.S._elems837199 == Array.Cow.S._elems && Array.Cow.S._length837199 == Array.Cow.S._length && Array.Cow.T._state837199 == Array.Cow.T._state && Array.Cow.T._elems837199 == Array.Cow.T._elems && Array.Cow.T._length837199 == Array.Cow.T._length && t837199 == t && s837199 == s && this837199 == this && tid837199 == tid;
 assume $recorded.state837199 == 1;                                                                 
 assert (s==t);                                                                                            // (32.13): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (33.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (33.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (33.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 25.22: // return;                                                                               
                                                                                                    
 assume Cow._state837204 == Cow._state && Cow._lock837204 == Cow._lock && Array.Cow.S._state837204 == Array.Cow.S._state && Array.Cow.S._elems837204 == Array.Cow.S._elems && Array.Cow.S._length837204 == Array.Cow.S._length && Array.Cow.T._state837204 == Array.Cow.T._state && Array.Cow.T._elems837204 == Array.Cow.T._elems && Array.Cow.T._length837204 == Array.Cow.T._length && this837204 == this && tid837204 == tid;
 assume $recorded.state837204 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f4(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (36.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (36.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var Array.Cow.S._length837234: [Array.Cow.S]int;                                                   
 var s837234: Array.Cow.T;                                                                          
 var this837234: Cow;                                                                               
 var Array.Cow.T._state837234: [Array.Cow.T]State;                                                  
 var Array.Cow.S._state837234: [Array.Cow.S]State;                                                  
 var Array.Cow.S._length837239: [Array.Cow.S]int;                                                   
 var Array.Cow.T._state837239: [Array.Cow.T]State;                                                  
 var this837239: Cow;                                                                               
 var Array.Cow.S._elems837239: [Array.Cow.S]([int]int);                                             
 var Array.Cow.T._length837234: [Array.Cow.T]int;                                                   
 var $pc837234: Phase;                                                                              
 var Cow._lock837239: [Cow]Tid;                                                                     
 var t837234: Array.Cow.T;                                                                          
 var Array.Cow.S._elems837234: [Array.Cow.S]([int]int);                                             
 var $recorded.state837234: int;                                                                    
 var Array.Cow.T._elems837239: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.T._length837239: [Array.Cow.T]int;                                                   
 var Array.Cow.T._elems837234: [Array.Cow.T]([int]Seq.int);                                         
 var tid837239: Tid;                                                                                
 var Cow._lock837234: [Cow]Tid;                                                                     
 var Cow._state837239: [Cow]State;                                                                  
 var Array.Cow.S._state837239: [Array.Cow.S]State;                                                  
 var $pc837239: Phase;                                                                              
 var t: Array.Cow.T;                                                                                
 var Cow._state837234: [Cow]State;                                                                  
 var s: Array.Cow.T;                                                                                
 var $recorded.state837239: int;                                                                    
 var tid837234: Tid;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (37.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (37.22): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 38.13: [Cow.T{this}] s;                                                                         
                                                                                                    
                                                                                                    
 // 38.13: s = new [Cow.T{this}](0);                                                                
                                                                                                    
 havoc s;                                                                                           
 assume isFresh(Array.Cow.T._state[s]);                                                             
 assume Array.Cow.T._length[s] == 0;                                                                
 assume Array.Cow.T._this[s] == this;                                                               
 Array.Cow.T._state[s] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T._elems[s][_i] == SeqEmpty.int() : Seq.int);     
                                                                                                    
 // 39.13: [Cow.T{this}] t;                                                                         
                                                                                                    
                                                                                                    
 // 39.13: t = new [Cow.T{this}](0);                                                                
                                                                                                    
 havoc t;                                                                                           
 assume isFresh(Array.Cow.T._state[t]);                                                             
 assume Array.Cow.T._length[t] == 0;                                                                
 assume Array.Cow.T._this[t] == this;                                                               
 Array.Cow.T._state[t] := LOCAL(tid);                                                               
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.T._elems[t][_i] == SeqEmpty.int() : Seq.int);     
                                                                                                    
 // 43.13: assert s == t;                                                                           
                                                                                                    
 assume Cow._state837234 == Cow._state && Cow._lock837234 == Cow._lock && Array.Cow.S._state837234 == Array.Cow.S._state && Array.Cow.S._elems837234 == Array.Cow.S._elems && Array.Cow.S._length837234 == Array.Cow.S._length && Array.Cow.T._state837234 == Array.Cow.T._state && Array.Cow.T._elems837234 == Array.Cow.T._elems && Array.Cow.T._length837234 == Array.Cow.T._length && t837234 == t && s837234 == s && this837234 == this && tid837234 == tid;
 assume $recorded.state837234 == 1;                                                                 
 assert (s==t);                                                                                            // (43.13): This assertion may not hold.
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (44.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 36.22: // return;                                                                               
                                                                                                    
 assume Cow._state837239 == Cow._state && Cow._lock837239 == Cow._lock && Array.Cow.S._state837239 == Array.Cow.S._state && Array.Cow.S._elems837239 == Array.Cow.S._elems && Array.Cow.S._length837239 == Array.Cow.S._length && Array.Cow.T._state837239 == Array.Cow.T._state && Array.Cow.T._elems837239 == Array.Cow.T._elems && Array.Cow.T._length837239 == Array.Cow.T._length && this837239 == this && tid837239 == tid;
 assume $recorded.state837239 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f5(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (47.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (47.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var tmp8: Seq.int;                                                                                 
 var tmp7837383: Seq.int;                                                                           
 var this837320: Cow;                                                                               
 var tid837382: Tid;                                                                                
 var Array.Cow.T._state837320: [Array.Cow.T]State;                                                  
 var Array.Cow.S._length837382: [Array.Cow.S]int;                                                   
 var tmp9: Seq.int;                                                                                 
 var $pc837320: Phase;                                                                              
 var t: Seq.int;                                                                                    
 var tmp11837382: Seq.int;                                                                          
 var Cow._state837320: [Cow]State;                                                                  
 var tmp11837320: Seq.int;                                                                          
 var Array.Cow.T._length837320: [Array.Cow.T]int;                                                   
 var s837382: Seq.int;                                                                              
 var tmp7: Seq.int;                                                                                 
 var tmp11837383: Seq.int;                                                                          
 var tmp9837334: Seq.int;                                                                           
 var tmp16: Seq.int;                                                                                
 var Cow._lock837383: [Cow]Tid;                                                                     
 var tmp7837334: Seq.int;                                                                           
 var this837334: Cow;                                                                               
 var Array.Cow.S._elems837383: [Array.Cow.S]([int]int);                                             
 var Array.Cow.S._length837320: [Array.Cow.S]int;                                                   
 var tmp10837383: Seq.int;                                                                          
 var s837383: Seq.int;                                                                              
 var Cow._lock837382: [Cow]Tid;                                                                     
 var Array.Cow.T._elems837383: [Array.Cow.T]([int]Seq.int);                                         
 var tmp13837382: Seq.int;                                                                          
 var tmp14837383: Seq.int;                                                                          
 var s837334: Seq.int;                                                                              
 var tmp7837382: Seq.int;                                                                           
 var $recorded.state837383: int;                                                                    
 var tmp11: Seq.int;                                                                                
 var Array.Cow.S._state837334: [Array.Cow.S]State;                                                  
 var tmp14: Seq.int;                                                                                
 var $recorded.state837320: int;                                                                    
 var $pc837334: Phase;                                                                              
 var tmp14837382: Seq.int;                                                                          
 var Array.Cow.T._length837383: [Array.Cow.T]int;                                                   
 var Array.Cow.S._state837320: [Array.Cow.S]State;                                                  
 var $pc837382: Phase;                                                                              
 var Array.Cow.S._state837383: [Array.Cow.S]State;                                                  
 var this837383: Cow;                                                                               
 var tid837383: Tid;                                                                                
 var $recorded.state837382: int;                                                                    
 var Array.Cow.S._elems837382: [Array.Cow.S]([int]int);                                             
 var t837382: Seq.int;                                                                              
 var $pc837383: Phase;                                                                              
 var tmp13837383: Seq.int;                                                                          
 var tmp15837382: Seq.int;                                                                          
 var Array.Cow.T._length837382: [Array.Cow.T]int;                                                   
 var s: Seq.int;                                                                                    
 var tmp10837320: Seq.int;                                                                          
 var Array.Cow.S._state837382: [Array.Cow.S]State;                                                  
 var Array.Cow.S._length837334: [Array.Cow.S]int;                                                   
 var tmp10837382: Seq.int;                                                                          
 var Array.Cow.T._state837382: [Array.Cow.T]State;                                                  
 var tmp12837383: int;                                                                              
 var Array.Cow.T._length837334: [Array.Cow.T]int;                                                   
 var tmp8837382: Seq.int;                                                                           
 var Array.Cow.T._elems837320: [Array.Cow.T]([int]Seq.int);                                         
 var tmp9837382: Seq.int;                                                                           
 var tmp9837383: Seq.int;                                                                           
 var Array.Cow.T._state837334: [Array.Cow.T]State;                                                  
 var tmp10837334: Seq.int;                                                                          
 var Array.Cow.S._elems837320: [Array.Cow.S]([int]int);                                             
 var this837382: Cow;                                                                               
 var Array.Cow.T._elems837334: [Array.Cow.T]([int]Seq.int);                                         
 var tmp12837382: int;                                                                              
 var tmp16837382: Seq.int;                                                                          
 var tmp12: int;                                                                                    
 var tid837320: Tid;                                                                                
 var tmp11837334: Seq.int;                                                                          
 var t837320: Seq.int;                                                                              
 var Array.Cow.T._state837383: [Array.Cow.T]State;                                                  
 var tmp7837320: Seq.int;                                                                           
 var tmp8837334: Seq.int;                                                                           
 var tmp13: Seq.int;                                                                                
 var tmp8837383: Seq.int;                                                                           
 var tmp8837320: Seq.int;                                                                           
 var tmp15837383: Seq.int;                                                                          
 var Cow._state837382: [Cow]State;                                                                  
 var t837383: Seq.int;                                                                              
 var Array.Cow.T._elems837382: [Array.Cow.T]([int]Seq.int);                                         
 var Array.Cow.S._elems837334: [Array.Cow.S]([int]int);                                             
 var Cow._lock837334: [Cow]Tid;                                                                     
 var tmp9837320: Seq.int;                                                                           
 var s837320: Seq.int;                                                                              
 var $recorded.state837334: int;                                                                    
 var tmp16837383: Seq.int;                                                                          
 var tid837334: Tid;                                                                                
 var tmp10: Seq.int;                                                                                
 var tmp12837334: int;                                                                              
 var Array.Cow.S._length837383: [Array.Cow.S]int;                                                   
 var Cow._lock837320: [Cow]Tid;                                                                     
 var Cow._state837383: [Cow]State;                                                                  
 var Cow._state837334: [Cow]State;                                                                  
 var tmp15: Seq.int;                                                                                
 var t837334: Seq.int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 48.9: Seq<int> s;                                                                               
                                                                                                    
                                                                                                    
 // 48.9: Seq<int> tmp7;                                                                            
                                                                                                    
                                                                                                    
 // 48.9: tmp7 = SeqUnit<int>(1);                                                                   
                                                                                                    
 tmp7 := SeqUnit.int(1);                                                                            
                                                                                                    
 // 48.9: Seq<int> tmp8;                                                                            
                                                                                                    
                                                                                                    
 // 48.9: tmp8 = SeqUnit<int>(2);                                                                   
                                                                                                    
 tmp8 := SeqUnit.int(2);                                                                            
                                                                                                    
 // 48.9: s = SeqConcat<int>(tmp7,tmp8);                                                            
                                                                                                    
 s := SeqConcat.int(tmp7,tmp8);                                                                     
                                                                                                    
 // 49.9: Seq<int> t;                                                                               
                                                                                                    
                                                                                                    
 // 49.9: Seq<int> tmp9;                                                                            
                                                                                                    
                                                                                                    
 // 49.9: tmp9 = SeqUnit<int>(3);                                                                   
                                                                                                    
 tmp9 := SeqUnit.int(3);                                                                            
                                                                                                    
 // 49.9: t = SeqConcat<int>(s,tmp9);                                                               
                                                                                                    
 t := SeqConcat.int(s,tmp9);                                                                        
                                                                                                    
 // 50.9: Seq<int> tmp10;                                                                           
                                                                                                    
                                                                                                    
 // 50.9: tmp10 = SeqExtract<int>(t,0,1);                                                           
                                                                                                    
 tmp10 := SeqExtract.int(t,0,1);                                                                    
                                                                                                    
 // 50.9: Seq<int> tmp11;                                                                           
                                                                                                    
                                                                                                    
 // 50.9: tmp11 = SeqUnit<int>(1);                                                                  
                                                                                                    
 tmp11 := SeqUnit.int(1);                                                                           
                                                                                                    
 // 50.9: assert tmp10 == tmp11;                                                                    
                                                                                                    
 assume Cow._state837320 == Cow._state && Cow._lock837320 == Cow._lock && Array.Cow.S._state837320 == Array.Cow.S._state && Array.Cow.S._elems837320 == Array.Cow.S._elems && Array.Cow.S._length837320 == Array.Cow.S._length && Array.Cow.T._state837320 == Array.Cow.T._state && Array.Cow.T._elems837320 == Array.Cow.T._elems && Array.Cow.T._length837320 == Array.Cow.T._length && tmp11837320 == tmp11 && tmp10837320 == tmp10 && tmp9837320 == tmp9 && t837320 == t && tmp8837320 == tmp8 && tmp7837320 == tmp7 && s837320 == s && this837320 == this && tid837320 == tid;
 assume $recorded.state837320 == 1;                                                                 
 assert (tmp10==tmp11);                                                                                    // (50.9): This assertion may not hold.
                                                                                                    
 // 51.9: int tmp12;                                                                                
                                                                                                    
                                                                                                    
 // 51.9: tmp12 = SeqLen<int>(t);                                                                   
                                                                                                    
 tmp12 := SeqLen.int(t);                                                                            
                                                                                                    
 // 51.9: assert tmp12 == 3;                                                                        
                                                                                                    
 assume Cow._state837334 == Cow._state && Cow._lock837334 == Cow._lock && Array.Cow.S._state837334 == Array.Cow.S._state && Array.Cow.S._elems837334 == Array.Cow.S._elems && Array.Cow.S._length837334 == Array.Cow.S._length && Array.Cow.T._state837334 == Array.Cow.T._state && Array.Cow.T._elems837334 == Array.Cow.T._elems && Array.Cow.T._length837334 == Array.Cow.T._length && tmp12837334 == tmp12 && tmp11837334 == tmp11 && tmp10837334 == tmp10 && tmp9837334 == tmp9 && t837334 == t && tmp8837334 == tmp8 && tmp7837334 == tmp7 && s837334 == s && this837334 == this && tid837334 == tid;
 assume $recorded.state837334 == 1;                                                                 
 assert (tmp12==3);                                                                                        // (51.9): This assertion may not hold.
                                                                                                    
 // 52.9: Seq<int> tmp13;                                                                           
                                                                                                    
                                                                                                    
 // 52.9: tmp13 = SeqExtract<int>(t,1,2);                                                           
                                                                                                    
 tmp13 := SeqExtract.int(t,1,2);                                                                    
                                                                                                    
 // 52.9: Seq<int> tmp14;                                                                           
                                                                                                    
                                                                                                    
 // 52.9: Seq<int> tmp15;                                                                           
                                                                                                    
                                                                                                    
 // 52.9: tmp15 = SeqUnit<int>(2);                                                                  
                                                                                                    
 tmp15 := SeqUnit.int(2);                                                                           
                                                                                                    
 // 52.9: Seq<int> tmp16;                                                                           
                                                                                                    
                                                                                                    
 // 52.9: tmp16 = SeqUnit<int>(3);                                                                  
                                                                                                    
 tmp16 := SeqUnit.int(3);                                                                           
                                                                                                    
 // 52.9: tmp14 = SeqConcat<int>(tmp15,tmp16);                                                      
                                                                                                    
 tmp14 := SeqConcat.int(tmp15,tmp16);                                                               
                                                                                                    
 // 52.9: assert tmp13 == tmp14;                                                                    
                                                                                                    
 assume Cow._state837382 == Cow._state && Cow._lock837382 == Cow._lock && Array.Cow.S._state837382 == Array.Cow.S._state && Array.Cow.S._elems837382 == Array.Cow.S._elems && Array.Cow.S._length837382 == Array.Cow.S._length && Array.Cow.T._state837382 == Array.Cow.T._state && Array.Cow.T._elems837382 == Array.Cow.T._elems && Array.Cow.T._length837382 == Array.Cow.T._length && tmp16837382 == tmp16 && tmp15837382 == tmp15 && tmp14837382 == tmp14 && tmp13837382 == tmp13 && tmp12837382 == tmp12 && tmp11837382 == tmp11 && tmp10837382 == tmp10 && tmp9837382 == tmp9 && t837382 == t && tmp8837382 == tmp8 && tmp7837382 == tmp7 && s837382 == s && this837382 == this && tid837382 == tid;
 assume $recorded.state837382 == 1;                                                                 
 assert (tmp13==tmp14);                                                                                    // (52.9): This assertion may not hold.
                                                                                                    
 // 47.22: // return;                                                                               
                                                                                                    
 assume Cow._state837383 == Cow._state && Cow._lock837383 == Cow._lock && Array.Cow.S._state837383 == Array.Cow.S._state && Array.Cow.S._elems837383 == Array.Cow.S._elems && Array.Cow.S._length837383 == Array.Cow.S._length && Array.Cow.T._state837383 == Array.Cow.T._state && Array.Cow.T._elems837383 == Array.Cow.T._elems && Array.Cow.T._length837383 == Array.Cow.T._length && tmp16837383 == tmp16 && tmp15837383 == tmp15 && tmp14837383 == tmp14 && tmp13837383 == tmp13 && tmp12837383 == tmp12 && tmp11837383 == tmp11 && tmp10837383 == tmp10 && tmp9837383 == tmp9 && t837383 == t && tmp8837383 == tmp8 && tmp7837383 == tmp7 && s837383 == s && this837383 == this && tid837383 == tid;
 assume $recorded.state837383 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f6(tid:Tid, this : Cow, s : Seq.int, i : int)                                        
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (56.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (56.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
requires (SeqLen.int(s)>0);                                                                         
                                                                                                    
requires ((0<=i)&&(i<(SeqLen.int(s)-1)));                                                           
                                                                                                    
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var $pc837450: Phase;                                                                              
 var tmp17: int;                                                                                    
 var Array.Cow.S._state837449: [Array.Cow.S]State;                                                  
 var tmp18837450: int;                                                                              
 var $recorded.state837449: int;                                                                    
 var this837449: Cow;                                                                               
 var s837450: Seq.int;                                                                              
 var tmp20837449: int;                                                                              
 var i837450: int;                                                                                  
 var t: Seq.int;                                                                                    
 var Cow._lock837449: [Cow]Tid;                                                                     
 var tmp21837450: int;                                                                              
 var t837449: Seq.int;                                                                              
 var tmp18837449: int;                                                                              
 var tmp17837450: int;                                                                              
 var tid837450: Tid;                                                                                
 var Array.Cow.T._elems837450: [Array.Cow.T]([int]Seq.int);                                         
 var Cow._state837449: [Cow]State;                                                                  
 var Cow._state837450: [Cow]State;                                                                  
 var tmp19837450: int;                                                                              
 var Array.Cow.S._elems837449: [Array.Cow.S]([int]int);                                             
 var Array.Cow.T._elems837449: [Array.Cow.T]([int]Seq.int);                                         
 var tmp21: int;                                                                                    
 var Array.Cow.T._state837450: [Array.Cow.T]State;                                                  
 var tmp17837449: int;                                                                              
 var Array.Cow.S._length837450: [Array.Cow.S]int;                                                   
 var this837450: Cow;                                                                               
 var tmp18: int;                                                                                    
 var tid837449: Tid;                                                                                
 var i837449: int;                                                                                  
 var tmp19: int;                                                                                    
 var Array.Cow.S._elems837450: [Array.Cow.S]([int]int);                                             
 var Cow._lock837450: [Cow]Tid;                                                                     
 var tmp19837449: int;                                                                              
 var Array.Cow.S._state837450: [Array.Cow.S]State;                                                  
 var Array.Cow.T._length837449: [Array.Cow.T]int;                                                   
 var tmp20: int;                                                                                    
 var Array.Cow.T._length837450: [Array.Cow.T]int;                                                   
 var $pc837449: Phase;                                                                              
 var Array.Cow.S._length837449: [Array.Cow.S]int;                                                   
 var $recorded.state837450: int;                                                                    
 var tmp20837450: int;                                                                              
 var t837450: Seq.int;                                                                              
 var Array.Cow.T._state837449: [Array.Cow.T]State;                                                  
 var s837449: Seq.int;                                                                              
 var tmp21837449: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
 assert true;                                                                                              // (56.24): Can only have right-mover memory accesses in requires clause
 assert true;                                                                                              // (57.21): Can only have right-mover memory accesses in requires clause
                                                                                                    
                                                                                                    
 // 59.9: Seq<int> t;                                                                               
                                                                                                    
                                                                                                    
 // 59.9: int tmp17;                                                                                
                                                                                                    
                                                                                                    
 // 59.9: int tmp18;                                                                                
                                                                                                    
                                                                                                    
 // 59.9: tmp18 = SeqLen<int>(s);                                                                   
                                                                                                    
 tmp18 := SeqLen.int(s);                                                                            
                                                                                                    
 // 59.9: tmp17 = tmp18 - 1;                                                                        
                                                                                                    
 tmp17 := (tmp18-1);                                                                                
                                                                                                    
 // 59.9: t = SeqExtract<int>(s,1,tmp17);                                                           
                                                                                                    
 t := SeqExtract.int(s,1,tmp17);                                                                    
                                                                                                    
 // 60.9: int tmp19;                                                                                
                                                                                                    
                                                                                                    
 // 60.9: tmp19 = SeqNth<int>(t,i);                                                                 
                                                                                                    
 tmp19 := SeqNth.int(t,i);                                                                          
                                                                                                    
 // 60.9: int tmp20;                                                                                
                                                                                                    
                                                                                                    
 // 60.9: int tmp21;                                                                                
                                                                                                    
                                                                                                    
 // 60.9: tmp21 = i + 1;                                                                            
                                                                                                    
 tmp21 := (i+1);                                                                                    
                                                                                                    
 // 60.9: tmp20 = SeqNth<int>(s,tmp21);                                                             
                                                                                                    
 tmp20 := SeqNth.int(s,tmp21);                                                                      
                                                                                                    
 // 60.9: assert tmp19 == tmp20;                                                                    
                                                                                                    
 assume Cow._state837449 == Cow._state && Cow._lock837449 == Cow._lock && Array.Cow.S._state837449 == Array.Cow.S._state && Array.Cow.S._elems837449 == Array.Cow.S._elems && Array.Cow.S._length837449 == Array.Cow.S._length && Array.Cow.T._state837449 == Array.Cow.T._state && Array.Cow.T._elems837449 == Array.Cow.T._elems && Array.Cow.T._length837449 == Array.Cow.T._length && tmp21837449 == tmp21 && tmp20837449 == tmp20 && tmp19837449 == tmp19 && tmp18837449 == tmp18 && tmp17837449 == tmp17 && t837449 == t && s837449 == s && i837449 == i && this837449 == this && tid837449 == tid;
 assume $recorded.state837449 == 1;                                                                 
 assert (tmp19==tmp20);                                                                                    // (60.9): This assertion may not hold.
                                                                                                    
 // 58.39: // return;                                                                               
                                                                                                    
 assume Cow._state837450 == Cow._state && Cow._lock837450 == Cow._lock && Array.Cow.S._state837450 == Array.Cow.S._state && Array.Cow.S._elems837450 == Array.Cow.S._elems && Array.Cow.S._length837450 == Array.Cow.S._length && Array.Cow.T._state837450 == Array.Cow.T._state && Array.Cow.T._elems837450 == Array.Cow.T._elems && Array.Cow.T._length837450 == Array.Cow.T._length && tmp21837450 == tmp21 && tmp20837450 == tmp20 && tmp19837450 == tmp19 && tmp18837450 == tmp18 && tmp17837450 == tmp17 && t837450 == t && s837450 == s && i837450 == i && this837450 == this && tid837450 == tid;
 assume $recorded.state837450 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.S ***/                                                                         
                                                                                                    
type Array.Cow.S;                                                                                   
const unique Array.Cow.S.null: Array.Cow.S;                                                         
var Array.Cow.S._state: [Array.Cow.S]State;                                                         
                                                                                                    
const Array.Cow.S._this : [Array.Cow.S]Cow;                                                         
const Array.Cow.S._length : [Array.Cow.S]int;                                                       
var Array.Cow.S._elems  : [Array.Cow.S]([int]int);                                                  
                                                                                                    
axiom (forall $this : Array.Cow.S :: Array.Cow.S._length[$this] >= 0);                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.S: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.S(tid: Tid,this : Cow,athis : Array.Cow.S,index : int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.S: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.S(tid: Tid,this : Cow,athis : Array.Cow.S,index : int,newValue: int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.T ***/                                                                         
                                                                                                    
type Array.Cow.T;                                                                                   
const unique Array.Cow.T.null: Array.Cow.T;                                                         
var Array.Cow.T._state: [Array.Cow.T]State;                                                         
                                                                                                    
const Array.Cow.T._this : [Array.Cow.T]Cow;                                                         
const Array.Cow.T._length : [Array.Cow.T]int;                                                       
var Array.Cow.T._elems  : [Array.Cow.T]([int]Seq.int);                                              
                                                                                                    
axiom (forall $this : Array.Cow.T :: Array.Cow.T._length[$this] >= 0);                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T: Spec(Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,newValue: Seq.int,Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow._lock: [Cow]Tid,Array.Cow.S._state: [Array.Cow.S]State,Array.Cow.S._elems: [Array.Cow.S]([int]int),Array.Cow.S._length: [Array.Cow.S]int,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int),Array.Cow.T._length: [Array.Cow.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.S  :: _i == Array.Cow.S.null <==> isNull(Array.Cow.S._state[_i])) &&        
  (forall _i: Array.Cow.T  :: _i == Array.Cow.T.null <==> isNull(Array.Cow.T._state[_i])) &&        
  (forall _t: Tid, _i: Array.Cow.S  :: ValidTid(_t) && isAccessible(Array.Cow.S._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.S._this[_i]], _t)) &&
  (forall _t: Tid, _i: Array.Cow.T  :: ValidTid(_t) && isAccessible(Array.Cow.T._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T._this[_i]], _t)) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (22.5): Array Array.Cow.S failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (22.5): Array Array.Cow.S failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Cow.S._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.S._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (22.5): Array Array.Cow.S failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.Cow.S._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (22.5): Array Array.Cow.S failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (22.5): Array Array.Cow.S failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.S, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[x], u);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.Cow.S._elems[x][i];                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.S._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.S(u: Tid,x_owner: Cow,x: Array.Cow.S,i: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (22.5): Array Array.Cow.S failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (23.5): Array Array.Cow.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (23.5): Array Array.Cow.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Seq.int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (23.5): Array Array.Cow.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Seq.int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (23.5): Array Array.Cow.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (23.5): Array Array.Cow.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Seq.int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (23.5): Array Array.Cow.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.S._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.S._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var x_mid: Array.Cow.S;                                                                            
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.S;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.S._elems[x][i];                                                                  
 Array.Cow.S._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.S._elems[x][i] := tmpV;                                                                  
 Array.Cow.S._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.S._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var x_mid: Array.Cow.S;                                                                            
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.S;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.S._elems[x][i];                                                                  
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.S._elems[x][i] := tmpV;                                                                  
 Array.Cow.S._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.S._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.S._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.S._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.S._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var x_mid: Array.Cow.S;                                                                            
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Seq.int;                                                                               
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var w_mid: Seq.int;                                                                                
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.S._elems[x][i];                                                                  
 Array.Cow.S._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.S._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.S._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var x_mid: Array.Cow.S;                                                                            
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Seq.int;                                                                               
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var w_mid: Seq.int;                                                                                
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.S._elems[x][i];                                                                  
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.S._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.S._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.S._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.S, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.S._state[x], t);                                                   
 requires Array.Cow.S._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.S._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.S;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: int;                                                                                   
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var x_post: Array.Cow.S;                                                                           
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.S(t: Tid,x_owner: Cow,x: Array.Cow.S,i: int,v: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: Seq.int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: Seq.int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Seq.int;                                                                                
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v_mid: Seq.int;                                                                                
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.S;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.S._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: Seq.int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Seq.int;                                                                                
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v_mid: Seq.int;                                                                                
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.S;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.S._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: Seq.int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,w: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.S._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.S._elems(t: Tid, u: Tid, v: Seq.int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.S, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.S._state[y], u);                                                   
 requires Array.Cow.S._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.S._elems;                                                                       
                                                                                                    
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
 var y_pre: Array.Cow.S;                                                                            
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var y_post: Array.Cow.S;                                                                           
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var w_post: int;                                                                                   
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.S(u: Tid,y_owner: Cow,y: Array.Cow.S,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Seq.int;                                                                                
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Seq.int;                                                                               
 var v_mid: Seq.int;                                                                                
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var w_mid: Seq.int;                                                                                
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Seq.int;                                                                                
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
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.S._length_mid: [Array.Cow.S]int;                                                     
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var Array.Cow.S._state_mid: [Array.Cow.S]State;                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]Seq.int);                                           
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: Seq.int;                                                                               
 var v_mid: Seq.int;                                                                                
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Array.Cow.S._elems_mid: [Array.Cow.S]([int]int);                                               
 var w_mid: Seq.int;                                                                                
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow._lock_mid == Cow._lock && Array.Cow.S._state_mid == Array.Cow.S._state && Array.Cow.S._elems_mid == Array.Cow.S._elems && Array.Cow.S._length_mid == Array.Cow.S._length && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: Seq.int, w: Seq.int, w0: Seq.int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var j_pre: int;                                                                                    
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                           
 var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                     
 var v_pre: Seq.int;                                                                                
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var w0_pre: Seq.int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                               
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                    
 var t_pre: Tid;                                                                                    
 var w_pre: Seq.int;                                                                                
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var w0_post: Seq.int;                                                                              
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var Array.Cow.S._state_post: [Array.Cow.S]State;                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                          
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                              
 var Array.Cow.S._length_post: [Array.Cow.S]int;                                                    
 var v_post: Seq.int;                                                                               
 var w_post: Seq.int;                                                                               
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow._lock_post == Cow._lock && Array.Cow.S._state_post == Array.Cow.S._state && Array.Cow.S._elems_post == Array.Cow.S._elems && Array.Cow.S._length_post == Array.Cow.S._length && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
modifies Array.Cow.S._state;                                                                        
modifies Array.Cow.S._elems;                                                                        
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
ensures StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
ensures Y(tid , old(Cow._state), old(Cow._lock), old(Array.Cow.S._state), old(Array.Cow.S._elems), old(Array.Cow.S._length), old(Array.Cow.T._state), old(Array.Cow.T._elems), old(Array.Cow.T._length) , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _N);
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.S._state_p: [Array.Cow.S]State, Array.Cow.S._elems_p: [Array.Cow.S]([int]int), Array.Cow.S._length_p: [Array.Cow.S]int, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                            
var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                      
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                                
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                     
var newValue_pre: Tid;                                                                              
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var Array.Cow.S._state_post: [Array.Cow.S]State;                                                    
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                           
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                               
var Array.Cow.S._length_post: [Array.Cow.S]int;                                                     
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.S._state_post == Array.Cow.S._state_p && Array.Cow.S._elems_post == Array.Cow.S._elems_p && Array.Cow.S._length_post == Array.Cow.S._length_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Array.Cow.S:                                                                                     
                                                                                                    
function {:inline} Y_Array.Cow.S(tid : Tid, athis: Array.Cow.S, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.S._this[athis];                                                              
 ((isAccessible(Array.Cow.S._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.S(tid: Tid,Array.Cow.S._this[athis]: Cow,athis: Array.Cow.S,index: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Array.Cow.S._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.S(tid : Tid, athis: Array.Cow.S, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.S._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.S.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.S, index: int, newValue: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.S._this[athis];                                                         
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var athis_yield: Array.Cow.S;                                                                       
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var index_yield: int;                                                                               
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Array.Cow.S._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.S(u: Tid,Array.Cow.S._this[athis]: Cow,athis: Array.Cow.S,index: int,newValue: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.S(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.S.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.S, index: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.S._this[athis];                                                         
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var athis_yield: Array.Cow.S;                                                                       
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var index_yield: int;                                                                               
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Array.Cow.S._state[athis], tid);                                               
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.S(tid, athis, index, Array.Cow.S._elems[athis][index] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.S.Transitive(tid : Tid, this: Cow, athis: Array.Cow.S, index: int, newValue : int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.S._state_p: [Array.Cow.S]State, Array.Cow.S._elems_p: [Array.Cow.S]([int]int), Array.Cow.S._length_p: [Array.Cow.S]int, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
                                                                                                    
 requires this == Array.Cow.S._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                            
var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                      
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                                
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var athis_pre: Array.Cow.S;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                     
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var athis_post: Array.Cow.S;                                                                        
var $recorded.state_post: int;                                                                      
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var Array.Cow.S._state_post: [Array.Cow.S]State;                                                    
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                           
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                               
var Array.Cow.S._length_post: [Array.Cow.S]int;                                                     
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.S._state_post == Array.Cow.S._state_p && Array.Cow.S._elems_post == Array.Cow.S._elems_p && Array.Cow.S._length_post == Array.Cow.S._length_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.S._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Array.Cow.S(tid, athis, index, newValue , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assert Y_Array.Cow.S(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Array.Cow.T:                                                                                     
                                                                                                    
function {:inline} Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: Seq.int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
 ((isAccessible(Array.Cow.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T(tid: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Array.Cow.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: Seq.int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue: Seq.int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var index_yield: int;                                                                               
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.T(u: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,newValue: Seq.int,Cow._state,Cow._lock,Array.Cow.S._state,Array.Cow.S._elems,Array.Cow.S._length,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Array.Cow.S._state_yield: [Array.Cow.S]State;                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]Seq.int);                                          
var index_yield: int;                                                                               
var Array.Cow.S._elems_yield: [Array.Cow.S]([int]int);                                              
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
var Array.Cow.S._length_yield: [Array.Cow.S]int;                                                    
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
assume Cow._state_yield == Cow._state && Cow._lock_yield == Cow._lock && Array.Cow.S._state_yield == Array.Cow.S._state && Array.Cow.S._elems_yield == Array.Cow.S._elems && Array.Cow.S._length_yield == Array.Cow.S._length && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, Array.Cow.T._elems[athis][index] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue : Seq.int , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.S._state_p: [Array.Cow.S]State, Array.Cow.S._elems_p: [Array.Cow.S]([int]int), Array.Cow.S._length_p: [Array.Cow.S]int, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
                                                                                                    
 requires this == Array.Cow.T._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]Seq.int);                                            
var Array.Cow.S._length_pre: [Array.Cow.S]int;                                                      
var athis_pre: Array.Cow.T;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Array.Cow.S._elems_pre: [Array.Cow.S]([int]int);                                                
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.S._state_pre: [Array.Cow.S]State;                                                     
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var Array.Cow.S._state_post: [Array.Cow.S]State;                                                    
var Array.Cow.T._elems_post: [Array.Cow.T]([int]Seq.int);                                           
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var athis_post: Array.Cow.T;                                                                        
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var Array.Cow.S._elems_post: [Array.Cow.S]([int]int);                                               
var Array.Cow.S._length_post: [Array.Cow.S]int;                                                     
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow._lock_pre == Cow._lock && Array.Cow.S._state_pre == Array.Cow.S._state && Array.Cow.S._elems_pre == Array.Cow.S._elems && Array.Cow.S._length_pre == Array.Cow.S._length && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow._lock_post == Cow._lock_p && Array.Cow.S._state_post == Array.Cow.S._state_p && Array.Cow.S._elems_post == Array.Cow.S._elems_p && Array.Cow.S._length_post == Array.Cow.S._length_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Array.Cow.T(tid, athis, index, newValue , Cow._state_p, Cow._lock_p, Array.Cow.S._state_p, Array.Cow.S._elems_p, Array.Cow.S._length_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow._lock: [Cow]Tid, Array.Cow.S._state: [Array.Cow.S]State, Array.Cow.S._elems: [Array.Cow.S]([int]int), Array.Cow.S._length: [Array.Cow.S]int, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow._lock_p: [Cow]Tid, Array.Cow.S._state_p: [Array.Cow.S]State, Array.Cow.S._elems_p: [Array.Cow.S]([int]int), Array.Cow.S._length_p: [Array.Cow.S]int, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]Seq.int), Array.Cow.T._length_p: [Array.Cow.T]int): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall athis: Array.Cow.S, index: int :: Y_Array.Cow.S(tid : Tid, athis, index, Array.Cow.S._elems_p[athis][index] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall athis: Array.Cow.T, index: int :: Y_Array.Cow.T(tid : Tid, athis, index, Array.Cow.T._elems_p[athis][index] , Cow._state, Cow._lock, Array.Cow.S._state, Array.Cow.S._elems, Array.Cow.S._length, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Array.Cow.S :: isShared(Array.Cow.S._state[_i]) ==> isShared(Array.Cow.S._state_p[_i]))
 && (forall _i : Array.Cow.S :: Array.Cow.S._length[_i] == Array.Cow.S._length_p[_i])               
 && (forall _i : Array.Cow.S :: isLocal(Array.Cow.S._state[_i], tid) <==> isLocal(Array.Cow.S._state_p[_i], tid))
 && (forall _i : Array.Cow.T :: isShared(Array.Cow.T._state[_i]) ==> isShared(Array.Cow.T._state_p[_i]))
 && (forall _i : Array.Cow.T :: Array.Cow.T._length[_i] == Array.Cow.T._length_p[_i])               
 && (forall _i : Array.Cow.T :: isLocal(Array.Cow.T._state[_i], tid) <==> isLocal(Array.Cow.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
/// Seq.int:                                                                                        
                                                                                                    
type {:builtin "(Seq Int)"} Seq.int;                                                                
                                                                                                    
function {:builtin "(as seq.empty (Seq Int))"} SeqEmpty.int(): Seq.int;                             
function {:builtin "seq.len"} SeqLen.int(s: Seq.int): int;                                          
function {:builtin "seq.++"} SeqConcat.int(s1: Seq.int, s2:Seq.int): Seq.int;                       
function {:builtin "seq.unit"} SeqUnit.int(v: int): Seq.int;                                        
function {:builtin "seq.nth"} SeqNth.int(s: Seq.int, i: int): int;                                  
function {:builtin "seq.extract"} SeqExtract.int(s: Seq.int, pos: int, len: int): Seq.int;          
                                                                                                    
function {:inline} SeqEqual.int(a: Seq.int, b: Seq.int) : bool {                                    
SeqLen.int(a) == SeqLen.int(b) &&                                                                   
(forall i : int :: 0 <= i && i < SeqLen.int(a) ==> (SeqNth.int(a, i) == SeqNth.int(b, i)))          
}                                                                                                   
                                                                                                    
function {:inline} SeqSub.int(a: Seq.int, start: int, end: int) : Seq.int {                         
SeqExtract.int(a, start, end-start)                                                                 
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
/// Seq.Seq.int:                                                                                    
                                                                                                    
type {:builtin "(Seq (Seq Int))"} Seq.Seq.int;                                                      
                                                                                                    
function {:builtin "(as seq.empty (Seq (Seq Int)))"} SeqEmpty.Seq.int(): Seq.Seq.int;               
function {:builtin "seq.len"} SeqLen.Seq.int(s: Seq.Seq.int): int;                                  
function {:builtin "seq.++"} SeqConcat.Seq.int(s1: Seq.Seq.int, s2:Seq.Seq.int): Seq.Seq.int;       
function {:builtin "seq.unit"} SeqUnit.Seq.int(v: Seq.int): Seq.Seq.int;                            
function {:builtin "seq.nth"} SeqNth.Seq.int(s: Seq.Seq.int, i: int): Seq.int;                      
function {:builtin "seq.extract"} SeqExtract.Seq.int(s: Seq.Seq.int, pos: int, len: int): Seq.Seq.int;
                                                                                                    
function {:inline} SeqEqual.Seq.int(a: Seq.Seq.int, b: Seq.Seq.int) : bool {                        
SeqLen.Seq.int(a) == SeqLen.Seq.int(b) &&                                                           
(forall i : int :: 0 <= i && i < SeqLen.Seq.int(a) ==> (SeqNth.Seq.int(a, i) == SeqNth.Seq.int(b, i)))
}                                                                                                   
                                                                                                    
function {:inline} SeqSub.Seq.int(a: Seq.Seq.int, start: int, end: int) : Seq.Seq.int {             
SeqExtract.Seq.int(a, start, end-start)                                                             
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
// 882.1-1001.2: (Method:4.5)
// 892.1-892.24: (4.5): Bad tid
// 893.1-893.37: (4.5): this is not global
// 955.2-957.2: (class anchor.sink.VarDeclStmt:5.9)
// 958.2-960.2: (class anchor.sink.VarDeclStmt:6.9)
// 961.2-964.22: (class anchor.sink.Assign:7.9)
// 965.2-968.22: (class anchor.sink.Assign:8.9)
// 969.2-971.2: (class anchor.sink.VarDeclStmt:9.9)
// 972.2-975.26: (class anchor.sink.Assign:9.9)
// 976.2-981.19: (class anchor.sink.Assert:9.9)
// 981.1-981.19: (9.9): This assertion may not hold.
// 982.2-984.2: (class anchor.sink.VarDeclStmt:10.9)
// 985.2-988.24: (class anchor.sink.Assign:10.9)
// 989.2-994.19: (class anchor.sink.Assert:10.9)
// 994.1-994.19: (10.9): This assertion may not hold.
// 995.2-1000.9: (class anchor.sink.Return:4.21)
// 1002.1-1120.2: (Method:14.5)
// 1012.1-1012.24: (14.5): Bad tid
// 1013.1-1013.37: (14.5): this is not global
// 1066.2-1068.2: (class anchor.sink.VarDeclStmt:15.9)
// 1069.2-1071.2: (class anchor.sink.VarDeclStmt:16.9)
// 1072.2-1074.2: (class anchor.sink.VarDeclStmt:17.9)
// 1075.2-1078.25: (class anchor.sink.Assign:17.9)
// 1079.2-1081.2: (class anchor.sink.VarDeclStmt:17.9)
// 1082.2-1085.25: (class anchor.sink.Assign:17.9)
// 1086.2-1089.32: (class anchor.sink.Assign:17.9)
// 1090.2-1092.2: (class anchor.sink.VarDeclStmt:18.9)
// 1093.2-1096.25: (class anchor.sink.Assign:18.9)
// 1097.2-1099.2: (class anchor.sink.VarDeclStmt:18.9)
// 1100.2-1103.25: (class anchor.sink.Assign:18.9)
// 1104.2-1107.32: (class anchor.sink.Assign:18.9)
// 1108.2-1113.16: (class anchor.sink.Assert:19.9)
// 1113.1-1113.16: (19.9): This assertion may not hold.
// 1114.2-1119.9: (class anchor.sink.Return:14.22)
// 1121.1-1225.2: (Method:25.5)
// 1131.1-1131.24: (25.5): Bad tid
// 1132.1-1132.37: (25.5): this is not global
// 1174.1-1174.27: (26.22): Cannot have potential null deference in left-mover part.
// 1178.1-1178.27: (26.22): Reduction failure
// 1180.2-1182.2: (class anchor.sink.VarDeclStmt:27.13)
// 1183.2-1191.73: (class anchor.sink.AAlloc:27.13)
// 1192.2-1194.2: (class anchor.sink.VarDeclStmt:28.13)
// 1195.2-1203.73: (class anchor.sink.AAlloc:28.13)
// 1204.2-1209.16: (class anchor.sink.Assert:32.13)
// 1209.1-1209.16: (32.13): This assertion may not hold.
// 1213.1-1213.27: (33.9): Cannot have potential null deference in left-mover part.
// 1215.1-1215.32: (33.9): lock not held
// 1217.1-1217.27: (33.9): Reduction failure
// 1219.2-1224.9: (class anchor.sink.Return:25.22)
// 1226.1-1330.2: (Method:36.5)
// 1236.1-1236.24: (36.5): Bad tid
// 1237.1-1237.37: (36.5): this is not global
// 1279.1-1279.27: (37.22): Cannot have potential null deference in left-mover part.
// 1283.1-1283.27: (37.22): Reduction failure
// 1285.2-1287.2: (class anchor.sink.VarDeclStmt:38.13)
// 1288.2-1296.96: (class anchor.sink.AAlloc:38.13)
// 1297.2-1299.2: (class anchor.sink.VarDeclStmt:39.13)
// 1300.2-1308.96: (class anchor.sink.AAlloc:39.13)
// 1309.2-1314.16: (class anchor.sink.Assert:43.13)
// 1314.1-1314.16: (43.13): This assertion may not hold.
// 1318.1-1318.27: (44.9): Cannot have potential null deference in left-mover part.
// 1320.1-1320.32: (44.9): lock not held
// 1322.1-1322.27: (44.9): Reduction failure
// 1324.2-1329.9: (class anchor.sink.Return:36.22)
// 1331.1-1560.2: (Method:47.5)
// 1341.1-1341.24: (47.5): Bad tid
// 1342.1-1342.37: (47.5): this is not global
// 1452.2-1454.2: (class anchor.sink.VarDeclStmt:48.9)
// 1455.2-1457.2: (class anchor.sink.VarDeclStmt:48.9)
// 1458.2-1461.25: (class anchor.sink.Assign:48.9)
// 1462.2-1464.2: (class anchor.sink.VarDeclStmt:48.9)
// 1465.2-1468.25: (class anchor.sink.Assign:48.9)
// 1469.2-1472.32: (class anchor.sink.Assign:48.9)
// 1473.2-1475.2: (class anchor.sink.VarDeclStmt:49.9)
// 1476.2-1478.2: (class anchor.sink.VarDeclStmt:49.9)
// 1479.2-1482.25: (class anchor.sink.Assign:49.9)
// 1483.2-1486.29: (class anchor.sink.Assign:49.9)
// 1487.2-1489.2: (class anchor.sink.VarDeclStmt:50.9)
// 1490.2-1493.33: (class anchor.sink.Assign:50.9)
// 1494.2-1496.2: (class anchor.sink.VarDeclStmt:50.9)
// 1497.2-1500.26: (class anchor.sink.Assign:50.9)
// 1501.2-1506.24: (class anchor.sink.Assert:50.9)
// 1506.1-1506.24: (50.9): This assertion may not hold.
// 1507.2-1509.2: (class anchor.sink.VarDeclStmt:51.9)
// 1510.2-1513.25: (class anchor.sink.Assign:51.9)
// 1514.2-1519.20: (class anchor.sink.Assert:51.9)
// 1519.1-1519.20: (51.9): This assertion may not hold.
// 1520.2-1522.2: (class anchor.sink.VarDeclStmt:52.9)
// 1523.2-1526.33: (class anchor.sink.Assign:52.9)
// 1527.2-1529.2: (class anchor.sink.VarDeclStmt:52.9)
// 1530.2-1532.2: (class anchor.sink.VarDeclStmt:52.9)
// 1533.2-1536.26: (class anchor.sink.Assign:52.9)
// 1537.2-1539.2: (class anchor.sink.VarDeclStmt:52.9)
// 1540.2-1543.26: (class anchor.sink.Assign:52.9)
// 1544.2-1547.38: (class anchor.sink.Assign:52.9)
// 1548.2-1553.24: (class anchor.sink.Assert:52.9)
// 1553.1-1553.24: (52.9): This assertion may not hold.
// 1554.2-1559.9: (class anchor.sink.Return:47.22)
// 1561.1-1689.2: (Method:56.5)
// 1571.1-1571.24: (56.5): Bad tid
// 1572.1-1572.37: (56.5): this is not global
// 1632.1-1632.14: (56.24): Can only have right-mover memory accesses in requires clause
// 1633.1-1633.14: (57.21): Can only have right-mover memory accesses in requires clause
// 1635.2-1637.2: (class anchor.sink.VarDeclStmt:59.9)
// 1638.2-1640.2: (class anchor.sink.VarDeclStmt:59.9)
// 1641.2-1643.2: (class anchor.sink.VarDeclStmt:59.9)
// 1644.2-1647.25: (class anchor.sink.Assign:59.9)
// 1648.2-1651.21: (class anchor.sink.Assign:59.9)
// 1652.2-1655.33: (class anchor.sink.Assign:59.9)
// 1656.2-1658.2: (class anchor.sink.VarDeclStmt:60.9)
// 1659.2-1662.27: (class anchor.sink.Assign:60.9)
// 1663.2-1665.2: (class anchor.sink.VarDeclStmt:60.9)
// 1666.2-1668.2: (class anchor.sink.VarDeclStmt:60.9)
// 1669.2-1672.17: (class anchor.sink.Assign:60.9)
// 1673.2-1676.31: (class anchor.sink.Assign:60.9)
// 1677.2-1682.24: (class anchor.sink.Assert:60.9)
// 1682.1-1682.24: (60.9): This assertion may not hold.
// 1683.2-1688.9: (class anchor.sink.Return:58.39)
// 1865.1-1865.34: (22.5): Array Array.Cow.S failed Write-Write Right-Mover Check
// 1938.1-1938.30: (22.5): Array Array.Cow.S failed Write-Read Right-Mover Check
// 2015.1-2015.34: (22.5): Array Array.Cow.S failed Write-Write Left-Mover Check
// 2089.1-2089.30: (22.5): Array Array.Cow.S failed Write-Read Left-Mover Check
// 2160.1-2160.34: (22.5): Array Array.Cow.S failed Read-Write Right-Mover Check
// 2234.1-2234.34: (22.5): Array Array.Cow.S failed Read-Write Left-Mover Check
// 2307.1-2307.34: (23.5): Array Array.Cow.T failed Write-Write Right-Mover Check
// 2380.1-2380.30: (23.5): Array Array.Cow.T failed Write-Read Right-Mover Check
// 2457.1-2457.34: (23.5): Array Array.Cow.T failed Write-Write Left-Mover Check
// 2531.1-2531.30: (23.5): Array Array.Cow.T failed Write-Read Left-Mover Check
// 2602.1-2602.34: (23.5): Array Array.Cow.T failed Read-Write Right-Mover Check
// 2676.1-2676.34: (23.5): Array Array.Cow.T failed Read-Write Left-Mover Check
// 2765.1-2765.140: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.1)
// 2766.1-2766.101: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.2)
// 2767.1-2767.156: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case A.3)
// 2889.1-2889.140: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case C)
// 3016.1-3016.144: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case D)
// 3017.1-3017.144: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.S (case R)
// 3106.1-3106.136: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case F)
// 3107.1-3107.136: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case H)
// 3108.1-3108.144: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.S (case I)
// 3196.1-3196.136: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case J)
// 3197.1-3197.136: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case K)
// 3198.1-3198.99: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.S (case L)
// 3288.1-3288.140: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.1)
// 3289.1-3289.101: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.2)
// 3290.1-3290.156: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case A.3)
// 3412.1-3412.140: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 3539.1-3539.144: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 3540.1-3540.144: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 3629.1-3629.136: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 3630.1-3630.136: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 3631.1-3631.144: (22.5): Array Array.Cow.S is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 3719.1-3719.136: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case J)
// 3720.1-3720.136: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case K)
// 3721.1-3721.99: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.S (case L)
// 3811.1-3811.140: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 3812.1-3812.101: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 3813.1-3813.156: (22.5): Array Array.Cow.S is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 3935.1-3935.140: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case C)
// 4062.1-4062.144: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case D)
// 4063.1-4063.144: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.S (case R)
// 4152.1-4152.136: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case F)
// 4153.1-4153.136: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case H)
// 4154.1-4154.144: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.S (case I)
// 4242.1-4242.136: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 4243.1-4243.136: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 4244.1-4244.99: (22.5): Array Array.Cow.S is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 4334.1-4334.140: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 4335.1-4335.101: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 4336.1-4336.156: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 4458.1-4458.140: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 4585.1-4585.144: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 4586.1-4586.144: (23.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 4675.1-4675.136: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 4676.1-4676.136: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 4677.1-4677.144: (23.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 4765.1-4765.136: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 4766.1-4766.136: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 4767.1-4767.99: (23.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 4802.1-4826.2: (7.32): yields_as clause for Cow._lock is not valid
// 4831.1-4850.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4856.1-4894.2: (7.32): yields_as clause for Cow._lock is not transitive
// 4912.1-4940.2: (22.5): yields_as clause for Array.Cow.S is not valid
// 4941.1-4966.2: (22.5): yields_as clause for Array.Cow.S is not reflexive
// 4971.1-5013.2: (22.5): yields_as clause for Array.Cow.S is not transitive
// 5031.1-5059.2: (23.5): yields_as clause for Array.Cow.T is not valid
// 5060.1-5085.2: (23.5): yields_as clause for Array.Cow.T is not reflexive
// 5090.1-5132.2: (23.5): yields_as clause for Array.Cow.T is not transitive
