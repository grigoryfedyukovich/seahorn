(declare-rel inv (Int Int))
(declare-var j Int)
(declare-var j1 Int)
(declare-var d Int)
(declare-var d1 Int)

(rule (inv j d))

(rule (=> 
    (and 
        (inv j d)
        (>= j 0)
        (= j1 (/ j d))
        (= d1 (+ d 1))
    )
    (inv j1 d1)
  )
)
