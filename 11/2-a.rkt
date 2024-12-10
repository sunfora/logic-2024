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
       ]{11.2(a)}

Нормальная форма 2 2, 2 2 2

@section{Решение}

@verbatim{
  2 2 = (λf.λg. f (f g)) 2 
      = λg. 2 (2 g) 
      = λg. (λf.λx. f (f x)) (2 g) 
      = λg.λx. 2 g (2 g x)
      = λg.λx. 2 g (g (g x))
      = λg.λx. g (g (g (g x)))
      = 4
}

@verbatim{
  2 2 2 = (2 2) 2
        = 4 2
        = (λf.λg. f (f (f (f g)))) 2 
        = λg. 2 (2 (2 (2 g)))
        = λg. 2 (2 (λx. g (g (g (g x)))))
        = λg. 2 (2 (λf. 4 g f))
        = λg. λx. 4 (λf. 4 g f) x
        = λg. λx. 3 (λf. 4 g f) (4 g x)
        = λg. λx. 2 (λf. 4 g f) (4 g (4 g x))
        = λg. λx. 1 (λf. 4 g f) (4 g (4 g (4 g x)))
        = λg. λx. 0 (λf. 4 g f) (4 g (4 g (4 g (4 g x))))
        = λg. λx. (4 g (4 g (4 g (4 g x))))
        = λg. λx. (4 g (4 g (4 g (4 g x))))
        = λg. λx. (g (g (g (g (g (g (g (g (g (g (g (g (g (g (g (g x))))))))))))))))  
        = 16
}
