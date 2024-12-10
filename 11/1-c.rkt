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
       ]{11.1(c)}

Целочисленный Div3, Fib

@section{Div3}

@verbatim{
  F3 = λx. IsZero (Pred (Pred x))
  If = λb.λf.λg. (Pair f g) b
  PlusF3 = λn. If (F3 (Succ n)) (Succ n) 0
  IncPair = λp. (Pair (PlusF3 (Fst p)) 
                      (If (IsZero (PlusF3 (Fst p))) 
                          (Succ (Tail p)) 
                          (Tail p)))
  Div3 = λn. Tail (n IncPair (Pair 0 0))
}

F3 тестирует принадлежит ли полю @${\mathfrak{F}_3} число.

Мы используем минус, но в целом понятно как его сделать имея Pred.
Например 2 раза написать Pred.

PlusF3 прибавляет единицу по модулю 3.

If это почти синоним к паре...

IncPair берет пару из числа по модулю три и результата. 
Если мы встретили число делящееся на 3, мы добавляем единичку к результату. Если нет, то ничего не делаем. 

Далее эту операцию надо просто многократно повторить.

@section{Fib}

@verbatim{
  FibHelper = λp. (Tail p) : (Fst p) + (Tail p)
  FibStart = 0 : 1
  Fib = λn. Fst (n FibHelper FibStart)
}

Та же самая идея, имеем пару. 
Делаем операции над парой и получаем результаты.
