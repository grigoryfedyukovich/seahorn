;; Original file: gib2.smt2
(set-logic HORN)
(declare-fun P0 (Int) Bool)
(declare-fun P1 (Int Int) Bool)
(declare-fun P2 (Int Int Int) Bool)
(declare-fun P3 (Int Int Int Int) Bool)
(assert (forall ((x0 Int) (x1 Int) (x2 Int) (x3 Int)) (=> (and (P0 x0) (P1 x0 x1) (P2 x0 x1 x2) (P0 x3) (= x2 0) (= x3 x0)) (P3 x0 x1 x2 x3))))
(assert (forall ((x2 Int) (x0 Int) (x1 Int) (x3 Int)) (=> (and (P0 x2) (P1 x2 x0) (P2 x2 x0 x1) (P1 x2 x3) (= x1 1) (= x3 x0)) (P3 x2 x0 x1 x3))))
(assert (forall ((x3 Int) (x2 Int) (x0 Int) (x1 Int)) (=> (and (P1 x3 x1) (P2 x3 x1 x2) (P0 x3) (or (< x2 0) (> x2 0)) (or (< x2 1) (> x2 1)) (= x2 (+ 1 x0))) (P0 x3))))
(assert (forall ((x2 Int) (x3 Int) (x1 Int) (x0 Int)) (=> (and (P0 x2) (P2 x2 x3 x1) (P1 x2 x3) (or (< x1 0) (> x1 0)) (or (< x1 1) (> x1 1)) (= x1 (+ 1 x0))) (P1 x2 x3))))
(assert (forall ((x1 Int) (x2 Int) (x0 Int) (x3 Int)) (=> (and (P0 x1) (P1 x1 x2) (P2 x1 x2 x3) (or (< x3 0) (> x3 0)) (or (< x3 1) (> x3 1)) (= x3 (+ 1 x0))) (P2 x1 x2 x0))))
(assert (forall ((x5 Int) (x1 Int) (x3 Int) (x0 Int) (x2 Int) (x4 Int)) (=> (and (P1 x5 x2) (P2 x5 x2 x1) (P3 x5 x2 x3 x4) (P0 x5) (or (< x1 0) (> x1 0)) (or (< x1 1) (> x1 1)) (= x3 (+ 1 x0)) (= x1 (+ 1 x3))) (P0 x5))))
(assert (forall ((x4 Int) (x5 Int) (x1 Int) (x2 Int) (x0 Int) (x3 Int)) (=> (and (P0 x4) (P2 x4 x5 x1) (P3 x4 x5 x2 x3) (P1 x4 x5) (or (< x1 0) (> x1 0)) (or (< x1 1) (> x1 1)) (= x2 (+ 1 x0)) (= x1 (+ 1 x2))) (P1 x4 x5))))
(assert (forall ((x2 Int) (x3 Int) (x0 Int) (x1 Int) (x4 Int) (x5 Int)) (=> (and (P0 x2) (P1 x2 x3) (P2 x2 x3 x1) (P3 x2 x3 x4 x5) (or (< x1 0) (> x1 0)) (or (< x1 1) (> x1 1)) (= x4 (+ 1 x0)) (= x1 (+ 1 x4))) (P2 x2 x3 x0))))
(assert (forall ((x4 Int) (x5 Int) (x1 Int) (x0 Int) (x2 Int) (x6 Int) (x3 Int) (x7 Int)) (=> (and (P0 x4) (P1 x4 x5) (P2 x4 x5 x1) (P3 x4 x5 x2 x3) (P3 x4 x5 x6 x7) (or (< x1 0) (> x1 0)) (or (< x1 1) (> x1 1)) (= x2 (+ 1 x6)) (= x1 (+ 1 x2)) (= x0 (+ x3 x7))) (P3 x4 x5 x1 x0))))
(assert (forall ((x0 Int) (x1 Int)) (=> (and (>= x0 0) (>= x1 0)) (P0 x0))))
(assert (forall ((x0 Int) (x1 Int)) (=> (and (>= x0 0) (>= x1 0)) (P1 x0 x1))))
(assert (forall ((x1 Int) (x2 Int) (x0 Int)) (=> (and (>= x1 0) (>= x2 0)) (P2 x1 x2 x0))))
(assert (forall ((x0 Int) (x1 Int) (x3 Int) (x2 Int)) (=> (and (P3 x0 x1 x2 x3) (>= x0 0) (>= x1 0) (<= (+ 1 x3) 0)) false)))
(check-sat)
