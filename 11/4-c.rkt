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
       ]{11.4(c)}

Rev

@section{Решение}

@verbatim{
  Rev = (Y λf. λr.λl. (IsNil l) r (f ((Fst l) : r) (Tail l))) []

}

@section{Пример исполнения}
@verbatim{
  lci - A lambda calculus interpreter
  Type a term, Help for info or Quit to exit.

  lci> Rev = (Y λf. λr.λl. (IsNil l) r (f ((Fst l) : r) (Tail l))) []
  lci> Rev [1, 2, 3, 4]

  [4, 3, 2, I]
  (216 reductions, 0.00s CPU)
  lci> Rev (Rev [1, 2, 3, 4, 5, 6])

  [I, 2, 3, 4, 5, 6]
  (3226 reductions, 0.00s CPU)
  lci> 
}

@section{Scheme}

Ну в общем... почти то же самое :).
@verbatim{
  (define (rev lst)
    (define (iter to from)
      (if (nil? from)
        to
        (iter (cons (car from) to)
              (cdr from))))
    (iter nil lst))
}
