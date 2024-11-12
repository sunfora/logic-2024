#lang scribble/manual
@(require scribble-math)
@(require scribble/base)
@title[
       #:style (with-html5 manual-doc-style)
       #:tag "problem"
       #:version ""
       ]{7.1}

Покажите, что исчисление предикатов не полно в моделях ограниченной конечной мощности. 

А именно, пусть дана модель @${\mathcal{M} = \langle D, F, T, E \rangle}. 

Назовём мощностью модели мощность её предметного множества: @${|\mathcal{M}| = |D|}.

Покажите, что для любой конечной мощности модели @${n\in\mathbb{N}} найдётся такая формула @${\alpha}, что 
при @${|\mathcal{M}|\le n} выполнено @${\llbracket\alpha\rrbracket_\mathcal{M} = \text{И}}, но @${\not\vdash\alpha}.

@section{Решение}

@margin-note{
  Модель должна содержать хоть один предикат размера больше нуля. Иначе у нас исчисление предикатов "деградирует", до исчисления высказываний, а там вопрос размера предметного множества не важен.
}

Пусть у нас есть хоть один предикат @${P}, k-местный. 
Давайте сделаем из него 1-местный @${P_{e_1}(x) := P(x, e_1, \dots, e_1)}.

Теперь возьмём формулу вида:
@$${
  \begin{align*}
    \forall a.      & \quad P_{e_1}(e_1) \leftrightarrow P_{e_1}(a) \\
    \land & \quad P_{e_1}(e_2) \leftrightarrow P_{e_1}(a) \\
    \vdots \\
    \land & \quad P_{e_1}(e_n) \leftrightarrow P_{e_1}(a)
  \end{align*}
}

При любой оценке предиката @${P} утверждение истино. 
Значит в модели формула @${\phi} общезначима.

Но, возьмём любую модель @${\mathcal{M}}, предметное множество которой `шире`.

И зададим оценку @${\llbracket{P(e_i)}\rrbracket_\mathcal{M} = \text{И}}, @${\llbracket{P(a)}\rrbracket_\mathcal{M} = \text{Л}}. 

Значит формула @${\phi} не общезначима в принципе. А значит @${\not \vdash \phi}.
