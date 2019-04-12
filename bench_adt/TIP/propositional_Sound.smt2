(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-datatypes ()
  ((list3 (nil3) (cons3 (head3 Bool) (tail3 list3)))))
(declare-datatypes () ((Pair (Pair2 (first Int) (second Bool)))))
(declare-datatypes ()
  ((list2 (nil2) (cons2 (head2 Pair) (tail2 list2)))))
(declare-datatypes ()
  ((list (nil) (cons (head list2) (tail list)))))
(declare-datatypes ()
  ((Form (& (&_0 Form) (&_1 Form))
     (Not (Not_0 Form)) (Var (Var_0 Int)))))
(declare-fun lam (Int) fun12)
(declare-fun lam2 (Int) fun12)
(declare-fun lam3 (Form) fun1)
(declare-fun apply1 (fun1 list2) Bool)
(declare-fun apply12 (fun12 Pair) Bool)
(declare-fun or2 (list3) Bool)
(declare-fun models3 (Int list2) list3)
(declare-fun fst (Pair) Int)
(declare-fun filter (fun12 list2) list2)
(declare-fun append (list list) list)
(declare-fun all (fun1 list) Bool)
(declare-fun =3 (Int list2) list3)
(declare-fun models (Form list2) list)
(declare-fun models2 (Form list) list)
(declare-fun models4 (Form list list) list)
(declare-fun =2 (list2 Form) Bool)
(assert (not (forall ((p Form)) (all (lam3 p) (models p nil2)))))
(assert
  (forall ((x list3))
    (= (or2 x)
      (ite (is-cons3 x) (or (head3 x) (or2 (tail3 x))) false))))
(assert
  (forall ((x Int) (y list2))
    (= (models3 x y)
      (ite
        (is-cons2 y)
        (ite
          (second (head2 y)) (models3 x (tail2 y))
          (cons3 (= x (first (head2 y))) (models3 x (tail2 y))))
        nil3))))
(assert (forall ((x Pair)) (= (fst x) (first x))))
(assert
  (forall ((p fun12) (x list2))
    (= (filter p x)
      (ite
        (is-cons2 x)
        (ite
          (apply12 p (head2 x)) (cons2 (head2 x) (filter p (tail2 x)))
          (filter p (tail2 x)))
        nil2))))
(assert
  (forall ((x list) (y list))
    (= (append x y)
      (ite (is-cons x) (cons (head x) (append (tail x) y)) y))))
(assert
  (forall ((x fun1) (y list))
    (= (all x y)
      (ite
        (is-cons y) (and (apply1 x (head y)) (all x (tail y))) true))))
(assert
  (forall ((x Int) (y list2))
    (= (=3 x y)
      (ite
        (is-cons2 y)
        (ite
          (second (head2 y)) (cons3 (= x (first (head2 y))) (=3 x (tail2 y)))
          (=3 x (tail2 y)))
        nil3))))
(assert
  (forall ((x Form) (y list2))
    (= (models x y)
      (ite
        (is-Var x)
        (ite
          (not (or2 (models3 (Var_0 x) y)))
          (cons (cons2 (Pair2 (Var_0 x) true) (filter (lam2 (Var_0 x)) y))
            nil)
          nil)
        (ite
          (is-Not x)
          (ite
            (is-Var (Not_0 x))
            (ite
              (not (or2 (=3 (Var_0 (Not_0 x)) y)))
              (cons
                (cons2 (Pair2 (Var_0 (Not_0 x)) false)
                  (filter (lam (Var_0 (Not_0 x))) y))
                nil)
              nil)
            (ite
              (is-Not (Not_0 x)) (models (Not_0 (Not_0 x)) y)
              (append (models (Not (&_0 (Not_0 x))) y)
                (models (& (&_0 (Not_0 x)) (Not (&_1 (Not_0 x)))) y))))
          (models2 (&_1 x) (models (&_0 x) y)))))))
(assert
  (forall ((q Form) (x list))
    (= (models2 q x)
      (ite (is-cons x) (models4 q (tail x) (models q (head x))) nil))))
(assert
  (forall ((q Form) (x list) (y list))
    (= (models4 q x y)
      (ite
        (is-cons y) (cons (head y) (models4 q x (tail y)))
        (models2 q x)))))
(assert
  (forall ((x list2) (y Form))
    (= (=2 x y)
      (ite
        (is-Var y) (or2 (=3 (Var_0 y) x))
        (ite
          (is-Not y) (not (=2 x (Not_0 y)))
          (and (=2 x (&_0 y)) (=2 x (&_1 y))))))))
(assert
  (forall ((x2 Int) (x3 Pair))
    (= (apply12 (lam x2) x3) (distinct x2 (fst x3)))))
(assert
  (forall ((x4 Int) (x5 Pair))
    (= (apply12 (lam2 x4) x5) (distinct x4 (fst x5)))))
(assert
  (forall ((p Form) (x list2)) (= (apply1 (lam3 p) x) (=2 x p))))
(check-sat)
