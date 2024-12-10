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
       ]{11.1(d)}

Надо сделать SqrtInt.

@section{SqrtInt}

Ну понятно как сделать сложение. 
Из сложения понятно как сделать умножение. Из ограниченного вычитания 

@verbatim{
  NextSquare = λp. (Succ (Fst p)) : (Succ (2 * (Fst p) + (Tail p)))
  Force = \n. \f.\x. n (\x. f ~ x) x
  SqrtInt = λn. (Fst ~ 
                 ((Force n) 
                  (λp. If (Leq (Tail (NextSquare p)) n) 
                       (NextSquare p) p) 
                  (0 : 0)))
}

Тут катастрофически долгое исполнение поэтому я подускорил с помощью специального оператора Force, который делает из нормального исполнения вполне себе call-by-value на чарчевских нумералах.

Но суть тут тупейшая, типа берем пары, считаем следующее значение и просто через If прекращаем исполнение когда нашли нужное значение.

Все остальные операции мы более менее умеем делать. Во всяком случае в следующем задании всё есть.
