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
       ]{11.1(e)}

Ограниченное вычитание плюс сравнения.

@section{Minus}

@verbatim{
  Minus = λa.λb. b Pred a
}

Просто несколько раз вызываем Pred.

@section{Lt, Gt, ...}

@verbatim {
  Leq = λa.λb. IsZero (Minus a b)
  Geq = λa.λb. Leq b a
  Lt = λa.λb. Not (Geq a b)
  Gt = λa.λb. Not (Leq a b)
  Equal = λa.λb. (Leq a b) && (Geq a b)
}

Ну понятно стандартный трюк, как в примитивно рекурсивных.
Имея IsZero можно всё остальное в целом выразить.
