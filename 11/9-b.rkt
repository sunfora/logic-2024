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
       ]{11.9(b)}

Rev

@section{Решение}

@verbatim{
  Sum = \a.\b. \f.\x. a f (b f x)
  
  x :: a
  f :: a -> a
  b :: (a -> a) -> a -> a
  
  b f :: a -> a
  b f x :: a

  a :: (a -> a) -> a -> a
  a f :: a -> a
  a f (b f x) :: a
  
  \x. a f (b f x) :: a -> a
  \f.\x. a f (b f x) :: (a -> a) -> a -> a
  

  \b. \f.\x. a f (b f x) :: ((a -> a) -> a -> a) -> (a -> a) -> a -> a
  \a.\b. \f.\x. a f (b f x) :: ((a -> a) -> a -> a) 
                            -> ((a -> a) -> a -> a) 
                            -> (a -> a) -> a -> a
}

