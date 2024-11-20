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
       ]{8.4(b)}

Продемонстируйте что деление и остаток от деления примитивно рекурсивны.

@section{Код}

@(verbatim
   (file->string "../8/4b.lisp"))

@section{Примеры}
@verbatim{
* (rec div (128 2))
64
* (rec div (12 3))
4
* (rec div (11 3))
3
* (rec % (11 3))
2
* (rec % (128 7))
2
* (rec % (3 5))
3

}

@section{Эмулятор}
@(verbatim
   (file->string "../8/recursive.lisp"))
