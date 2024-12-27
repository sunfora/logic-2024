(load "3.cl")

;; 3-b
(defun setsub (a b)
  (filter (lambda (e)
            (not (member e b)))
          a))

(defun simsub (a b)
  (flatten 
    (pair (setsub a b)
          (setsub b a))))
