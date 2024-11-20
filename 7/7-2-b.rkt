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
       ]{7.2(b)}

Напишите следующие программы для машины Тьюринга и продемонстрируйте их работу с помощью какого-нибудь эмулятора:

b) прибавляющую 1 к числу в двоичной системе (например, из 1011 программа должна сделать 1100)

@section{Решение}

@(define id "7bd5be3baad6a51035b5043ed3fe4e44")

@(define gist 
   (string-append "https://gist.github.com/sunfora/" id))
@(define raw-gist 
   (string-append gist "/raw"))

@url{@gist}
@(verbatim
  (port->string (get-pure-port #:redirections 1 (string->url raw-gist)))
)

Визуализатор:
@url{https://turingmachine.io/}
