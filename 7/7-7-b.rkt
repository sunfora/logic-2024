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
       ]{7.7(b)}

Докажите что @${\forall a . \forall b . a = b \rightarrow b = a} в аксиоматике Пеано.


@(define (autoindex . lst)
   (define (iter i rst)
     [if (null? rst)
       rst
       (cons 
         (cons (number->string i) (car rst)) 
         (iter (+ 1 i) (cdr rst)))])
   (iter 1 lst))

@section{Доказательство}

@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      {a = b \rightarrow a = c \rightarrow b = c}
    } 
    "(A1)"
  )
  (list 
    @${
      \forall c. \quad {a = b \rightarrow a = c \rightarrow b = c}
    } 
    "(как в лекции)"
  )
  (list 
    @${
      {a = b \rightarrow a = a \rightarrow b = a}
    } 
    "(Подстановка терма)"
  )
  (list 
    @${
    {a = a \rightarrow a = b \rightarrow b = a}
    } 
    "(Перестановка условий)"
  )
  (list 
    @${
    {a = b \rightarrow b = a}
    } 
    "(a = a + M.P.)"
  )
  (list 
    @${
    \forall a. \forall b. \quad {a = b \rightarrow b = a}
    } 
    "(навешиваем кванторы как в лекции)"
  )
)]
