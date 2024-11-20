(load "4b.lisp")

(defrec inv
  (S sub const-1 id))

(defrec zero?
  (S inv nonzero))

(defrec divisors-2
  (R Z
     (S sum (S zero? 
               (S % (U 2 1)
                    (S N (U 2 2))))
        result-2)))

(defrec divisors
  (S divisors-2 id id))

(defrec swap-sub
  (S sub (U 2 2) (U 2 1)))

(defrec &&
  (S nonzero mul))

(defrec exact?
  (S &&
     (S zero? sub)
     (S zero? swap-sub)))

(defrec const-2
  (S N (S N Z)))

(defrec prime?
  (S exact?
     const-2 
     divisors))
  
(defrec lt
  (S inv geq))

(defrec min-value 
   (S sum
     (S mul geq (U 2 2))
     (S mul lt  (U 2 1))))
      
(defrec =if=
  (S sum
    (S mul (U 3 2) (U 3 1))
    (S mul (U 3 3) (S inv (U 3 1)))))

(defrec i+k
  (S sum
     (U 3 1)
     (S sub
        (U 3 1)
        (U 3 2))))

(defrec search-next-prime-2
  (R Z 
     (S =if= (S prime? i+k)
        i+k
        result-2)))
(defrec search-next-prime
  (S search-next-prime-2 id id))

(defrec ith-prime-2
  (R const-2
     (S search-next-prime result-2)))

(defrec ith-prime
  (S ith-prime-2 Z id))
