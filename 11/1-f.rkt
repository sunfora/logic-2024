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
       ]{11.1(f)}

Деление с остатком.

@section{Div}

@verbatim{
  F = λk.λx. IsZero (x - k)
  PlusF = λk. λn. If ((F k) (Succ n)) (Succ n) 0
  IncPair = λk. λp. (Pair ~ (PlusF k (Fst p)) 
                          ~ (If ~ (IsZero (PlusF k (Fst p))) 
                              (Succ (Tail p)) 
                              (Tail p)))
  Force = \n. \f.\x. n (\x. f ~ x) x
  Div = λa.λb. (Force a) (IncPair ~ (Pred b)) (Pair 0 0)
}

Аналогично Div3 поступаем, храним пару, делаем плюс в поле @${\mathfrak{F}_k} и добавляем единичку ко второй части пары в случае нуля.
