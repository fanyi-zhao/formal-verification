                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/seq-bug.anchor:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class SeqExample {                                                                              
      updatesViaCAS Seq<int> seq B                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.seq == SeqEmpty;                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void functions() {                                                                     
        Seq<int> tmp1;                                                                              
        tmp1 = SeqEmpty<int>();                                                                     
        nocheck this.seq := tmp1;                                                                   
        Seq<int> tmp2;                                                                              
        tmp2 = SeqUnit<int>(4);                                                                     
        nocheck this.seq := tmp2;                                                                   
        Seq<int> tmp3;                                                                              
        Seq<int> tmp4;                                                                              
        nocheck tmp4 := this.seq;                                                                   
        Seq<int> tmp5;                                                                              
        nocheck tmp5 := this.seq;                                                                   
        tmp3 = SeqConcat<int>(tmp4,tmp5);                                                           
        nocheck this.seq := tmp3;                                                                   
        int tmp6;                                                                                   
        Seq<int> tmp7;                                                                              
        nocheck tmp7 := this.seq;                                                                   
        tmp6 = SeqNth<int>(tmp7,0);                                                                 
        assert tmp6 == 4;                                                                           
        int tmp8;                                                                                   
        Seq<int> tmp9;                                                                              
        nocheck tmp9 := this.seq;                                                                   
        tmp8 = SeqLen<int>(tmp9);                                                                   
        assert tmp8 == 2;                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void operators() {                                                                     
        Seq<int> tmp10;                                                                             
        tmp10 = SeqUnit<int>(4);                                                                    
        nocheck this.seq := tmp10;                                                                  
        Seq<int> tmp11;                                                                             
        Seq<int> tmp12;                                                                             
        nocheck tmp12 := this.seq;                                                                  
        Seq<int> tmp13;                                                                             
        nocheck tmp13 := this.seq;                                                                  
        tmp11 = SeqConcat<int>(tmp12,tmp13);                                                        
        nocheck this.seq := tmp11;                                                                  
        int tmp14;                                                                                  
        Seq<int> tmp15;                                                                             
        nocheck tmp15 := this.seq;                                                                  
        tmp14 = SeqNth<int>(tmp15,0);                                                               
        assert tmp14 == 4;                                                                          
        int tmp16;                                                                                  
        Seq<int> tmp17;                                                                             
        nocheck tmp17 := this.seq;                                                                  
        tmp16 = SeqLen<int>(tmp17);                                                                 
        assert tmp16 == 2;                                                                          
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SeqExample {                                                                              
      updatesViaCAS Seq<int> seq B                                                                  
                                                                                                    
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
        assume this.seq == SeqEmpty;                                                                
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void functions() {                                                                     
        Seq<int> tmp1;                                                                              
        tmp1 = SeqEmpty<int>();                                                                     
        nocheck this.seq := tmp1;                                                                   
        Seq<int> tmp2;                                                                              
        tmp2 = SeqUnit<int>(4);                                                                     
        nocheck this.seq := tmp2;                                                                   
        Seq<int> tmp3;                                                                              
        Seq<int> tmp4;                                                                              
        nocheck tmp4 := this.seq;                                                                   
        Seq<int> tmp5;                                                                              
        nocheck tmp5 := this.seq;                                                                   
        tmp3 = SeqConcat<int>(tmp4,tmp5);                                                           
        nocheck this.seq := tmp3;                                                                   
        int tmp6;                                                                                   
        Seq<int> tmp7;                                                                              
        nocheck tmp7 := this.seq;                                                                   
        tmp6 = SeqNth<int>(tmp7,0);                                                                 
        assert tmp6 == 4;                                                                           
        int tmp8;                                                                                   
        Seq<int> tmp9;                                                                              
        nocheck tmp9 := this.seq;                                                                   
        tmp8 = SeqLen<int>(tmp9);                                                                   
        assert tmp8 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void operators() {                                                                     
        Seq<int> tmp10;                                                                             
        tmp10 = SeqUnit<int>(4);                                                                    
        nocheck this.seq := tmp10;                                                                  
        Seq<int> tmp11;                                                                             
        Seq<int> tmp12;                                                                             
        nocheck tmp12 := this.seq;                                                                  
        Seq<int> tmp13;                                                                             
        nocheck tmp13 := this.seq;                                                                  
        tmp11 = SeqConcat<int>(tmp12,tmp13);                                                        
        nocheck this.seq := tmp11;                                                                  
        int tmp14;                                                                                  
        Seq<int> tmp15;                                                                             
        nocheck tmp15 := this.seq;                                                                  
        tmp14 = SeqNth<int>(tmp15,0);                                                               
        assert tmp14 == 4;                                                                          
        int tmp16;                                                                                  
        Seq<int> tmp17;                                                                             
        nocheck tmp17 := this.seq;                                                                  
        tmp16 = SeqLen<int>(tmp17);                                                                 
        assert tmp16 == 2;                                                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class SeqExample {                                                                              
      updatesViaCAS Seq<int> seq B                                                                  
                                                                                                    
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
        assume this.seq == SeqEmpty;                                                                
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void functions() {                                                                     
        Seq<int> tmp1;                                                                              
        tmp1 = SeqEmpty<int>();                                                                     
        nocheck this.seq := tmp1;                                                                   
        Seq<int> tmp2;                                                                              
        tmp2 = SeqUnit<int>(4);                                                                     
        nocheck this.seq := tmp2;                                                                   
        Seq<int> tmp3;                                                                              
        Seq<int> tmp4;                                                                              
        nocheck tmp4 := this.seq;                                                                   
        Seq<int> tmp5;                                                                              
        nocheck tmp5 := this.seq;                                                                   
        tmp3 = SeqConcat<int>(tmp4,tmp5);                                                           
        nocheck this.seq := tmp3;                                                                   
        int tmp6;                                                                                   
        Seq<int> tmp7;                                                                              
        nocheck tmp7 := this.seq;                                                                   
        tmp6 = SeqNth<int>(tmp7,0);                                                                 
        assert tmp6 == 4;                                                                           
        int tmp8;                                                                                   
        Seq<int> tmp9;                                                                              
        nocheck tmp9 := this.seq;                                                                   
        tmp8 = SeqLen<int>(tmp9);                                                                   
        assert tmp8 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void operators() {                                                                     
        Seq<int> tmp10;                                                                             
        tmp10 = SeqUnit<int>(4);                                                                    
        nocheck this.seq := tmp10;                                                                  
        Seq<int> tmp11;                                                                             
        Seq<int> tmp12;                                                                             
        nocheck tmp12 := this.seq;                                                                  
        Seq<int> tmp13;                                                                             
        nocheck tmp13 := this.seq;                                                                  
        tmp11 = SeqConcat<int>(tmp12,tmp13);                                                        
        nocheck this.seq := tmp11;                                                                  
        int tmp14;                                                                                  
        Seq<int> tmp15;                                                                             
        nocheck tmp15 := this.seq;                                                                  
        tmp14 = SeqNth<int>(tmp15,0);                                                               
        assert tmp14 == 4;                                                                          
        int tmp16;                                                                                  
        Seq<int> tmp17;                                                                             
        nocheck tmp17 := this.seq;                                                                  
        tmp16 = SeqLen<int>(tmp17);                                                                 
        assert tmp16 == 2;                                                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SeqExample {                                                                              
      updatesViaCAS Seq<int> seq B                                                                  
                                                                                                    
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
        assume this.seq == SeqEmpty;                                                                
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void functions() {                                                                     
        Seq<int> tmp1;                                                                              
        tmp1 = SeqEmpty<int>();                                                                     
        nocheck this.seq := tmp1;                                                                   
        Seq<int> tmp2;                                                                              
        tmp2 = SeqUnit<int>(4);                                                                     
        nocheck this.seq := tmp2;                                                                   
        Seq<int> tmp3;                                                                              
        Seq<int> tmp4;                                                                              
        nocheck tmp4 := this.seq;                                                                   
        Seq<int> tmp5;                                                                              
        nocheck tmp5 := this.seq;                                                                   
        tmp3 = SeqConcat<int>(tmp4,tmp5);                                                           
        nocheck this.seq := tmp3;                                                                   
        int tmp6;                                                                                   
        Seq<int> tmp7;                                                                              
        nocheck tmp7 := this.seq;                                                                   
        tmp6 = SeqNth<int>(tmp7,0);                                                                 
        assert tmp6 == 4;                                                                           
        int tmp8;                                                                                   
        Seq<int> tmp9;                                                                              
        nocheck tmp9 := this.seq;                                                                   
        tmp8 = SeqLen<int>(tmp9);                                                                   
        assert tmp8 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void operators() {                                                                     
        Seq<int> tmp10;                                                                             
        tmp10 = SeqUnit<int>(4);                                                                    
        nocheck this.seq := tmp10;                                                                  
        Seq<int> tmp11;                                                                             
        Seq<int> tmp12;                                                                             
        nocheck tmp12 := this.seq;                                                                  
        Seq<int> tmp13;                                                                             
        nocheck tmp13 := this.seq;                                                                  
        tmp11 = SeqConcat<int>(tmp12,tmp13);                                                        
        nocheck this.seq := tmp11;                                                                  
        int tmp14;                                                                                  
        Seq<int> tmp15;                                                                             
        nocheck tmp15 := this.seq;                                                                  
        tmp14 = SeqNth<int>(tmp15,0);                                                               
        assert tmp14 == 4;                                                                          
        int tmp16;                                                                                  
        Seq<int> tmp17;                                                                             
        nocheck tmp17 := this.seq;                                                                  
        tmp16 = SeqLen<int>(tmp17);                                                                 
        assert tmp16 == 2;                                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl SeqExample ***/                                                                     
                                                                                                    
type SeqExample;                                                                                    
const unique SeqExample.null: SeqExample;                                                           
var SeqExample._state: [SeqExample]State;                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var SeqExample.seq: [SeqExample]Seq.int;                                                            
                                                                                                    
function {:inline} ReadEval.SeqExample.seq(tid: Tid,this : SeqExample,SeqExample._state: [SeqExample]State,SeqExample.seq: [SeqExample]Seq.int,SeqExample._lock: [SeqExample]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := SeqEmpty.int() : Seq.int;                                                         
 moverPath(_B, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SeqExample.seq(tid: Tid,this : SeqExample,newValue: Seq.int,SeqExample._state: [SeqExample]State,SeqExample.seq: [SeqExample]Seq.int,SeqExample._lock: [SeqExample]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_B, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var SeqExample._lock: [SeqExample]Tid;                                                              
                                                                                                    
function {:inline} ReadEval.SeqExample._lock(tid: Tid,this : SeqExample,SeqExample._state: [SeqExample]State,SeqExample.seq: [SeqExample]Seq.int,SeqExample._lock: [SeqExample]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(SeqExample._state[this], tid)) then                                                    
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((SeqExample._lock[this]==tid)) then                                                          
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((SeqExample._lock[this]==Tid.null)&&(newValue==tid))) then                                  
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((SeqExample._lock[this]==tid)&&(newValue==Tid.null))) then                                 
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SeqExample._lock(tid: Tid,this : SeqExample,newValue: Tid,SeqExample._state: [SeqExample]State,SeqExample.seq: [SeqExample]Seq.int,SeqExample._lock: [SeqExample]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(SeqExample._state[this], tid)) then                                                    
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((SeqExample._lock[this]==tid)) then                                                          
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((SeqExample._lock[this]==Tid.null)&&(newValue==tid))) then                                  
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((SeqExample._lock[this]==tid)&&(newValue==Tid.null))) then                                 
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  SeqExample.functions(tid:Tid, this : SeqExample)                                         
modifies SeqExample._state;                                                                         
modifies SeqExample.seq;                                                                            
modifies SeqExample._lock;                                                                          
                                                                                                    
requires ValidTid(tid);                                                                                    // (5.5): Bad tid
requires isShared(SeqExample._state[this]);                                                                // (5.5): this is not global
                                                                                                    
requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                       
                                                                                                    
ensures StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                        
{                                                                                                   
 var SeqExample.seq3955159: [SeqExample]Seq.int;                                                    
 var tid3955137: Tid;                                                                               
 var tmp63955137: int;                                                                              
 var tmp2: Seq.int;                                                                                 
 var tmp53955160: Seq.int;                                                                          
 var tmp43955137: Seq.int;                                                                          
 var tmp33955160: Seq.int;                                                                          
 var this3955160: SeqExample;                                                                       
 var tmp9: Seq.int;                                                                                 
 var $pc3955160: Phase;                                                                             
 var tmp13955159: Seq.int;                                                                          
 var tmp33955159: Seq.int;                                                                          
 var tmp53955159: Seq.int;                                                                          
 var this3955137: SeqExample;                                                                       
 var tmp7: Seq.int;                                                                                 
 var SeqExample.seq3955160: [SeqExample]Seq.int;                                                    
 var tmp8: int;                                                                                     
 var tmp13955160: Seq.int;                                                                          
 var tmp5: Seq.int;                                                                                 
 var tmp43955159: Seq.int;                                                                          
 var tid3955160: Tid;                                                                               
 var tmp73955159: Seq.int;                                                                          
 var tmp13955137: Seq.int;                                                                          
 var tmp83955160: int;                                                                              
 var SeqExample.seq3955137: [SeqExample]Seq.int;                                                    
 var tmp4: Seq.int;                                                                                 
 var tmp83955159: int;                                                                              
 var SeqExample._state3955160: [SeqExample]State;                                                   
 var SeqExample._lock3955137: [SeqExample]Tid;                                                      
 var SeqExample._lock3955160: [SeqExample]Tid;                                                      
 var tmp23955137: Seq.int;                                                                          
 var tmp63955160: int;                                                                              
 var $pc3955159: Phase;                                                                             
 var tmp73955137: Seq.int;                                                                          
 var SeqExample._state3955159: [SeqExample]State;                                                   
 var tmp93955159: Seq.int;                                                                          
 var tmp73955160: Seq.int;                                                                          
 var tmp23955159: Seq.int;                                                                          
 var $recorded.state3955159: int;                                                                   
 var tmp43955160: Seq.int;                                                                          
 var tmp33955137: Seq.int;                                                                          
 var $recorded.state3955160: int;                                                                   
 var $recorded.state3955137: int;                                                                   
 var tmp23955160: Seq.int;                                                                          
 var tmp53955137: Seq.int;                                                                          
 var SeqExample._state3955137: [SeqExample]State;                                                   
 var tmp63955159: int;                                                                              
 var tmp93955160: Seq.int;                                                                          
 var tid3955159: Tid;                                                                               
 var tmp1: Seq.int;                                                                                 
 var this3955159: SeqExample;                                                                       
 var tmp3: Seq.int;                                                                                 
 var $pc3955137: Phase;                                                                             
 var tmp6: int;                                                                                     
 var SeqExample._lock3955159: [SeqExample]Tid;                                                      
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 6.9: Seq<int> tmp1;                                                                             
                                                                                                    
                                                                                                    
 // 6.9: tmp1 = SeqEmpty<int>();                                                                    
                                                                                                    
 tmp1 := SeqEmpty.int();                                                                            
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
  // 6.9: this.seq := tmp1;                                                                         
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
  SeqExample.seq[this] := tmp1;                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 7.9: Seq<int> tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 7.9: tmp2 = SeqUnit<int>(4);                                                                    
                                                                                                    
 tmp2 := SeqUnit.int(4);                                                                            
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
  // 7.9: this.seq := tmp2;                                                                         
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
  SeqExample.seq[this] := tmp2;                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 8.9: Seq<int> tmp3;                                                                             
                                                                                                    
                                                                                                    
 // 8.9: Seq<int> tmp4;                                                                             
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 8.30: tmp4 := this.seq;                                                                        
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp4 := SeqExample.seq[this];                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 8.9: Seq<int> tmp5;                                                                             
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 8.40: tmp5 := this.seq;                                                                        
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp5 := SeqExample.seq[this];                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 8.9: tmp3 = SeqConcat<int>(tmp4,tmp5);                                                          
                                                                                                    
 tmp3 := SeqConcat.int(tmp4,tmp5);                                                                  
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
  // 8.9: this.seq := tmp3;                                                                         
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
  SeqExample.seq[this] := tmp3;                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 9.9: int tmp6;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: Seq<int> tmp7;                                                                             
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 9.23: tmp7 := this.seq;                                                                        
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp7 := SeqExample.seq[this];                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 9.9: tmp6 = SeqNth<int>(tmp7,0);                                                                
                                                                                                    
 tmp6 := SeqNth.int(tmp7,0);                                                                        
                                                                                                    
 // 9.9: assert tmp6 == 4;                                                                          
                                                                                                    
 assume SeqExample._state3955137 == SeqExample._state && SeqExample.seq3955137 == SeqExample.seq && SeqExample._lock3955137 == SeqExample._lock && tmp73955137 == tmp7 && tmp63955137 == tmp6 && tmp53955137 == tmp5 && tmp43955137 == tmp4 && tmp33955137 == tmp3 && tmp23955137 == tmp2 && tmp13955137 == tmp1 && this3955137 == this && tid3955137 == tid;
 assume $recorded.state3955137 == 1;                                                                
 assert (tmp6==4);                                                                                         // (9.9): This assertion may not hold.
                                                                                                    
 // 10.9: int tmp8;                                                                                 
                                                                                                    
                                                                                                    
 // 10.9: Seq<int> tmp9;                                                                            
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 10.23: tmp9 := this.seq;                                                                       
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp9 := SeqExample.seq[this];                                                                     
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 10.9: tmp8 = SeqLen<int>(tmp9);                                                                 
                                                                                                    
 tmp8 := SeqLen.int(tmp9);                                                                          
                                                                                                    
 // 10.9: assert tmp8 == 2;                                                                         
                                                                                                    
 assume SeqExample._state3955159 == SeqExample._state && SeqExample.seq3955159 == SeqExample.seq && SeqExample._lock3955159 == SeqExample._lock && tmp93955159 == tmp9 && tmp83955159 == tmp8 && tmp73955159 == tmp7 && tmp63955159 == tmp6 && tmp53955159 == tmp5 && tmp43955159 == tmp4 && tmp33955159 == tmp3 && tmp23955159 == tmp2 && tmp13955159 == tmp1 && this3955159 == this && tid3955159 == tid;
 assume $recorded.state3955159 == 1;                                                                
 assert (tmp8==2);                                                                                         // (10.9): This assertion may not hold.
                                                                                                    
 // 5.29: // return;                                                                                
                                                                                                    
 assume SeqExample._state3955160 == SeqExample._state && SeqExample.seq3955160 == SeqExample.seq && SeqExample._lock3955160 == SeqExample._lock && tmp93955160 == tmp9 && tmp83955160 == tmp8 && tmp73955160 == tmp7 && tmp63955160 == tmp6 && tmp53955160 == tmp5 && tmp43955160 == tmp4 && tmp33955160 == tmp3 && tmp23955160 == tmp2 && tmp13955160 == tmp1 && this3955160 == this && tid3955160 == tid;
 assume $recorded.state3955160 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SeqExample.operators(tid:Tid, this : SeqExample)                                         
modifies SeqExample._state;                                                                         
modifies SeqExample.seq;                                                                            
modifies SeqExample._lock;                                                                          
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.5): Bad tid
requires isShared(SeqExample._state[this]);                                                                // (13.5): this is not global
                                                                                                    
requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                       
                                                                                                    
ensures StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                        
{                                                                                                   
 var SeqExample._state3955254: [SeqExample]State;                                                   
 var tmp163955253: int;                                                                             
 var tmp12: Seq.int;                                                                                
 var tmp113955231: Seq.int;                                                                         
 var tmp143955254: int;                                                                             
 var tmp113955253: Seq.int;                                                                         
 var tid3955253: Tid;                                                                               
 var $recorded.state3955231: int;                                                                   
 var $pc3955254: Phase;                                                                             
 var SeqExample.seq3955254: [SeqExample]Seq.int;                                                    
 var tmp153955231: Seq.int;                                                                         
 var SeqExample._lock3955253: [SeqExample]Tid;                                                      
 var SeqExample._state3955231: [SeqExample]State;                                                   
 var tmp173955253: Seq.int;                                                                         
 var $pc3955231: Phase;                                                                             
 var SeqExample.seq3955253: [SeqExample]Seq.int;                                                    
 var tmp153955253: Seq.int;                                                                         
 var tmp11: Seq.int;                                                                                
 var this3955231: SeqExample;                                                                       
 var tmp14: int;                                                                                    
 var tmp123955253: Seq.int;                                                                         
 var tmp113955254: Seq.int;                                                                         
 var SeqExample.seq3955231: [SeqExample]Seq.int;                                                    
 var SeqExample._lock3955231: [SeqExample]Tid;                                                      
 var tmp133955253: Seq.int;                                                                         
 var tmp17: Seq.int;                                                                                
 var tmp143955231: int;                                                                             
 var this3955253: SeqExample;                                                                       
 var tmp123955231: Seq.int;                                                                         
 var this3955254: SeqExample;                                                                       
 var SeqExample._state3955253: [SeqExample]State;                                                   
 var $pc3955253: Phase;                                                                             
 var tmp103955254: Seq.int;                                                                         
 var $recorded.state3955254: int;                                                                   
 var tmp163955254: int;                                                                             
 var $recorded.state3955253: int;                                                                   
 var SeqExample._lock3955254: [SeqExample]Tid;                                                      
 var tmp133955254: Seq.int;                                                                         
 var tid3955254: Tid;                                                                               
 var tmp103955253: Seq.int;                                                                         
 var tid3955231: Tid;                                                                               
 var tmp13: Seq.int;                                                                                
 var tmp143955253: int;                                                                             
 var tmp103955231: Seq.int;                                                                         
 var tmp173955254: Seq.int;                                                                         
 var tmp133955231: Seq.int;                                                                         
 var tmp123955254: Seq.int;                                                                         
 var tmp10: Seq.int;                                                                                
 var tmp16: int;                                                                                    
 var tmp153955254: Seq.int;                                                                         
 var tmp15: Seq.int;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 14.9: Seq<int> tmp10;                                                                           
                                                                                                    
                                                                                                    
 // 14.9: tmp10 = SeqUnit<int>(4);                                                                  
                                                                                                    
 tmp10 := SeqUnit.int(4);                                                                           
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
  // 14.9: this.seq := tmp10;                                                                       
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
  SeqExample.seq[this] := tmp10;                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 15.9: Seq<int> tmp11;                                                                           
                                                                                                    
                                                                                                    
 // 15.9: Seq<int> tmp12;                                                                           
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 15.20: tmp12 := this.seq;                                                                      
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp12 := SeqExample.seq[this];                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 15.9: Seq<int> tmp13;                                                                           
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 15.32: tmp13 := this.seq;                                                                      
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp13 := SeqExample.seq[this];                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 15.9: tmp11 = SeqConcat<int>(tmp12,tmp13);                                                      
                                                                                                    
 tmp11 := SeqConcat.int(tmp12,tmp13);                                                               
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
                                                                                                    
  // 15.9: this.seq := tmp11;                                                                       
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
  SeqExample.seq[this] := tmp11;                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 16.9: int tmp14;                                                                                
                                                                                                    
                                                                                                    
 // 16.9: Seq<int> tmp15;                                                                           
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 16.16: tmp15 := this.seq;                                                                      
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp15 := SeqExample.seq[this];                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 16.9: tmp14 = SeqNth<int>(tmp15,0);                                                             
                                                                                                    
 tmp14 := SeqNth.int(tmp15,0);                                                                      
                                                                                                    
 // 16.9: assert tmp14 == 4;                                                                        
                                                                                                    
 assume SeqExample._state3955231 == SeqExample._state && SeqExample.seq3955231 == SeqExample.seq && SeqExample._lock3955231 == SeqExample._lock && tmp153955231 == tmp15 && tmp143955231 == tmp14 && tmp133955231 == tmp13 && tmp123955231 == tmp12 && tmp113955231 == tmp11 && tmp103955231 == tmp10 && this3955231 == this && tid3955231 == tid;
 assume $recorded.state3955231 == 1;                                                                
 assert (tmp14==4);                                                                                        // (16.9): This assertion may not hold.
                                                                                                    
 // 17.9: int tmp16;                                                                                
                                                                                                    
                                                                                                    
 // 17.9: Seq<int> tmp17;                                                                           
                                                                                                    
 // nocheck {                                                                                       
                                                                                                    
                                                                                                    
  // 17.16: tmp17 := this.seq;                                                                      
                                                                                                    
                                                                                                    
  assume this != SeqExample.null;                                                                   
                                                                                                    
  tmp17 := SeqExample.seq[this];                                                                    
                                                                                                    
 // }                                                                                               
                                                                                                    
 // 17.9: tmp16 = SeqLen<int>(tmp17);                                                               
                                                                                                    
 tmp16 := SeqLen.int(tmp17);                                                                        
                                                                                                    
 // 17.9: assert tmp16 == 2;                                                                        
                                                                                                    
 assume SeqExample._state3955253 == SeqExample._state && SeqExample.seq3955253 == SeqExample.seq && SeqExample._lock3955253 == SeqExample._lock && tmp173955253 == tmp17 && tmp163955253 == tmp16 && tmp153955253 == tmp15 && tmp143955253 == tmp14 && tmp133955253 == tmp13 && tmp123955253 == tmp12 && tmp113955253 == tmp11 && tmp103955253 == tmp10 && this3955253 == this && tid3955253 == tid;
 assume $recorded.state3955253 == 1;                                                                
 assert (tmp16==2);                                                                                        // (17.9): This assertion may not hold.
                                                                                                    
 // 13.29: // return;                                                                               
                                                                                                    
 assume SeqExample._state3955254 == SeqExample._state && SeqExample.seq3955254 == SeqExample.seq && SeqExample._lock3955254 == SeqExample._lock && tmp173955254 == tmp17 && tmp163955254 == tmp16 && tmp153955254 == tmp15 && tmp143955254 == tmp14 && tmp133955254 == tmp13 && tmp123955254 == tmp12 && tmp113955254 == tmp11 && tmp103955254 == tmp10 && this3955254 == this && tid3955254 == tid;
 assume $recorded.state3955254 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(SeqExample._state: [SeqExample]State,SeqExample.seq: [SeqExample]Seq.int,SeqExample._lock: [SeqExample]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: SeqExample  :: _i == SeqExample.null <==> isNull(SeqExample._state[_i])) &&           
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                       
requires ValidTid(tid);                                                                             
modifies SeqExample._state;                                                                         
modifies SeqExample.seq;                                                                            
modifies SeqExample._lock;                                                                          
ensures StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                        
ensures Y(tid , old(SeqExample._state), old(SeqExample.seq), old(SeqExample._lock) , SeqExample._state, SeqExample.seq, SeqExample._lock);
                                                                                                    
// SeqExample.seq:                                                                                  
                                                                                                    
function {:inline} Y_SeqExample.seq(tid : Tid, this: SeqExample, newValue: Seq.int , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid): bool
{                                                                                                   
 ((isAccessible(SeqExample._state[this], tid) && leq(m#moverPath(ReadEval.SeqExample.seq(tid: Tid,this: SeqExample,SeqExample._state,SeqExample.seq,SeqExample._lock)), _R)) ==> (SeqExample.seq[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SeqExample.seq(tid : Tid, this: SeqExample, newValue: Seq.int , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// SeqExample._lock:                                                                                
                                                                                                    
function {:inline} Y_SeqExample._lock(tid : Tid, this: SeqExample, newValue: Tid , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid): bool
{                                                                                                   
 ((isAccessible(SeqExample._state[this], tid) && leq(m#moverPath(ReadEval.SeqExample._lock(tid: Tid,this: SeqExample,SeqExample._state,SeqExample.seq,SeqExample._lock)), _R)) ==> (SeqExample._lock[this] == newValue))
 &&(((SeqExample._lock[this]==tid)==(newValue==tid)))                                               
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SeqExample._lock(tid : Tid, this: SeqExample, newValue: Tid , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SeqExample._lock.Subsumes.W(tid : Tid, u : Tid, this: SeqExample, newValue: Tid , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid)
 requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                      
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var SeqExample.seq_yield: [SeqExample]Seq.int;                                                      
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var SeqExample._lock_yield: [SeqExample]Tid;                                                        
var this_yield: SeqExample;                                                                         
var SeqExample._state_yield: [SeqExample]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SeqExample._state[this], tid);                                                 
 assume isAccessible(SeqExample._state[this], u);                                                   
 assume !isError(m#moverPath(WriteEval.SeqExample._lock(u: Tid,this: SeqExample,newValue: Tid,SeqExample._state,SeqExample.seq,SeqExample._lock)));
 assume leq(m#moverPath(ReadEval.SeqExample._lock(tid: Tid,this: SeqExample,SeqExample._state,SeqExample.seq,SeqExample._lock)), _N);
assume SeqExample._state_yield == SeqExample._state && SeqExample.seq_yield == SeqExample.seq && SeqExample._lock_yield == SeqExample._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SeqExample._lock(tid, this, newValue , SeqExample._state, SeqExample.seq, SeqExample._lock);
}                                                                                                   
                                                                                                    
procedure Y_SeqExample._lock.Reflexive(tid : Tid, this: SeqExample , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid)
 requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var SeqExample.seq_yield: [SeqExample]Seq.int;                                                      
var $pc_yield: Phase;                                                                               
var SeqExample._lock_yield: [SeqExample]Tid;                                                        
var this_yield: SeqExample;                                                                         
var SeqExample._state_yield: [SeqExample]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SeqExample._state[this], tid);                                                 
assume SeqExample._state_yield == SeqExample._state && SeqExample.seq_yield == SeqExample.seq && SeqExample._lock_yield == SeqExample._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SeqExample._lock(tid, this, SeqExample._lock[this] , SeqExample._state, SeqExample.seq, SeqExample._lock);
}                                                                                                   
                                                                                                    
procedure Y_SeqExample._lock.Transitive(tid : Tid, this: SeqExample, newValue : Tid , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid , SeqExample._state_p: [SeqExample]State, SeqExample.seq_p: [SeqExample]Seq.int, SeqExample._lock_p: [SeqExample]Tid)
 requires StateInvariant(SeqExample._state, SeqExample.seq, SeqExample._lock);                      
 requires StateInvariant(SeqExample._state_p, SeqExample.seq_p, SeqExample._lock_p);                
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var this_pre: SeqExample;                                                                           
var SeqExample._lock_pre: [SeqExample]Tid;                                                          
var SeqExample.seq_pre: [SeqExample]Seq.int;                                                        
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var SeqExample._state_pre: [SeqExample]State;                                                       
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var this_post: SeqExample;                                                                          
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var SeqExample._state_post: [SeqExample]State;                                                      
var SeqExample._lock_post: [SeqExample]Tid;                                                         
var newValue_post: Tid;                                                                             
var SeqExample.seq_post: [SeqExample]Seq.int;                                                       
                                                                                                    
assume SeqExample._state_pre == SeqExample._state && SeqExample.seq_pre == SeqExample.seq && SeqExample._lock_pre == SeqExample._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SeqExample._state[this], tid);                                                 
 assume Y(tid , SeqExample._state, SeqExample.seq, SeqExample._lock , SeqExample._state_p, SeqExample.seq_p, SeqExample._lock_p);
 assume Y_SeqExample._lock(tid, this, newValue , SeqExample._state_p, SeqExample.seq_p, SeqExample._lock_p);
assume SeqExample._state_post == SeqExample._state_p && SeqExample.seq_post == SeqExample.seq_p && SeqExample._lock_post == SeqExample._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SeqExample._lock(tid, this, newValue , SeqExample._state, SeqExample.seq, SeqExample._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , SeqExample._state: [SeqExample]State, SeqExample.seq: [SeqExample]Seq.int, SeqExample._lock: [SeqExample]Tid , SeqExample._state_p: [SeqExample]State, SeqExample.seq_p: [SeqExample]Seq.int, SeqExample._lock_p: [SeqExample]Tid): bool
{                                                                                                   
 (forall this: SeqExample :: Y_SeqExample.seq(tid : Tid, this, SeqExample.seq_p[this] , SeqExample._state, SeqExample.seq, SeqExample._lock))
 && (forall this: SeqExample :: Y_SeqExample._lock(tid : Tid, this, SeqExample._lock_p[this] , SeqExample._state, SeqExample.seq, SeqExample._lock))
 && (forall _i : SeqExample :: isShared(SeqExample._state[_i]) ==> isShared(SeqExample._state_p[_i]))
 && (forall _i : SeqExample :: isLocal(SeqExample._state[_i], tid) <==> isLocal(SeqExample._state_p[_i], tid))
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
// 606.1-822.2: (Method:5.5)
// 613.1-613.24: (5.5): Bad tid
// 614.1-614.44: (5.5): this is not global
// 680.2-682.2: (class anchor.sink.VarDeclStmt:6.9)
// 683.2-686.25: (class anchor.sink.Assign:6.9)
// 690.3-695.32: (class anchor.sink.Write:6.9)
// 698.2-700.2: (class anchor.sink.VarDeclStmt:7.9)
// 701.2-704.25: (class anchor.sink.Assign:7.9)
// 708.3-713.32: (class anchor.sink.Write:7.9)
// 716.2-718.2: (class anchor.sink.VarDeclStmt:8.9)
// 719.2-721.2: (class anchor.sink.VarDeclStmt:8.9)
// 724.3-730.32: (class anchor.sink.Read:8.30)
// 733.2-735.2: (class anchor.sink.VarDeclStmt:8.9)
// 738.3-744.32: (class anchor.sink.Read:8.40)
// 747.2-750.35: (class anchor.sink.Assign:8.9)
// 754.3-759.32: (class anchor.sink.Write:8.9)
// 762.2-764.2: (class anchor.sink.VarDeclStmt:9.9)
// 765.2-767.2: (class anchor.sink.VarDeclStmt:9.9)
// 770.3-776.32: (class anchor.sink.Read:9.23)
// 779.2-782.29: (class anchor.sink.Assign:9.9)
// 783.2-788.19: (class anchor.sink.Assert:9.9)
// 788.1-788.19: (9.9): This assertion may not hold.
// 789.2-791.2: (class anchor.sink.VarDeclStmt:10.9)
// 792.2-794.2: (class anchor.sink.VarDeclStmt:10.9)
// 797.3-803.32: (class anchor.sink.Read:10.23)
// 806.2-809.27: (class anchor.sink.Assign:10.9)
// 810.2-815.19: (class anchor.sink.Assert:10.9)
// 815.1-815.19: (10.9): This assertion may not hold.
// 816.2-821.9: (class anchor.sink.Return:5.29)
// 823.1-1017.2: (Method:13.5)
// 830.1-830.24: (13.5): Bad tid
// 831.1-831.44: (13.5): this is not global
// 893.2-895.2: (class anchor.sink.VarDeclStmt:14.9)
// 896.2-899.26: (class anchor.sink.Assign:14.9)
// 903.3-908.33: (class anchor.sink.Write:14.9)
// 911.2-913.2: (class anchor.sink.VarDeclStmt:15.9)
// 914.2-916.2: (class anchor.sink.VarDeclStmt:15.9)
// 919.3-925.33: (class anchor.sink.Read:15.20)
// 928.2-930.2: (class anchor.sink.VarDeclStmt:15.9)
// 933.3-939.33: (class anchor.sink.Read:15.32)
// 942.2-945.38: (class anchor.sink.Assign:15.9)
// 949.3-954.33: (class anchor.sink.Write:15.9)
// 957.2-959.2: (class anchor.sink.VarDeclStmt:16.9)
// 960.2-962.2: (class anchor.sink.VarDeclStmt:16.9)
// 965.3-971.33: (class anchor.sink.Read:16.16)
// 974.2-977.31: (class anchor.sink.Assign:16.9)
// 978.2-983.20: (class anchor.sink.Assert:16.9)
// 983.1-983.20: (16.9): This assertion may not hold.
// 984.2-986.2: (class anchor.sink.VarDeclStmt:17.9)
// 987.2-989.2: (class anchor.sink.VarDeclStmt:17.9)
// 992.3-998.33: (class anchor.sink.Read:17.16)
// 1001.2-1004.29: (class anchor.sink.Assign:17.9)
// 1005.2-1010.20: (class anchor.sink.Assert:17.9)
// 1010.1-1010.20: (17.9): This assertion may not hold.
// 1011.2-1016.9: (class anchor.sink.Return:13.29)
// 1078.1-1097.2: (7.32): yields_as clause for SeqExample._lock is not valid
// 1102.1-1116.2: (7.32): yields_as clause for SeqExample._lock is not reflexive
// 1122.1-1150.2: (7.32): yields_as clause for SeqExample._lock is not transitive
