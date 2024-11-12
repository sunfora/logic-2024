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
       ]{7.2(a)}

Напишите следующие программы для машины Тьюринга и продемонстрируйте их работу с помощью какого-нибудь эмулятора:

a) сортирующую строку в алфавите {0,1} (например, из 01110111 программа должна сделать 00111111)

@section{Решение}

@(define id "e9c1aff1881a01bb007122d9f802e4fe")

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

@section{Почему это вообще работает?}

У нас две стадии:

@itemlist[
  #:style 'ordered
  @item{Находим нолик который стоит после единицы, либо заканчиваем.}
  @item{Возвращаем его на место и повторяем операцию.}
]
