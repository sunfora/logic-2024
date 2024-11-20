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
       ]{8.4(a)}

Продемонстируйте что умножение и ограниченное вычитание примитивно рекурсивны.

@section{Код}

@(verbatim
   (file->string "../8/4a.lisp"))

@section{Примеры}
@verbatim{
* (rec sub (3 5))
0
* (rec sub (3 2))
1
* (rec mul (4 2))
8
* (rec mul (0 1))
0
}

@section{Эмулятор}
@(verbatim
   (file->string "../8/recursive.lisp"))
