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
       ]{11.4(a)}

Length

@section{Решение}

@verbatim{
  Length = Y λf. λl. (IsNil l) 0 (Succ (f (Tail l)))
}

