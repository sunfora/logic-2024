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
       ]{7.7(c)}

@(define (forall x body) 
   @${\forall {@x}.\hskip 0.5em {@body}})

Докажите что @${@forall{a @${a \cdot  0 = 0 \cdot a}}} в аксиоматике Пеано.


@margin-note{
  В целом это задание — часть другого. 
  
  Поэтому я подушнил и достаточно формально расписал.
  
}

@(define (autoindex . lst)
   (define (iter i rst)
     [if (null? rst)
       rst
       (cons 
         (cons (number->string i) (car rst)) 
         (iter (+ 1 i) (cdr rst)))])
   (iter 1 lst))

@section{База}

@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      \vdash {a = a}
    } 
    "(Лекция 7)"
  )
  (list 
    @${
      \vdash @forall{a @${a = a}}
    } 
    "(Навешиваем квантор в стиле лекции)"
  )
  (list 
    @${
      \vdash (@forall{a @${a = a}}) \rightarrow 0\cdot0 = 0\cdot0
    } 
    "(Схема аксиом 12)"
  )
  (list 
    @${
      \vdash 0\cdot0 = 0\cdot0
    } 
    "(M.P. 2, 3)"
  )
)]

@section{Переход}

Дабы не совсем захламлять доказательство, буду везде, где обращаюсь к аксиомам или утверждениям, в стиле (A7), писать звёздочку (A7)*. 

Имея в виду, что я сначала набросил квантор, потом в него подставил.

Ну условно говоря:

@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      \vdash {x \cdot 0 = 0}
    } 
    "(A7)*"
  )
)]

Должно читаться как:
@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      \vdash {a \cdot 0 = 0}
    } 
    "(A7)"
  )
  (list 
    @${
      \vdash {a \cdot 0 = 0} \rightarrow T \rightarrow {a \cdot 0 = 0}
    } 
    "(Схема аксиом 1)"
  )
  (list 
    @${
      \vdash T \rightarrow {a \cdot 0 = 0}
    } 
    "(M.P.)"
  )
  (list 
    @${
      \vdash T \rightarrow @forall{a @${a \cdot 0 = 0}}
    } 
    "(Введение квантора)"
  )
  (list 
    @${
      \vdash @forall{a @${a \cdot 0 = 0}}
    } 
    "(M.P.)"
  )
  (list 
    @${
      \vdash (@forall{a @${a \cdot 0 = 0}}) \rightarrow x \cdot 0 = 0
    } 
    "(Схема аксиом 12)"
  )
  (list 
    @${
      \vdash x \cdot 0 = 0
    } 
    "(M.P.)"
  )
)]

Либо если я ссылаюсь на исходное утверждение уже под квантором, то я просто делаю подстановку имплицитно.

Ну поехали, надо доказать @${a' \cdot 0 = 0 \cdot a'} исходя из гипотезы @${a \cdot 0 = 0 \cdot a}.

@(define hyp
   @${a \cdot 0 = 0 \cdot a})

@tabular[#:sep @hspace[4] (autoindex 
  (list 
    @${
      \vdash {a' \cdot 0 = 0}
    } 
    "" "(A7)*"
  )
  (list 
    @${
      \vdash {0 \cdot a' = 0 \cdot a + 0}
    } 
    "" "(A8)*"
  )
  (list 
    @${
      \vdash {0 \cdot a + 0 = 0 \cdot a'}
    } 
    "2" "(7.4(b))*"
  )
  (list 
    @${
      \vdash {0 \cdot a + 0 = 0 \cdot a}
    } 
    "" "(A5)*"
  )
  (list 
    @${
      \vdash 
      {0 \cdot a = 0 \cdot a'}
    } 
    "3, 4" "(A1* + M.P. + M.P.)"
  )
  (list 
    @${
      @hyp \vdash @hyp
    } 
    "" "(Введение гипотезы)"
  )
  (list 
    @${
      @hyp \vdash {a \cdot 0 = 0} 
    } 
    "" "(A7)*"
  )
  (list 
    @${
      @hyp \vdash {0 \cdot a = 0} 
    } 
    "6, 7" "(A1* + M.P. + M.P.)"
  )
  (list 
    @${
      @hyp \vdash {0 \cdot a' = 0} 
    } 
    "5, 8" "(A1* + M.P. + M.P.)"
  )
  (list 
    @${
      @hyp \vdash {0 = 0 \cdot a'} 
    } 
    "9" "(7.4(b))*"
  )
  (list 
    @${
      @hyp \vdash {0 = a' \cdot 0} 
    } 
    "1" "(7.4(b))*"
  )
  (list 
    @${
      @hyp \vdash {a' \cdot 0 = 0 \cdot a'} 
    } 
    "10, 11" "(A1* + M.P. + M.P.)"
  )
  (list 
    @${
      \vdash @hyp \rightarrow {a' \cdot 0 = 0 \cdot a'} 
    } 
    "12" ""
  )
  (list 
    @${
      \vdash @forall{a @${@hyp \rightarrow {a' \cdot 0 = 0 \cdot a'}}} 
    } 
    "13" "навесим квантор"
  )
)]

@section{Финал}

По схеме аксиом индукции получаем

@${\vdash @hyp}

Осталось только набросить квантор.

@${\vdash @forall{a @hyp}}

