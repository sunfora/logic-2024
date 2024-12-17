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
       ]{11.4(b)}

Map2

@section{Решение}

@verbatim{
  Map2 = Y λf. λg. λa.λb. ((IsNil a) || (IsNil b)) [] ((g (Fst a) (Fst b)) : (f g (Tail a) (Tail b)))
}

