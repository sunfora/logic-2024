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
       ]{11.3(b)}

Y-комбинатор, plog

@section{Решение}

@verbatim{
  DivMod = (Y λf. λr.λa.λb. IsZero (1 + a - b) (a:r) (f ~ (Succ r) ~ (a - b) b)) 0
  PlogHelper = (Y λf. λx.λr.λb. (IsZero (Fst r)) (f (Succ x) (DivMod (Snd r) b) b) x) 0
  Plog = λn.λb. (PlogHelper ~ (DivMod n b) b)
}

Делим, по результату смотрим надо пробовать делить дальше.
