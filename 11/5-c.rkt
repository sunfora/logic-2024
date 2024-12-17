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
       ]{11.5(c)}

Rev

@section{Решение}

@verbatim{
  S = \x.\y.\z.x z (y z)
  K = \x.\y.x
  I = \x.x

  T x y z = y
          = I y
          = I (I y)
          = (K I y) (I y)
          = (S (K I) I) y
          = K ((S (K I) I) y) z
          = K ((K (S (K I) I) y) (I y)) z
          = K (S (K (S (K I) I)) I y) z
          = (S (K K) (S (K (S (K I) I)) I)) y z
          = (K (S (K K) (S (K (S (K I) I)) I))) x y z
  T = (K (S (K K) (S (K (S (K I) I)) I)))
}

