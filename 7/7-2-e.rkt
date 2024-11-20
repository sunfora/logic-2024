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
       ]{7.2(e)}

Напишите следующие программы для машины Тьюринга и продемонстрируйте их работу с помощью какого-нибудь эмулятора:

e) допускающую строки вида @${a^nb^nc^n} в алфавите @${\{a,b,c\}} (например, строка @${aabbcc} должна допускаться, а @${abbbc} --- отвергаться)

@section{Решение}

@(define id "e898bbe84602ef67ff66cf3384796724")

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
