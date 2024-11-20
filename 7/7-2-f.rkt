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
       ]{7.2(f)}

Напишите следующие программы для машины Тьюринга и продемонстрируйте их работу с помощью какого-нибудь эмулятора:

f) допускающую только строки, состоящие из констант и импликаций (алфавит @${\{ 0, 1, \rightarrow, (, ) \}}), 
содержащие истинные логические выражения;
например, выражение @${(((0 \rightarrow 1) \rightarrow 0) \rightarrow 0)} машина должна допустить, а
выражение @${((1 \rightarrow 1) \rightarrow 0)} --- отвергнуть. Можно считать, что выражение написано в корректном синтаксисе (все скобки корректно
расставлены, никаких скобок не пропущено). 

@section{Решение}

@(define id "8983727b5309df575412571fe2258b3e")

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
