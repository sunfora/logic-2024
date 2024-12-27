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
       ]{12.3(a)}

Пересечение всех элементов множества. 

@section{Существует}

Действительно давайте используя аксиому объединения, получим @${\cup a}. 

И теперь просто сделаем процеживание формулкой: @${\{ x \in \cup a : \forall a_i.\ a_i \in a \land x \in a_i\}}.

@section{Пример}

@(verbatim
   (file->string "../12/3-a.cl"))

@verbatim{
* (inner-intersect '((1 2 3) (4 3 2) (1 2)))
(2 2 2)
* (inner-intersect '((1 2 3) (4 3 2) (1)))
NIL
* (inner-intersect '((1 2 3) (4 3 2) (1 2 3)))
(2 3 3 2 2 3)
}

@section{3.cl}
@(verbatim
   (file->string "../12/3.cl"))
