(declare-datatypes () ((Nat (succ (pred Nat)) (zero))))
(declare-datatypes () ((Lst (cons (head Nat) (tail Lst)) (nil))))
(declare-datatypes () ((Tree (node (data Nat) (left Tree) (right Tree)) (leaf))))
(declare-datatypes () ((Pair (mkpair (first Nat) (second Nat)))
                       (ZLst (zcons (zhead Pair) (ztail ZLst)) (znil))))
(declare-fun less (Nat Nat) Bool)
(declare-fun plus (Nat Nat) Nat)
(declare-fun mult (Nat Nat) Nat)
(declare-fun qmult (Nat Nat Nat) Nat)
(declare-fun exp (Nat Nat) Nat)
(declare-fun qexp (Nat Nat Nat) Nat)
(declare-fun fac (Nat) Nat)
(declare-fun qfac (Nat Nat) Nat)
(declare-fun double (Nat) Nat)
(declare-fun half (Nat) Nat)
(declare-fun even (Nat) Bool)
(declare-fun append (Lst Lst) Lst)
(declare-fun len (Lst) Nat)
(declare-fun drop (Nat Lst) Lst)
(declare-fun take (Nat Lst) Lst)
(declare-fun count (Nat Lst) Nat)
(declare-fun mem (Nat Lst) Bool)
(declare-fun rev (Lst) Lst)
(declare-fun qreva (Lst Lst) Lst)
(declare-fun insort (Nat Lst) Lst)
(declare-fun sorted (Lst) Bool)
(declare-fun sort (Lst) Lst)
(declare-fun rotate (Nat Lst) Lst)
(declare-fun revflat (Tree) Lst)
(declare-fun qrevaflat (Tree Lst) Lst)
(declare-fun lst-mem (Nat Lst) Bool)
(declare-fun lst-subset (Lst Lst) Bool)
(declare-fun lst-eq (Lst Lst) Bool)
(declare-fun lst-intersection (Lst Lst) Lst)
(declare-fun lst-union (Lst Lst) Lst)
(define-fun leq ((x Nat) (y Nat)) Bool (or (= x y) (less x y)))


(assert (forall ((n Nat)) (= (plus zero n) n)))
(assert (forall ((n Nat) (m Nat)) (= (plus (succ n) m) (succ (plus n m)))))


(assert (forall ((n Nat)) (= (mult zero n) zero)))
(assert (forall ((n Nat) (m Nat)) (= (mult (succ n) m) (plus (mult n m) m))))


(assert (forall ((n Nat)) (= (exp n zero) (succ zero))))
(assert (forall ((n Nat) (m Nat)) (= (exp n (succ m)) (mult (exp n m) n))))


(assert (forall ((n Nat) (m Nat)) (= (qexp n zero m) m)))
(assert (forall ((n Nat) (m Nat) (p Nat)) (= (qexp n (succ m) p) (qexp n m (mult p n)))))


; lemma
;(assert (forall ((x Nat) (y Nat) (z Nat)) (= (mult (mult x y) z) (mult x (mult y z)))))


;lemma 2
;(assert (forall ((n Nat)) (= (mult n zero) zero)))


;lemma 3
;(assert (forall ((x Nat) (y Nat)) (= (plus (mult x y) y) (mult y (succ x)))))


;test failurepoint 1
;(assert (forall ((y Nat) (z Nat)) (= (mult (exp zero y) z) (qexp zero y z))))


(assert (not 
(forall ((x Nat) (y Nat) (z Nat)) (= (mult (exp x y) z) (qexp x y z))) ; G86 
))
(check-sat)
