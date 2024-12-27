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
       ]{12.3(b)}

Разность множеств и ксор.

@section{Существует}

Первое буквально в лоб: 

@${a \setminus b = \{x \in a : x \not\in b \}}

Второе не сложнее:

@${\cup \{a \setminus b, b \setminus a\}}


@section{Пример}
@(verbatim
   (file->string "../12/3-b.cl"))

@verbatim{
* (setsub '(1 2 4 5) '(5 2 4 6))
(1)
* (setsub '(1 2 4 5) '(2 4))
(1 5)
* (simsub '(1 2 3 5) '(2 4 6))
(1 3 5 4 6)
* (simsub '(1 2 3 5) '(2 3 5 6))
(1 6)
}

@section{3.cl}
@(verbatim
   (file->string "../12/3.cl"))
