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
       ]{9.5}

Покажите, что формула @${D(x)} из доказательства теоремы о невыразимости доказуемости является представимой в формальной арифметике.


@section{пример кода}

Ну действительно есть вообще примитивно-рекурсивная функция, которая этим занимается, по сути мы делаем flatmap и в случае если встретили в формуле символ (а по условию он должен входить туда свободно), просто его берём и заменяем.

@verbatim{
  (defrec nth-list 
    (S sublist (U 2 2) (U 2 1) one-2))
  (defrec nth
    (S plog2 nth-list))

  (defrec x1? 
    (S && 
       (S eq? twenty-five (% (U 1 1) six))
       (S eq? one (div (S sub (U 1 1) twenty-five) six))))
  (defrec i
    (S sub (S len (U 3 1)) (U 3 2)))
  (defrec D-rec
    (R (S if (S x1? (S nth i (U 3 1)))
        (S append (U 3 1) result-3)
        (S append (S nth-list i (U 3 1)) result-3))
       one-2))
  (defrec D
    (S D-rec (U 1 1) (S len (U 1 1))))
}

Так как это рекурсивная функция она имеет своё представление в Ф.А. согласно теореме которую мы разбирали.
