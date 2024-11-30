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
       ]{9.4}

@(define (quote-formula f)
   @${\overline{\ulcorner{@f}\urcorner}})

@(define ThS @literal{{Th_\mathcal{S}}})

Покажите, что вопрос о принадлежности формулы @${\alpha(x) = \forall p.\delta(x,p) \rightarrow \neg \sigma(p)} в доказательстве 
теоремы о невыразимости доказуемости к множеству @${@ThS} ведёт к противоречию.

@margin-note{
  В задании немного более общее утверждение дано, потому что в реальности нам надо проверять самоприменение формулы @${\alpha} к себе смотреть, а не саму @${\alpha}. Тем не менее эквивалентность утверждений разобрана ниже.
}

@(define alpha-alpha-unq
  @${\alpha(@quote-formula{\alpha})})

@(define alpha-alpha
  @quote-formula{@alpha-alpha-unq})


@section{принадлежит}

Мы находимся в условиях, что @${@alpha-alpha \in @ThS}.

В силу определения @${@ThS} мы можем теперь сказать что @${\vdash_S @alpha-alpha-unq}.

Снимем квантор внутри @${@alpha-alpha-unq} и подставим туда @${@alpha-alpha}.

Получим выражение вида:

@${\vdash_S \delta(@quote-formula{\alpha}, @alpha-alpha) \to \neg \sigma(@alpha-alpha)}

Так как @${\delta} представимо в S. То получим @${\vdash_S \delta({@quote-formula{\alpha}}, @alpha-alpha)}.

Но тогда мы докажем, что @${\vdash_S \neg \sigma(@alpha-alpha)}.

Из определения @${\sigma} следует что @${@alpha-alpha \not\in @ThS}

@${\bot}

@section{не принадлежит}

Теперь обратно, нам сказано что @${@alpha-alpha \not\in @ThS}.

Чисто по определению мы получим @${\vdash_S \neg\sigma(@alpha-alpha)}

Но теперь мы можем добавить контекста и получить нечто очень похожее на собственно изначальное выражение: @${\delta(
  {@quote-formula{\alpha}}, @alpha-alpha) \to \neg{\sigma(@alpha-alpha)}}.

По лемме о равенстве мы можем подстановку вынести из выражения (как в задании 1):

@${{p = @alpha-alpha} \to \delta(@quote-formula{\alpha}, p) \to \neg\sigma(p)}.

С другой стороны аналогично заданию 1, в силу того что @${\delta} представима, мы имеем:

@${\neg{p = @alpha-alpha} \to \neg \delta(@quote-formula{\alpha}, p)}.

А значит имеем и вот это:

@${\neg{p = @alpha-alpha} \to \sigma(p) \to \neg \delta(@quote-formula{\alpha}, p)}.

А значит по лемме об устранении гипотезы, мы получим:

@${\vdash_S \delta(@quote-formula{\alpha}, p) \to \neg{\sigma(p)}}.

Откуда, набрасывая квантор мы внезапно получаем доказательство самоприменения @${\alpha}.

@${\vdash_S @alpha-alpha-unq}

А значит @${@alpha-alpha \in @ThS}.

@${\bot}

@(define alpha-q
  @${@quote-formula{\alpha}})

@section{причём тут @alpha-q}

Ну в случае если @${@alpha-q \in @ThS}, то очевидно и @${@alpha-alpha \in @ThS}.

В случае @${@alpha-q \not\in @ThS}, в силу пункта 1. @${@alpha-alpha \not\in @ThS}.

Поэтому @${\sigma(@alpha-q) \leftrightarrow \sigma(@alpha-alpha)}.


