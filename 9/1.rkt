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
       ]{9.1}

Докажите что ω-непротиворечивая теория непротиворечива.
@section{Доказательство}

Пусть противоречива, тогда существует формула: которая @${\vdash \phi(x)} и одновременно @${\vdash \neg\phi(x)}.

Из первого следует @${\vdash \forall x.{\phi(x)}}. А значит @${\vdash \phi(\bar{x})}. 

Но тогда @${\not\vdash \exists x. \neg \phi(x)} по определению ω-непротиворечивости.

С другой стороны второе утверждение говорит нам о том что @${\vdash \exists x. \neg \phi(x)}.

Мы пришли к противоречию, значит такого быть не могло.
