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
       ]{11.2(b)}

Нормальная форма m n

@section{Решение}

Я утверждаю что нормальная форма данного выражения это n@superscript{m} за исключением нуля, где оно равно Id.

Перед этим давайте докажем следующую лемму:
@verbatim{
  λf. n (m f) = n * m
}
Ну действительно
@verbatim{
  λf. n (m f) = n * m
              = λf.λx. (m f (m f (m f ... (m f x)))) 
              = m*n
}

Ну действительно для m = 0 получаем

@verbatim{
  0 n = (λf.λx.x) n
      = λx. x
      = Id
}

Для m = 1 мы получаем

@verbatim{
  1 n = (λf.λx.f x) n
      = λx. n x
      = λf. n f
      = n
      = n^1
}

Теперь давайте рассмотрим (Succ m)
@verbatim{
  (Succ m) n = Succ m n
             = (λn.λf.λx. n f (f x)) m n
             = λx. m n (n x)
             = λf. n^m (n f)
             = n^m * n
             = n^(Succ m)
}

Ну что и требовалось доказать


