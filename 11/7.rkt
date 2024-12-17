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
       ]{11.7}

Теорема Чарча Россера, опровержение для обычной β-редукции.

@section{Доказательство}

@verbatim{
  T = 2 (I g)
  A = 2 g
  B = λx. (I g) ((I g) x)

  A -> *
  1. λx. g (g x)

  B -> *
  1. λx. g ((I g) x)
  2. λx. (I g) (g x)
}

Ну в общем как видно мы исчерпали все возможные варианты, а T -> A и T -> B всё равно не сошлись. Или категорико-теоритически у нас пушаут отсутствует.
