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
       ]{7.4(b)}

Докажите дистрибутивность в аксиоматике Пеано.


@(define (autoindex . lst)
   (define (iter i rst)
     [if (null? rst)
       rst
       (cons 
         (cons (number->string i) (car rst)) 
         (iter (+ 1 i) (cdr rst)))])
   (iter 1 lst))

@section{Доказательство}

@bold{База:} @${(a + 0) \cdot c = a \cdot c + 0 \cdot c} 

@${(a + 0) = a}, @${0 \cdot c = 0}, ну а значит обе части равны

@bold{Переход:}

@$${ 
\begin{align*}
  (a + b') \cdot c &= (a + b)' \cdot c\\
             &= (a + b) \cdot c + c \\
             &= a \cdot c + b \cdot c + c\\
             &= a \cdot c + b' \cdot c\\
\end{align*}
}
