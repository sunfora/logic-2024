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
       ]{11.3(a)}

Y-комбинатор, простые числа.

@section{Решение}

@verbatim{
  Rem = Y λf.λa.λb. IsZero (1 + a - b) a (f ~ (a - b) b)
  Divides = λa.λb. IsZero (Rem a b)
  DividesList = Y λf.λa.λl. (IsNil l) False ((Divides a (Fst l)) True (f a (Tail l)))
  SearchPrime = Y λf.λn.λl. (DividesList n l) (f ~ (Succ n) l) n
  NextPrime = λl. (SearchPrime (Fst l) l) : l
  Force = \n. \f.\x. n (\x. f ~ x) x
  Primes = λn. (Force n) NextPrime [2]
  Prime = λn. Fst ~ (Primes n)
}

Ну короче делаем рутинку SearchPrime, которая тупо поднимается пока не найдёт следующее простое. Проверяем каждое число не делится ли оно на какое-то из простых из списка. Ну и так далее.

@verbatim{
lci> Primes 10

[31, 29, 23, 19, 17, 13, 11, 7, 5, 3, 2]
(181689 reductions, 0.21s CPU)
}
