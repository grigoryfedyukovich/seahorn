(declare-rel inv ( Int Int ))
(declare-var i Int)
(declare-var i1 Int)
(declare-var j Int)
(declare-var j1 Int)

(rule (inv i j))

(rule (=> 
    (and 
        (inv i j)
        (>= i 0)
        (= i1 (+ i j))
        (= j1 (- (* -2 j) 1))
    )
    (inv i1 j1)
  )
)
