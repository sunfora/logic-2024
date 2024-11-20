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
       ]{7.4(a)}

Докажите что @${a \cdot b = b \cdot a} в аксиоматике Пеано.


@(define (autoindex . lst)
   (define (iter i rst)
     [if (null? rst)
       rst
       (cons 
         (cons (number->string i) (car rst)) 
         (iter (+ 1 i) (cdr rst)))])
   (iter 1 lst))

@(define A7 @${a \cdot 0 = 0})
@(define (S1 a b)
   @${{@a} \rightarrow {@b} \rightarrow {@a}})

@(define st-1 @A7)
@(define st-2 @S1{@A7 T})
@(define st-3 @${T \rightarrow @A7})

@section{Лемма 1.}
@bold{Утверждение:} @${a \cdot 0 = 0 \cdot a}

@bold{База:} @${0 \cdot 0 = 0 \cdot 0} 

Действительно, мы доказывали @${a = a}

@bold{Переход:} @${
  {x \cdot 0 = 0 \cdot x} \vdash {x' \cdot 0 = 0 \cdot x'}
}

@margin-note{
  Здесь я подробно распишу, но дальше так конечно я делать не буду
}

@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {x' \cdot 0 = 0}
    } 
    "(Аксиома 7)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {0 \cdot x' = 0 \cdot x + 0} 
    } 
    "(Аксиома 8)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {0 \cdot x = x \cdot 0} 
    } 
    "(Гипотеза)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {x \cdot 0 = 0} 
    } 
    "(Аксиома 7)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {0 \cdot x = 0} 
    } 
    "(M.P. + Aксиома 1)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {0 \cdot x + 0 = 0 \cdot x} 
    } 
    "(Aксиома 5)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {0 \cdot x + 0 = 0} 
    } 
    "(M.P. + Аксиома 1)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash 0 = 0 \cdot x + 0 
    } 
    "(a = b → b = a)"
  )
  (list 
    @${
      {x \cdot 0 = 0 \cdot x} \vdash {x' \cdot 0 = 0 \cdot x'}
    }
    "(M.P. + Аксиома 1)"
  )
)]

@section{Лемма 2.}

@bold{Утверждение:} @${a' \cdot x = a \cdot x + x}

@bold{База:} @${a' \cdot 0 = a \cdot 0 + 0}

Ну действительно @${a' \cdot 0 = a \cdot 0 = 0}.

@bold{Переход:} 

@$${
\begin{align*}
  a' \cdot x' &= a' \cdot x + a' \\
              &= a \cdot x + x + a' \\
              &= a \cdot x + a + x' \\
              &= (a \cdot x + a) + x' \\
              &= a \cdot x' + x' \\
\end{align*}
}

@section{Доказательство}

Имея первую лемму и вторую, можно построить доказательство.

Берем @${a \cdot b = b \cdot a} индукцию по @${b}.

@bold{База:} (Лемма 1.)

@bold{Переход:}

@$${ \begin{align*}
  a \cdot b' &= a \cdot b + a\\
             &= b \cdot a + a\\
             &= b' \cdot a \\
\end{align*}
}
