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
       ]{11.9(c)}

Mult

@section{Решение}

@verbatim{
  Mult = \a.\b. \f. a (\i. (b f i))
    
  a :: (a -> a) -> a -> a
  b :: (a -> a) -> a -> a
  
  i :: a
  f :: a -> a
  
  b f :: a -> a
  b f i :: a
  \i. (b f i) :: a -> a
  a (\i (b f i)) :: a -> a
  \f . (...) :: (a -> a) -> (a -> a)
  Mult :: (ρ -> ρ -> ρ)
}

На хаскеле это будет вот так выглядеть:
@verbatim{
  type Numeral a = ((a -> a) -> a -> a)
 
  instance Num (Numeral a) where
      (+)         = \a -> \b -> \f -> \x -> a f (b f x)
      (-)         = undefined
      (*)         = \a -> \b -> \f -> a (\i -> b f i)
      negate      = undefined
      fromInteger 0 = \f -> \x -> x
      fromInteger i | i > 0 = \f -> \x -> (fromInteger (i - 1)) f (f x)
      abs         = undefined
      signum      = undefined
  
  instance Show (Numeral Int) where
      show n = show $ n (+ 1) 0

  instance Show (Numeral String) where
      show n = "λf.λx. " <> n (\r -> "(f " <> r <> ")") "x"
}

Ну например
@verbatim{
ghci>  5 :: Numeral String
λf.λx. (f (f (f (f (f x)))))

ghci> 5 * 4 :: Numeral Int
20

ghci> 5 + 3 :: Numeral String
λf.λx. (f (f (f (f (f (f (f (f x))))))))

ghci> :t (+ (5::Numeral a))
(+ (5::Numeral a)) :: Numeral a -> Numeral a
} 
