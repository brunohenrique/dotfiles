---- MODULE module ----
EXTENDS FiniteSet 

CONSTANTS MyConst 
ASSUME IsFiniteSet(MyConst)

VARIABLES a, b
vars == <<a, b>>

TypeInvariant ==
 /\ a \in BOOLEAN
 /\ b \in BOOLEAN

Init == 
 /\ a = FALSE 
 /\ b = TRUE

Next == (a' = TRUE) /\ (b' = FALSE)

Spec = Init /\ [][Next]_vars
----
THEOREM Spec => []TypeInvariant
====
