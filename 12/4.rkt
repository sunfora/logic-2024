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
       ]{12.4}

@${\langle a, b \rangle = \langle c, d \rangle \leftrightarrow a = c \land b = d}

@section{Доказательство}

По аксиоме пары мы знаем что @${\forall x.\ x \in \{c\} \to x = c}

Альтернативно, по аксиоме равенства @${x = a \to x \in \{a\} \land a \in \{a\}}

В финале получаем:

@${x \in \{c\} \to x \in \{a\}}

Повторяя рассуждение в обратную сторону мы заключаем что

@${a = c \to \{a\} = \{c\}}
