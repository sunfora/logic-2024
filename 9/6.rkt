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
       ]{9.6}

Рассмотрим определение предела последовательности: @$${\forall \varepsilon > 0.\exists N \in \mathbb{N}.\forall n\in\mathbb{N}. n > N \rightarrow |a_n-l| < \varepsilon}
Раскройте все нелогические предикатные и функциональные символы, переведите эту формулу на язык исчисления предикатов, 
постройте эквивалентную формулу с поверхностными кванторами, проведите её сколемизацию
и постройте эквивалентную систему дизъюнктов.

@section{Решение}
Давайте перестроим на язык исчисления предикатов:
@$${\forall \varepsilon.{\exists N. {\forall n. 
  {       \text{Gt}(\varepsilon, 0) 
    \land \text{Nat}(N) 
    \land \text{Nat}(n)
    \land \text{Gt}(N, n)
   \to {
      \text{Gt}(\varepsilon, \text{Abs}(\text{Sub}(a(n), l)))
  }}}}}

Проведём сколемизацию и переведём всё в КНФ:
@$${
  \begin{align*}
    \forall \varepsilon. \forall n. &              \\
               & \neg \text{Gt}(\varepsilon, 0)    \\
    \lor \quad & \neg \text{Nat}(e(\varepsilon))   \\
    \lor \quad & \neg \text{Nat}(n)                \\
    \lor \quad & \neg \text{Gt}(e(\varepsilon), n) \\
    \lor \quad & {\text{Gt}(\varepsilon, \text{Abs}(\text{Sub}(a(n), l)))}
  \end{align*}
}
