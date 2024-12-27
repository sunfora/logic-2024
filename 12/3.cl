;; LIB
(defun empty NIL)
(defun pair (a b) (list a b))
(defun flatten (l)
  (loop for s in l
        append s))

(defun powerset (l)
  (if (not l)
    (list nil)
    (let* ((x (car l))
           (ta (cdr l))
           (resno (powerset ta))
           (resin (mapcar (lambda (re) (cons x re))
                    resno)))
      (flatten (list resno resin)))))

(defun filter (p l)
  (loop for e in l
       when (funcall p e)
        collect e))
