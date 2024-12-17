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
       ]{11.5(b)}

Rev

@section{Решение}

@verbatim{
  S = \x.\y.\z.x z (y z)
  K = \x.\y.x
  I = \x.x

  E x = f (x x)
      = f (I x I x)
      = f (S I I x)
      = (K f x) (S I I x)
      = S (K f) (S I I) x
      = (K S f) (K f) (S I I) x
      = (S (K S) K f) (S I I) x
      = (S (K S) K f) (K (S I I) f) x
      = (S (S (K S) K) (K (S I I)) f) x
  E = (S (S (K S) K) (K (S I I))) f
  
  T = (S (S (K S) K) (K (S I I)))
  Y = S T T

  1 = \f.\x. f x
  
  1 f x = f x
        = (K f x) (I x)
        = (S (K f) I) x
        = ((K S f) (K f) I) x
        = ((S (K S) K f) I) x
        = (S (S (K S) K) (K I)) f x

  one = (S (S (K S) K) (K I))
}

