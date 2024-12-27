(load "3.cl")

;; 3-a
(defun inner-intersect (a)
  (filter (lambda (x) 
            (every (lambda (ai) 
                     (member x ai))
                   a))
          (flatten a)))
