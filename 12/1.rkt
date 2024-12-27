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
       ]{12.1}

Полный порядок на @${\mathbb{Z}} и @${\mathbb{Q}}.
Является ли полным порядок на всех корнях квадратных уравнений?

@section{Про корни}
Нет не является, потому что уравнения вида @${x^2 = n^2} порождают @${\mathbb{Z}}.
Если бы были вполне упорядочены, то в каждом подмножестве был минимальный элемент. У @${\mathbb{Z}} их нет.

@section{Полные порядки}

Сделаем отображения @${\mathbb{Z} \to \mathbb{N}} и @${\mathbb{Q} \to \mathbb{N}}.
Мы умеем это делать.

Например Zig-Zag encoding для целых чисел.

@$${
  \begin{align*}
  {0  \mapsto 0} \\
  {1  \mapsto 1} \\
  {-1 \mapsto 2} \\
  {2  \mapsto 3} \\
  {-2  \mapsto 4} \\
  \vdots 
  \end{align*}
}

И теперь мы можем @${\mathbb{Q}} изобразить через zig-zag.

@${\prod p_i^{f_i} \mapsto \prod p_i^{\text{zigzag}(f_i)}}

По порядку на получившихся натуральных сделаем порядок на исходных множествах.
Условно говоря минимальный в случае целых - тот что по абсолютному значению минимален, а если таковых двое, то положительный.

Ну и аналогично с дробями.
