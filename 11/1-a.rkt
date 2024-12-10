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
       ]{11.1(a)}

Представьте трёхместный Xor и Мажоритарный элемент

@section{code}

@verbatim{
  Xor = λa.λb. Or (And (Not b) a) (And (Not a) b)
  Xor3 = λa.λb.λc. (Xor a (Xor b c))

  Maj = λa.λb.λc. Or (And a b) (Or (And b c) (And a c))
}
