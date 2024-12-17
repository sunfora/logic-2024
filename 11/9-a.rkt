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
       ]{11.9(a)}

Rev

@section{Решение}

@verbatim{
  λn. λf.λx. n f (f x)

  x : a
  f : a -> a
  f x : a
  n : (a -> a) -> a -> a
  n f : a -> a
  n f (f x) : a
  \x. n f (f x) : a -> a
  \f. \x. n f (f x) : (a -> a) -> a -> a
  \n. \f. \x. n f (f x) : ((a -> a) -> a -> a) -> (a -> a) -> a -> a
}

