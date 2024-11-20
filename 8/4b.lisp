(load "4a.lisp")

(defrec const-1 (S N Z))

(defrec nonzero-2
  (R Z (S const-1 (U 3 3))))
(defrec nonzero
  (S nonzero-2 Z id))

(defrec a+1-b
  (S sub 
     (S N (U 2 1))
     (U 2 2)))

(defrec geq 
  (S nonzero a+1-b))

;; a b a-k result
(defrec get-k
        (S sub (U 4 1) (U 4 3)))
(defrec b*k
        (S mul (U 4 2) get-k))
(defrec a>=b*k
  (S geq (U 4 1) b*k))

(defrec result-3 (U 4 4))
(defrec zero-2 (S Z (U 2 1)))

(defrec div-3
  (R zero-2 
     (S sum a>=b*k result-3)))

(defrec div
  (S div-3 (U 3 1)
           (U 3 2)
           (U 3 1)))

(defrec % 
  (S sub (U 2 1)
         (S mul (U 2 2) div)))
