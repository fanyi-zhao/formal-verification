                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/collections-map.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        int tmp1;                                                                                   
        tmp1 = MapSelect<int,int>(s,4);                                                             
        assert tmp1 == 2;                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 = MapSelect<int,int>(s,4);                                                             
        tmp2 = tmp3 != 2;                                                                           
        assert tmp2 /* == MapSelect<int,int>(s,4) != 2 */;                                          
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h() {                                                                             
        Map<int,Cow> s;                                                                             
        s = MapEmpty<int,Cow>();                                                                    
        s = MapStore<int,Cow>(s,4,this);                                                            
        boolean tmp4;                                                                               
        Cow tmp5;                                                                                   
        tmp5 = MapSelect<int,Cow>(s,4);                                                             
        tmp4 = tmp5 != this;                                                                        
        assert tmp4 /* == MapSelect<int,Cow>(s,4) != this */;                                       
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h2() {                                                                            
        Map<int,Map<Cow,Cow>> s;                                                                    
        s = MapEmpty<int,Map<Cow,Cow>>();                                                           
        Map<Cow,Cow> tmp6;                                                                          
        tmp6 = MapEmpty<Cow,Cow>();                                                                 
        s = MapStore<int,Map<Cow,Cow>>(s,2,tmp6);                                                   
        Map<Cow,Cow> tmp7;                                                                          
        tmp7 = MapSelect<int,Map<Cow,Cow>>(s,2);                                                    
        Map<Cow,Cow> tmp8;                                                                          
        tmp8 = MapEmpty<Cow,Cow>();                                                                 
        assert tmp7 == tmp8;                                                                        
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
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        int tmp1;                                                                                   
        tmp1 = MapSelect<int,int>(s,4);                                                             
        assert tmp1 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 = MapSelect<int,int>(s,4);                                                             
        tmp2 = tmp3 != 2;                                                                           
        assert tmp2 /* == MapSelect<int,int>(s,4) != 2 */;                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h() {                                                                             
        Map<int,Cow> s;                                                                             
        s = MapEmpty<int,Cow>();                                                                    
        s = MapStore<int,Cow>(s,4,this);                                                            
        boolean tmp4;                                                                               
        Cow tmp5;                                                                                   
        tmp5 = MapSelect<int,Cow>(s,4);                                                             
        tmp4 = tmp5 != this;                                                                        
        assert tmp4 /* == MapSelect<int,Cow>(s,4) != this */;                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h2() {                                                                            
        Map<int,Map<Cow,Cow>> s;                                                                    
        s = MapEmpty<int,Map<Cow,Cow>>();                                                           
        Map<Cow,Cow> tmp6;                                                                          
        tmp6 = MapEmpty<Cow,Cow>();                                                                 
        s = MapStore<int,Map<Cow,Cow>>(s,2,tmp6);                                                   
        Map<Cow,Cow> tmp7;                                                                          
        tmp7 = MapSelect<int,Map<Cow,Cow>>(s,2);                                                    
        Map<Cow,Cow> tmp8;                                                                          
        tmp8 = MapEmpty<Cow,Cow>();                                                                 
        assert tmp7 == tmp8;                                                                        
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
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        int tmp1;                                                                                   
        tmp1 = MapSelect<int,int>(s,4);                                                             
        assert tmp1 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 = MapSelect<int,int>(s,4);                                                             
        tmp2 = tmp3 != 2;                                                                           
        assert tmp2 /* == MapSelect<int,int>(s,4) != 2 */;                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h() {                                                                             
        Map<int,Cow> s;                                                                             
        s = MapEmpty<int,Cow>();                                                                    
        s = MapStore<int,Cow>(s,4,this);                                                            
        boolean tmp4;                                                                               
        Cow tmp5;                                                                                   
        tmp5 = MapSelect<int,Cow>(s,4);                                                             
        tmp4 = tmp5 != this;                                                                        
        assert tmp4 /* == MapSelect<int,Cow>(s,4) != this */;                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h2() {                                                                            
        Map<int,Map<Cow,Cow>> s;                                                                    
        s = MapEmpty<int,Map<Cow,Cow>>();                                                           
        Map<Cow,Cow> tmp6;                                                                          
        tmp6 = MapEmpty<Cow,Cow>();                                                                 
        s = MapStore<int,Map<Cow,Cow>>(s,2,tmp6);                                                   
        Map<Cow,Cow> tmp7;                                                                          
        tmp7 = MapSelect<int,Map<Cow,Cow>>(s,2);                                                    
        Map<Cow,Cow> tmp8;                                                                          
        tmp8 = MapEmpty<Cow,Cow>();                                                                 
        assert tmp7 == tmp8;                                                                        
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
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        int tmp1;                                                                                   
        tmp1 = MapSelect<int,int>(s,4);                                                             
        assert tmp1 == 2;                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void g() {                                                                             
        Map<int,int> s;                                                                             
        s = MapEmpty<int,int>();                                                                    
        s = MapStore<int,int>(s,4,2);                                                               
        boolean tmp2;                                                                               
        int tmp3;                                                                                   
        tmp3 = MapSelect<int,int>(s,4);                                                             
        tmp2 = tmp3 != 2;                                                                           
        assert tmp2 /* == MapSelect<int,int>(s,4) != 2 */;                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h() {                                                                             
        Map<int,Cow> s;                                                                             
        s = MapEmpty<int,Cow>();                                                                    
        s = MapStore<int,Cow>(s,4,this);                                                            
        boolean tmp4;                                                                               
        Cow tmp5;                                                                                   
        tmp5 = MapSelect<int,Cow>(s,4);                                                             
        tmp4 = tmp5 != this;                                                                        
        assert tmp4 /* == MapSelect<int,Cow>(s,4) != this */;                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void h2() {                                                                            
        Map<int,Map<Cow,Cow>> s;                                                                    
        s = MapEmpty<int,Map<Cow,Cow>>();                                                           
        Map<Cow,Cow> tmp6;                                                                          
        tmp6 = MapEmpty<Cow,Cow>();                                                                 
        s = MapStore<int,Map<Cow,Cow>>(s,2,tmp6);                                                   
        Map<Cow,Cow> tmp7;                                                                          
        tmp7 = MapSelect<int,Map<Cow,Cow>>(s,2);                                                    
        Map<Cow,Cow> tmp8;                                                                          
        tmp8 = MapEmpty<Cow,Cow>();                                                                 
        assert tmp7 == tmp8;                                                                        
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
                                                                                                    
requires ValidTid(tid);                                                                                    // (4.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (4.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var tmp1780500: int;                                                                               
 var $pc780500: Phase;                                                                              
 var Cow._state780500: [Cow]State;                                                                  
 var this780499: Cow;                                                                               
 var s780500: Map.int.int;                                                                          
 var s780499: Map.int.int;                                                                          
 var Cow._lock780500: [Cow]Tid;                                                                     
 var $recorded.state780500: int;                                                                    
 var tmp1780499: int;                                                                               
 var this780500: Cow;                                                                               
 var Cow._lock780499: [Cow]Tid;                                                                     
 var Cow._state780499: [Cow]State;                                                                  
 var $pc780499: Phase;                                                                              
 var tid780500: Tid;                                                                                
 var tmp1: int;                                                                                     
 var s: Map.int.int;                                                                                
 var tid780499: Tid;                                                                                
 var $recorded.state780499: int;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 5.9: Map<int,int> s;                                                                            
                                                                                                    
                                                                                                    
 // 6.9: s = MapEmpty<int,int>();                                                                   
                                                                                                    
 s := MapEmpty.int.int();                                                                           
                                                                                                    
 // 7.9: s = MapStore<int,int>(s,4,2);                                                              
                                                                                                    
 s := MapStore.int.int(s,4,2);                                                                      
                                                                                                    
 // 8.9: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 8.9: tmp1 = MapSelect<int,int>(s,4);                                                            
                                                                                                    
 tmp1 := MapSelect.int.int(s,4);                                                                    
                                                                                                    
 // 8.9: assert tmp1 == 2;                                                                          
                                                                                                    
 assume Cow._state780499 == Cow._state && Cow._lock780499 == Cow._lock && tmp1780499 == tmp1 && s780499 == s && this780499 == this && tid780499 == tid;
 assume $recorded.state780499 == 1;                                                                 
 assert (tmp1==2);                                                                                         // (8.9): This assertion may not hold.
                                                                                                    
 // 4.21: // return;                                                                                
                                                                                                    
 assume Cow._state780500 == Cow._state && Cow._lock780500 == Cow._lock && tmp1780500 == tmp1 && s780500 == s && this780500 == this && tid780500 == tid;
 assume $recorded.state780500 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.g(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (11.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (11.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var tmp2780558: bool;                                                                              
 var $pc780557: Phase;                                                                              
 var $recorded.state780557: int;                                                                    
 var tmp3780557: int;                                                                               
 var tmp2: bool;                                                                                    
 var tid780557: Tid;                                                                                
 var this780557: Cow;                                                                               
 var Cow._state780558: [Cow]State;                                                                  
 var $recorded.state780558: int;                                                                    
 var Cow._state780557: [Cow]State;                                                                  
 var Cow._lock780558: [Cow]Tid;                                                                     
 var $pc780558: Phase;                                                                              
 var tmp2780557: bool;                                                                              
 var tid780558: Tid;                                                                                
 var s: Map.int.int;                                                                                
 var tmp3: int;                                                                                     
 var s780557: Map.int.int;                                                                          
 var this780558: Cow;                                                                               
 var tmp3780558: int;                                                                               
 var Cow._lock780557: [Cow]Tid;                                                                     
 var s780558: Map.int.int;                                                                          
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 12.9: Map<int,int> s;                                                                           
                                                                                                    
                                                                                                    
 // 13.9: s = MapEmpty<int,int>();                                                                  
                                                                                                    
 s := MapEmpty.int.int();                                                                           
                                                                                                    
 // 14.9: s = MapStore<int,int>(s,4,2);                                                             
                                                                                                    
 s := MapStore.int.int(s,4,2);                                                                      
                                                                                                    
 // 15.9: boolean tmp2;                                                                             
                                                                                                    
                                                                                                    
 // 15.9: int tmp3;                                                                                 
                                                                                                    
                                                                                                    
 // 15.9: tmp3 = MapSelect<int,int>(s,4);                                                           
                                                                                                    
 tmp3 := MapSelect.int.int(s,4);                                                                    
                                                                                                    
 // 15.9: tmp2 = tmp3 != 2;                                                                         
                                                                                                    
 tmp2 := (tmp3!=2);                                                                                 
                                                                                                    
 // 15.9: assert tmp2 /* == MapSelect<int,int>(s,4) != 2 */;                                        
                                                                                                    
 assume Cow._state780557 == Cow._state && Cow._lock780557 == Cow._lock && tmp3780557 == tmp3 && tmp2780557 == tmp2 && s780557 == s && this780557 == this && tid780557 == tid;
 assume $recorded.state780557 == 1;                                                                 
 assert tmp2 /* lowered (MapSelect.int.int(s,4)!=2) */;                                                    // (15.9): This assertion may not hold.
                                                                                                    
 // 11.21: // return;                                                                               
                                                                                                    
 assume Cow._state780558 == Cow._state && Cow._lock780558 == Cow._lock && tmp3780558 == tmp3 && tmp2780558 == tmp2 && s780558 == s && this780558 == this && tid780558 == tid;
 assume $recorded.state780558 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.h(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (18.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (18.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var Cow._lock780613: [Cow]Tid;                                                                     
 var this780612: Cow;                                                                               
 var $recorded.state780613: int;                                                                    
 var tmp5: Cow;                                                                                     
 var tmp5780613: Cow;                                                                               
 var $pc780613: Phase;                                                                              
 var Cow._state780613: [Cow]State;                                                                  
 var $pc780612: Phase;                                                                              
 var tmp4780612: bool;                                                                              
 var this780613: Cow;                                                                               
 var tmp4780613: bool;                                                                              
 var tmp5780612: Cow;                                                                               
 var tid780613: Tid;                                                                                
 var s: Map.int.Cow;                                                                                
 var tid780612: Tid;                                                                                
 var $recorded.state780612: int;                                                                    
 var s780613: Map.int.Cow;                                                                          
 var tmp4: bool;                                                                                    
 var Cow._state780612: [Cow]State;                                                                  
 var s780612: Map.int.Cow;                                                                          
 var Cow._lock780612: [Cow]Tid;                                                                     
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 19.9: Map<int,Cow> s;                                                                           
                                                                                                    
                                                                                                    
 // 20.9: s = MapEmpty<int,Cow>();                                                                  
                                                                                                    
 s := MapEmpty.int.Cow();                                                                           
                                                                                                    
 // 21.9: s = MapStore<int,Cow>(s,4,this);                                                          
                                                                                                    
 s := MapStore.int.Cow(s,4,this);                                                                   
                                                                                                    
 // 22.9: boolean tmp4;                                                                             
                                                                                                    
                                                                                                    
 // 22.9: Cow tmp5;                                                                                 
                                                                                                    
                                                                                                    
 // 22.9: tmp5 = MapSelect<int,Cow>(s,4);                                                           
                                                                                                    
 tmp5 := MapSelect.int.Cow(s,4);                                                                    
                                                                                                    
 // 22.9: tmp4 = tmp5 != this;                                                                      
                                                                                                    
 tmp4 := (tmp5!=this);                                                                              
                                                                                                    
 // 22.9: assert tmp4 /* == MapSelect<int,Cow>(s,4) != this */;                                     
                                                                                                    
 assume Cow._state780612 == Cow._state && Cow._lock780612 == Cow._lock && tmp5780612 == tmp5 && tmp4780612 == tmp4 && s780612 == s && this780612 == this && tid780612 == tid;
 assume $recorded.state780612 == 1;                                                                 
 assert tmp4 /* lowered (MapSelect.int.Cow(s,4)!=this) */;                                                 // (22.9): This assertion may not hold.
                                                                                                    
 // 18.21: // return;                                                                               
                                                                                                    
 assume Cow._state780613 == Cow._state && Cow._lock780613 == Cow._lock && tmp5780613 == tmp5 && tmp4780613 == tmp4 && s780613 == s && this780613 == this && tid780613 == tid;
 assume $recorded.state780613 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.h2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (25.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (25.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow._lock);                                                     
                                                                                                    
ensures StateInvariant(Cow._state, Cow._lock);                                                      
{                                                                                                   
 var Cow._lock780682: [Cow]Tid;                                                                     
 var tmp8: Map.Cow.Cow;                                                                             
 var tmp7780682: Map.Cow.Cow;                                                                       
 var $pc780681: Phase;                                                                              
 var tmp8780682: Map.Cow.Cow;                                                                       
 var this780681: Cow;                                                                               
 var s780681: Map.int.Map.Cow.Cow;                                                                  
 var this780682: Cow;                                                                               
 var $recorded.state780681: int;                                                                    
 var tmp7780681: Map.Cow.Cow;                                                                       
 var $pc780682: Phase;                                                                              
 var tid780682: Tid;                                                                                
 var Cow._state780682: [Cow]State;                                                                  
 var tmp7: Map.Cow.Cow;                                                                             
 var tid780681: Tid;                                                                                
 var tmp6: Map.Cow.Cow;                                                                             
 var $recorded.state780682: int;                                                                    
 var tmp8780681: Map.Cow.Cow;                                                                       
 var Cow._lock780681: [Cow]Tid;                                                                     
 var Cow._state780681: [Cow]State;                                                                  
 var s: Map.int.Map.Cow.Cow;                                                                        
 var s780682: Map.int.Map.Cow.Cow;                                                                  
 var tmp6780681: Map.Cow.Cow;                                                                       
 var tmp6780682: Map.Cow.Cow;                                                                       
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 26.9: Map<int,Map<Cow,Cow>> s;                                                                  
                                                                                                    
                                                                                                    
 // 27.9: s = MapEmpty<int,Map<Cow,Cow>>();                                                         
                                                                                                    
 s := MapEmpty.int.Map.Cow.Cow();                                                                   
                                                                                                    
 // 28.9: Map<Cow,Cow> tmp6;                                                                        
                                                                                                    
                                                                                                    
 // 28.9: tmp6 = MapEmpty<Cow,Cow>();                                                               
                                                                                                    
 tmp6 := MapEmpty.Cow.Cow();                                                                        
                                                                                                    
 // 28.9: s = MapStore<int,Map<Cow,Cow>>(s,2,tmp6);                                                 
                                                                                                    
 s := MapStore.int.Map.Cow.Cow(s,2,tmp6);                                                           
                                                                                                    
 // 29.9: Map<Cow,Cow> tmp7;                                                                        
                                                                                                    
                                                                                                    
 // 29.9: tmp7 = MapSelect<int,Map<Cow,Cow>>(s,2);                                                  
                                                                                                    
 tmp7 := MapSelect.int.Map.Cow.Cow(s,2);                                                            
                                                                                                    
 // 29.9: Map<Cow,Cow> tmp8;                                                                        
                                                                                                    
                                                                                                    
 // 29.9: tmp8 = MapEmpty<Cow,Cow>();                                                               
                                                                                                    
 tmp8 := MapEmpty.Cow.Cow();                                                                        
                                                                                                    
 // 29.9: assert tmp7 == tmp8;                                                                      
                                                                                                    
 assume Cow._state780681 == Cow._state && Cow._lock780681 == Cow._lock && tmp8780681 == tmp8 && tmp7780681 == tmp7 && tmp6780681 == tmp6 && s780681 == s && this780681 == this && tid780681 == tid;
 assume $recorded.state780681 == 1;                                                                 
 assert (tmp7==tmp8);                                                                                      // (29.9): This assertion may not hold.
                                                                                                    
 // 25.22: // return;                                                                               
                                                                                                    
 assume Cow._state780682 == Cow._state && Cow._lock780682 == Cow._lock && tmp8780682 == tmp8 && tmp7780682 == tmp7 && tmp6780682 == tmp6 && s780682 == s && this780682 == this && tid780682 == tid;
 assume $recorded.state780682 == 1;                                                                 
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
                                                                                                    
                                                                                                    
/// Map.int.int:                                                                                    
                                                                                                    
type Map.int.int = [int]int;                                                                        
                                                                                                    
                                                                                                    
function {:builtin "MapConst"} mapconst.int.int(int): Map.int.int;                                  
                                                                                                    
function {:inline} MapEmpty.int.int() : Map.int.int {                                               
mapconst.int.int(0)                                                                                 
}                                                                                                   
                                                                                                    
function {:inline} MapStore.int.int(m : Map.int.int, k : int, v : int) : Map.int.int {              
m[k := v]                                                                                           
}                                                                                                   
                                                                                                    
function {:inline} MapSelect.int.int(m : Map.int.int, k : int) : int {                              
m[k]                                                                                                
}                                                                                                   
                                                                                                    
                                                                                                    
/// Map.int.Cow:                                                                                    
                                                                                                    
type Map.int.Cow = [int]Cow;                                                                        
                                                                                                    
                                                                                                    
function {:builtin "MapConst"} mapconst.int.Cow(Cow): Map.int.Cow;                                  
                                                                                                    
function {:inline} MapEmpty.int.Cow() : Map.int.Cow {                                               
mapconst.int.Cow(Cow.null)                                                                          
}                                                                                                   
                                                                                                    
function {:inline} MapStore.int.Cow(m : Map.int.Cow, k : int, v : Cow) : Map.int.Cow {              
m[k := v]                                                                                           
}                                                                                                   
                                                                                                    
function {:inline} MapSelect.int.Cow(m : Map.int.Cow, k : int) : Cow {                              
m[k]                                                                                                
}                                                                                                   
                                                                                                    
                                                                                                    
/// Map.int.Map.Cow.Cow:                                                                            
                                                                                                    
type Map.int.Map.Cow.Cow = [int]Map.Cow.Cow;                                                        
                                                                                                    
                                                                                                    
function {:builtin "MapConst"} mapconst.int.Map.Cow.Cow(Map.Cow.Cow): Map.int.Map.Cow.Cow;          
                                                                                                    
function {:inline} MapEmpty.int.Map.Cow.Cow() : Map.int.Map.Cow.Cow {                               
mapconst.int.Map.Cow.Cow(MapEmpty.Cow.Cow() : Map.Cow.Cow)                                          
}                                                                                                   
                                                                                                    
function {:inline} MapStore.int.Map.Cow.Cow(m : Map.int.Map.Cow.Cow, k : int, v : Map.Cow.Cow) : Map.int.Map.Cow.Cow {
m[k := v]                                                                                           
}                                                                                                   
                                                                                                    
function {:inline} MapSelect.int.Map.Cow.Cow(m : Map.int.Map.Cow.Cow, k : int) : Map.Cow.Cow {      
m[k]                                                                                                
}                                                                                                   
                                                                                                    
                                                                                                    
/// Map.Cow.Cow:                                                                                    
                                                                                                    
type Map.Cow.Cow = [Cow]Cow;                                                                        
                                                                                                    
                                                                                                    
function {:builtin "MapConst"} mapconst.Cow.Cow(Cow): Map.Cow.Cow;                                  
                                                                                                    
function {:inline} MapEmpty.Cow.Cow() : Map.Cow.Cow {                                               
mapconst.Cow.Cow(Cow.null)                                                                          
}                                                                                                   
                                                                                                    
function {:inline} MapStore.Cow.Cow(m : Map.Cow.Cow, k : Cow, v : Cow) : Map.Cow.Cow {              
m[k := v]                                                                                           
}                                                                                                   
                                                                                                    
function {:inline} MapSelect.Cow.Cow(m : Map.Cow.Cow, k : Cow) : Cow {                              
m[k]                                                                                                
}                                                                                                   
                                                                                                    
                                                                                                    
// 590.1-656.2: (Method:4.5)
// 596.1-596.24: (4.5): Bad tid
// 597.1-597.37: (4.5): this is not global
// 626.2-628.2: (class anchor.sink.VarDeclStmt:5.9)
// 629.2-632.26: (class anchor.sink.Assign:6.9)
// 633.2-636.31: (class anchor.sink.Assign:7.9)
// 637.2-639.2: (class anchor.sink.VarDeclStmt:8.9)
// 640.2-643.33: (class anchor.sink.Assign:8.9)
// 644.2-649.19: (class anchor.sink.Assert:8.9)
// 649.1-649.19: (8.9): This assertion may not hold.
// 650.2-655.9: (class anchor.sink.Return:4.21)
// 657.1-733.2: (Method:11.5)
// 663.1-663.24: (11.5): Bad tid
// 664.1-664.37: (11.5): this is not global
// 696.2-698.2: (class anchor.sink.VarDeclStmt:12.9)
// 699.2-702.26: (class anchor.sink.Assign:13.9)
// 703.2-706.31: (class anchor.sink.Assign:14.9)
// 707.2-709.2: (class anchor.sink.VarDeclStmt:15.9)
// 710.2-712.2: (class anchor.sink.VarDeclStmt:15.9)
// 713.2-716.33: (class anchor.sink.Assign:15.9)
// 717.2-720.20: (class anchor.sink.Assign:15.9)
// 721.2-726.56: (class anchor.sink.Assert:15.9)
// 726.1-726.56: (15.9): This assertion may not hold.
// 727.2-732.9: (class anchor.sink.Return:11.21)
// 734.1-810.2: (Method:18.5)
// 740.1-740.24: (18.5): Bad tid
// 741.1-741.37: (18.5): this is not global
// 773.2-775.2: (class anchor.sink.VarDeclStmt:19.9)
// 776.2-779.26: (class anchor.sink.Assign:20.9)
// 780.2-783.34: (class anchor.sink.Assign:21.9)
// 784.2-786.2: (class anchor.sink.VarDeclStmt:22.9)
// 787.2-789.2: (class anchor.sink.VarDeclStmt:22.9)
// 790.2-793.33: (class anchor.sink.Assign:22.9)
// 794.2-797.23: (class anchor.sink.Assign:22.9)
// 798.2-803.59: (class anchor.sink.Assert:22.9)
// 803.1-803.59: (22.9): This assertion may not hold.
// 804.2-809.9: (class anchor.sink.Return:18.21)
// 811.1-897.2: (Method:25.5)
// 817.1-817.24: (25.5): Bad tid
// 818.1-818.37: (25.5): this is not global
// 853.2-855.2: (class anchor.sink.VarDeclStmt:26.9)
// 856.2-859.34: (class anchor.sink.Assign:27.9)
// 860.2-862.2: (class anchor.sink.VarDeclStmt:28.9)
// 863.2-866.29: (class anchor.sink.Assign:28.9)
// 867.2-870.42: (class anchor.sink.Assign:28.9)
// 871.2-873.2: (class anchor.sink.VarDeclStmt:29.9)
// 874.2-877.41: (class anchor.sink.Assign:29.9)
// 878.2-880.2: (class anchor.sink.VarDeclStmt:29.9)
// 881.2-884.29: (class anchor.sink.Assign:29.9)
// 885.2-890.22: (class anchor.sink.Assert:29.9)
// 890.1-890.22: (29.9): This assertion may not hold.
// 891.2-896.9: (class anchor.sink.Return:25.22)
// 944.1-962.2: (7.32): yields_as clause for Cow._lock is not valid
// 967.1-980.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 986.1-1012.2: (7.32): yields_as clause for Cow._lock is not transitive
