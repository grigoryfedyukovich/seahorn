(declare-sort sk_a 0)
(declare-datatypes ()
  ((list2 (nil2) (cons2 (head2 sk_a) (tail2 list2)))))
(declare-datatypes ()
  ((list (nil) (cons (head list2) (tail list)))))
(declare-fun weird_concat (list) list2)
(declare-fun append (list2 list2) list2)
(declare-fun concat2 (list) list2)
(assert (not (forall ((x list)) (= (concat2 x) (weird_concat x)))))
(assert
  (forall ((x list))
    (= (weird_concat x)
      (ite
        (is-cons x)
        (ite
          (is-cons2 (head x))
          (cons2 (head2 (head x))
            (weird_concat (cons (tail2 (head x)) (tail x))))
          (weird_concat (tail x)))
        nil2))))
(assert
  (forall ((x list2) (y list2))
    (= (append x y)
      (ite (is-cons2 x) (cons2 (head2 x) (append (tail2 x) y)) y))))
(assert
  (forall ((x list))
    (= (concat2 x)
      (ite (is-cons x) (append (head x) (concat2 (tail x))) nil2))))
(check-sat)
