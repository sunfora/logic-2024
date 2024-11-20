#lang scribble/manual
@(require scribble/manual)
@(require scribble-math)
@(require scribble/base)
@(require racket/file)
@(require racket/port)
@(require (only-in net/url 
                   get-pure-port
                   string->url))


@title[
       #:style (with-html5 manual-doc-style)
       #:tag "problem"
       #:version ""
       ]{7.4(e)}

Докажите что @${(a + b) + c = a + (b + c)} в аксиоматике Пеано.


@(define (autoindex . lst)
   (define (iter i rst)
     [if (null? rst)
       rst
       (cons 
         (cons (number->string i) (car rst)) 
         (iter (+ 1 i) (cdr rst)))])
   (iter 1 lst))

@section{Доказательство}

@bold{База:} @${(a + b) + 0 = a + (b + 0)}

@$${
\begin{align*}
  (a + b) + 0 &= a + b \\
              &= a + (b + 0)
\end{align*}
}

@bold{Переход:}

@$${
\begin{align*}
  (a + b) + c' &= ((a + b) + c)' \\
               &= (a + (b + c))' \\
               &= a + (b + c)' \\
               &= a + (b + c')
\end{align*}
}

