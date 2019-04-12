(declare-datatypes () ((Nat (Z) (S (p Nat)))))
(declare-fun op (Nat Nat Nat Nat) Nat)
(assert
  (not
    (forall ((x Nat) (a Nat) (b Nat) (c Nat) (d Nat))
      (= (op (op x a a a) b c d) (op a (op b x b b) c d)))))
(assert
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y z x2)
      (ite
        (is-S x)
        (ite (is-S z) (op (S (p x)) y (p z) (S x2)) (op (p x) y y x2))
        (ite (is-S z) (op Z y (p z) (S x2)) x2)))))
(check-sat)
