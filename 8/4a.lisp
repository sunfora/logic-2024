(load "recursive.lisp")

(defrec id (U 1 1))
(defrec result-2 (U 3 3))

(defrec sum 
  (R id (S N result-2)))

(defrec mul 
  (R Z (S sum (U 3 1) result-2)))

(defrec dec2 (R Z (U 3 2)))
(defrec dec (S dec2 id id))

(defrec sub 
  (R id (S dec result-2)))
