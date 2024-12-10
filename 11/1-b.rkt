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
       ]{11.1(b)}

IsZero, IsEven

@section{IsZero}

@verbatim{
  IsZero = λn. n (True False) True
}

True это буквально функция константа. 
Поэтому мы можем тупо подставить константную функцию на репит. Ну и понятно что False@superscript{0} = Id, False@superscript{i} = False

@section{IsEven}

Xor мы умеем делать@superscript{[1(a)]}
@verbatim{
  IsEven = λn. n (Xor True) True
}

Делаем 1 ⊕ 1 ⊕ 1 ⊕ 1 ⊕ 1 ⊕ ...
И естественным образом получаем Even.
