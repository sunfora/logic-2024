(declaim 
  (ftype (function (t) t) subs))

(defun handle-Z (args) 
  (declare (ignore args))
  0)

(defun handle-N (args)
  (+ 1 (eval (car args))))

(defun handle-U (dim args)
  (destructuring-bind (n k)
    dim
    (declare (ignore n))
    (nth (- k 1) args)))

(defun handle-S (expr args)
  (destructuring-bind (g &rest funcs)
    expr
    `(rec ,g 
          ,(loop for f in funcs
                 collect (eval `(rec ,f ,args))))))

(defun handle-R (expr args)
  (destructuring-bind (f g)
    expr
    (let ((y (eval (car (last args))))
          (x (butlast args)))
      (if (zerop y)
        `(rec ,f ,x)
        `(rec ,g ,`(,@x ,(- y 1)
                        (rec (R ,f ,g)
                             ,`(,@x ,(- y 1)))))))))
(defun arity (expr)
  (cond ((equalp expr 'Z)
         1)
        ((equalp expr 'N)
         1)
        ((equalp (car expr) 'U)
         (cadr expr))
        ((equalp (car expr) 'S)
         (arity (caddr expr)))
        ((equalp (car expr) 'R)
         (+ 1 (arity (cadr expr))))))

(defmacro rec (expr-s args)
  (let ((expr (subs expr-s)))
    (cond
      ((equalp expr 'Z)
       (handle-Z args))
      ((equalp expr 'N)
       (handle-N args))
      ((equalp (car expr) 'U)
       (handle-U (cdr expr) args))
      ((equalp (car expr) 'S)
       (handle-S (cdr expr) args))
      ((equalp (car expr) 'R)
       (handle-R (cdr expr) args)))))

(defun subs (expr)
  (cond ((equalp expr 'Z)
         expr)
        ((equalp expr 'N)
         expr)
        ((symbolp expr)
         (symbol-value expr))
        ((listp expr)
         (cons (car expr)
               (mapcar #'subs (cdr expr))))
        (T expr)))

(defmacro defrec (name expr)
  `(progn 
     (defvar ,name)
     (setf ,name (quote ,(subs expr)))))
