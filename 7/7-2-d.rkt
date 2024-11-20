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
       ]{7.2(d)}

Напишите следующие программы для машины Тьюринга и продемонстрируйте их работу с помощью какого-нибудь эмулятора:

d) допускающую правильные скобочные записи (например, @${(())} должно допускаться, а @${)()(} --- отвергаться)

@section{Решение}

@(define id "e4500568cefc82ca8d7e436321a46496")

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
