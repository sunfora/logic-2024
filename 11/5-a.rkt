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
       ]{11.5(a)}

Rev

@section{Решение}

@verbatim{
  S = \x.\y.\z.x z (y z)
  K = \x.\y.x
  I = \x.x
  
  Omega = S I I
}

