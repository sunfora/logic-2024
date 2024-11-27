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
       ]{9.2}

@(define (zeta x) 
   @${\forall z.@(subs @x @x @${z}) \rightarrow \varphi(z)})

@(define (subs p q r)
   @${\sigma(@p, @q, @r)})

@(define (quote-formula f)
   @${\overline{\ulcorner{@f}\urcorner}})

Пусть @${\zeta_\varphi(x) := @zeta{x}},
где формула @(subs @${p} @${q} @${r}) представляет функцию @smaller{SUBS}@${(p,q)}, заменяющую в формуле с гёделевым номером @${p}
все свободные переменные @${x_1} на формулу @${q}. Тогда покажите, что формулу @${\alpha_\varphi := \zeta_\varphi(@quote-formula{@${\zeta_\varphi}})}
можно взять в качестве формулы @${\alpha} в лемме об автоссылках: @${\vdash \varphi(@quote-formula{@${\alpha_\varphi}}) \leftrightarrow \alpha_\varphi}.


@section{Доказательство}

@${\triangleleft}

@(define quoted-zeta 
  @quote-formula{@${\zeta_\varphi}})

@(define quoted-alpha
  @quote-formula{@${\alpha_\varphi}})

Ну раз @${\alpha_{\varphi}}, то значит @zeta{@quoted-zeta}. А значит под @${z} мы можем взять просто навсего @${@quoted-alpha}.

Иначе говоря @${@(subs @quoted-zeta @quoted-zeta @quoted-alpha) \to \varphi(@quoted-alpha)}.

Так как @smaller{SUBS} является функцией причём достаточно нормальной, ну то есть рекурсивной, то мы знаем по теореме из прошлой лекции что в формальной арифметике @${\vdash @(subs @quoted-zeta @quoted-zeta @quoted-alpha)} 

∎

@${\triangleright}

Берём гипотезу и по лемме о равенстве получаем что @${@quoted-alpha = z \to \varphi(z)}. Берём определению функции @smaller{SUBS} и получаем @${@quoted-alpha = z \to @(subs @quoted-zeta @quoted-zeta @${z})}.

Комбинируя два утверждения получаем 

@${\vdash @quoted-alpha = z \to @(subs @quoted-zeta @quoted-zeta @${z}) \to \varphi(z)}.

Из свойств рекурсивной функции получаем также вот такое утверждение:

@${\vdash \neg({@quoted-alpha = z}) \to \neg@(subs @quoted-zeta @quoted-zeta @${z})}.

Его легко трансформировать вот в это:

@${\vdash \neg({@quoted-alpha = z}) \to \neg \varphi(z) \to \neg@(subs @quoted-zeta @quoted-zeta @${z})}.

Что полностью эквивалентно следующему:

@${\vdash \neg({@quoted-alpha = z}) \to @(subs @quoted-zeta @quoted-zeta @${z}) \to \varphi(z)}.

По лемме об устранении посылки мы просто получаем:

@${\vdash @(subs @quoted-zeta @quoted-zeta @${z}) \to \varphi(z)}

И теперь если накинуть квантор то получим ровно запись @${\alpha_\varphi}.

∎

@section{Лемма о равенстве}
Пусть есть произвольная формула в формальной арифметике @${\phi(x)} со свободной переменной @${x}. Пусть @${y} не присутствует в @${\phi(x)}.

Тогда @$${ \vdash \phi(x) \to x = y \to \phi(y)}
@subsection{Доказательство:}

Будем делать рекурсию по длине формулы. 

@larger{Кванторы}

@bold{Пусть дано:}
@${\vdash \phi(x) \to x = y \to \phi(y)}

@bold{Надо показать:}
@${\vdash (\forall z. \phi(x)) \to x = y \to \forall z. \phi(y)}

Ну понятно, берем в гипотезу @${\forall z. \phi(x)}. Откуда получаем @${\phi(x)}. Откуда получаем по M.P. @${x = y \to \phi(y)}.

@$${\forall z. \phi(x) \vdash {x = y \to \phi(y)}}
@$${\forall z. \phi(x) \vdash {x = y \to \forall z. \phi(y)}}

@bold{Надо показать:}
@${\vdash (\exists z. \phi(x)) \to x = y \to \exists z. \phi(y)}

Ну тут совсем тривиально: @${\vdash \phi(y) \to \exists z. \phi(y)}.
Сделаем переход и набросим квантор просто слева, так как теперь z точно не входит в формулу свободно справа.

@larger{Связки}

Будем доказывать исключительно для ¬ и для &. Так как мы находимся в рамках формальной арифметики классической логики и все остальные выражаются через них.

@bold{Пусть дано:}
@${\vdash \phi(x) \to x = y \to \phi(y)}

@bold{Надо показать:}
@${\vdash \neg \phi(x) \to x = y \to \neg \phi(y)}

Давайте накинем кванторы и поменяем x y местами. Получим после подстановок: @${\vdash \phi(y) \to y = x \to \phi(x)}.

Теперь мы можем поменять местами посылки: @${\vdash y = x \to \phi(y) \to \phi(x)}. 

Сделать разворот справа: @${\vdash y = x \to \neg \phi(x) \to \neg \phi(y)}. 

Сделать разворот слева: @${\vdash x = y \to \neg \phi(x) \to \neg \phi(y)}. 

И поменять местами посылки: @${\vdash  \neg \phi(x) \to x = y \to \neg \phi(y)}. 

@bold{Пусть дано:}

@${\vdash \phi(x) \to x = y \to \phi(y)}

@${\vdash \psi(x) \to x = y \to \psi(y)}

@bold{Надо показать:}
@${\vdash \phi(x) \& \psi(x) \to x = y \to \phi(y) \& \psi(y)}

Берем в гипотезу... первые два. И выводим левую часть.

@larger{Предикаты}

В формальной арифметике один предикат (=) и утверждение по сути сводится к цитированию доказательств перехода под равенством для всех соответствующих функциональных символов и цитированию аксиомы для равенства. 

Это мы делали на прошлых занятиях. 


