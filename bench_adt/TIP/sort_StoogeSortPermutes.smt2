(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(declare-datatypes () ((Pair (Pair2 (first list) (second list)))))
(declare-fun ztake (Int list) list)
(declare-fun zlength (list) Int)
(declare-fun zdrop (Int list) list)
(declare-fun zsplitAt (Int list) Pair)
(declare-fun sort2 (Int Int) list)
(declare-fun null (list) Bool)
(declare-fun elem (Int list) Bool)
(declare-fun delete (Int list) list)
(declare-fun isPermutation (list list) Bool)
(declare-fun append (list list) list)
(declare-fun reverse (list) list)
(declare-fun stooge1sort2 (list) list)
(declare-fun stoogesort (list) list)
(declare-fun stooge1sort1 (list) list)
(assert (not (forall ((x list)) (isPermutation (stoogesort x) x))))
(assert
  (forall ((x Int) (y list))
    (= (ztake x y)
      (ite
        (= x 0) nil
        (ite (is-cons y) (cons (head y) (ztake (- x 1) (tail y))) nil)))))
(assert
  (forall ((x list))
    (= (zlength x) (ite (is-cons x) (+ 1 (zlength (tail x))) 0))))
(assert
  (forall ((x Int) (y list))
    (= (zdrop x y)
      (ite (= x 0) y (ite (is-cons y) (zdrop (- x 1) (tail y)) nil)))))
(assert
  (forall ((x Int) (y list))
    (= (zsplitAt x y) (Pair2 (ztake x y) (zdrop x y)))))
(assert
  (forall ((x Int) (y Int))
    (= (sort2 x y)
      (ite (<= x y) (cons x (cons y nil)) (cons y (cons x nil))))))
(assert (forall ((x list)) (= (null x) (not (is-cons x)))))
(assert
  (forall ((x Int) (y list))
    (= (elem x y)
      (ite (is-cons y) (or (= x (head y)) (elem x (tail y))) false))))
(assert
  (forall ((x Int) (y list))
    (= (delete x y)
      (ite
        (is-cons y)
        (ite (= x (head y)) (tail y) (cons (head y) (delete x (tail y))))
        nil))))
(assert
  (forall ((x list) (y list))
    (= (isPermutation x y)
      (ite
        (is-cons x)
        (and (elem (head x) y)
          (isPermutation (tail x) (delete (head x) y)))
        (null y)))))
(assert
  (forall ((x list) (y list))
    (= (append x y)
      (ite (is-cons x) (cons (head x) (append (tail x) y)) y))))
(assert
  (forall ((x list))
    (= (reverse x)
      (ite
        (is-cons x) (append (reverse (tail x)) (cons (head x) nil)) nil))))
(assert
  (forall ((x list))
    (= (stooge1sort2 x)
      (let ((y (zsplitAt (div (zlength x) 3) (reverse x))))
        (append (stoogesort (second y)) (reverse (first y)))))))
(assert
  (forall ((x list))
    (= (stoogesort x)
      (ite
        (is-cons x)
        (ite
          (is-cons (tail x))
          (ite
            (is-cons (tail (tail x)))
            (stooge1sort2
              (stooge1sort1
                (stooge1sort2
                  (cons (head x)
                    (cons (head (tail x))
                      (cons (head (tail (tail x))) (tail (tail (tail x)))))))))
            (sort2 (head x) (head (tail x))))
          (cons (head x) nil))
        nil))))
(assert
  (forall ((x list))
    (= (stooge1sort1 x)
      (let ((y (zsplitAt (div (zlength x) 3) x)))
        (append (first y) (stoogesort (second y)))))))
(check-sat)
