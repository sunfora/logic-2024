#lang scribble/manual
@(require scribble/manual)
@(require scribble-math)
@(require scribble/base)
@(require racket/file)
@(require racket/port)
@(require racket/system)
@(require (only-in net/url 
                   get-pure-port
                   string->url))


@title[
       #:style (with-html5 manual-doc-style)
       #:tag "problem"
       #:version ""
       ]{8.4(c)}

Продемонстируйте что задача нахождения i-го по счёту простого числа примитивна рекурсивна.

@section{Код}

@(verbatim
   (file->string "../8/4c.lisp"))

@section{Примеры}
@verbatim{
* (rec ith-prime (0))
2 
* (rec ith-prime (1))
3
* (rec ith-prime (2))
5
* (rec ith-prime (3))
7
* (rec ith-prime (4))
11
* (rec ith-prime (5)) 
13 
}

@section{Эмулятор}
@(verbatim
   (file->string "../8/recursive.lisp"))

@section{ith-prime после компиляции}
@verbatim{
(S
 (R (S N (S N Z))
  (S
   (S
    (R Z
     (S
      (S (R (U 1 1) (S N (U 3 3)))
       (S (R Z 
             (S (R (U 1 1) (S N (U 3 3))) 
                (U 3 1) 
                (U 3 3))) 
          (U 3 2) (U 3 1))
       (S (R Z 
             (S (R (U 1 1) (S N (U 3 3))) 
                (U 3 1) 
                (U 3 3))) 
          (U 3 3)
        (S (S (R (U 1 1) 
              (S (S (R Z (U 3 2)) 
                    (U 1 1) 
                    (U 1 1)) 
                 (U 3 3))) 
              (S N Z)
          (U 1 1))
         (U 3 1))))
      (S
       (S
        (S
         (S (S (R Z (S (S N Z) (U 3 3))) Z (U 1 1))
          (R Z (S (R (U 1 1) 
                     (S N (U 3 3))) 
                  (U 3 1) (U 3 3))))
         (S (S (S (R (U 1 1) 
                     (S (S (R Z (U 3 2)) 
                           (U 1 1) 
                           (U 1 1)) 
                        (U 3 3))) 
                  (S N Z)
                  (U 1 1))
           (S (R Z (S (S N Z) (U 3 3))) Z (U 1 1)))
          (R (U 1 1) (S (S (R Z (U 3 2)) 
                           (U 1 1) 
                           (U 1 1)) 
                        (U 3 3))))
         (S (S (S (R (U 1 1) 
                     (S (S (R Z (U 3 2)) 
                           (U 1 1) 
                           (U 1 1)) 
                        (U 3 3))) 
                  (S N Z) 
                  (U 1 1))
           (S (R Z (S (S N Z) (U 3 3))) Z (U 1 1)))
          (S (R (U 1 1) 
                (S (S (R Z (U 3 2)) 
                      (U 1 1) 
                      (U 1 1)) 
                   (U 3 3))) 
             (U 2 2)
           (U 2 1))))
        (S N (S N Z))
        (S (R Z
          (S (R (U 1 1) (S N (U 3 3)))
           (S (S (S (R (U 1 1) 
                       (S (S (R Z (U 3 2)) 
                             (U 1 1) 
                             (U 1 1)) 
                          (U 3 3)))
              (S N Z) (U 1 1))
             (S (R Z (S (S N Z) (U 3 3))) Z (U 1 1)))
            (S
             (S (R (U 1 1) 
                   (S (S (R Z (U 3 2)) 
                         (U 1 1) 
                         (U 1 1)) 
                      (U 3 3)))
              (U 2 1)
              (S (R Z 
                    (S (R (U 1 1) 
                          (S N (U 3 3))) 
                       (U 3 1) 
                       (U 3 3))) 
                 (U 2 2)
               (S (R (S Z (U 2 1))
                 (S (R (U 1 1) (S N (U 3 3)))
                  (S
                   (S (S (R Z (S (S N Z) (U 3 3))) Z (U 1 1))
                    (S
                     (R (U 1 1) 
                        (S (S (R Z (U 3 2)) 
                              (U 1 1) 
                              (U 1 1)) 
                           (U 3 3)))
                     (S N (U 2 1)) 
                     (U 2 2)))
                   (U 4 1)
                   (S (R Z (S (R (U 1 1) 
                                 (S N (U 3 3))) 
                              (U 3 1) 
                              (U 3 3)))
                    (U 4 2)
                    (S
                     (R (U 1 1) 
                        (S (S (R Z (U 3 2)) 
                              (U 1 1) 
                              (U 1 1)) 
                           (U 3 3)))
                     (U 4 1) (U 4 3))))
                  (U 4 4)))
                (U 3 1) (U 3 2) (U 3 1))))
             (U 2 1) (S N (U 2 2))))
           (U 3 3)))
         (U 1 1) (U 1 1)))
       (S (R (U 1 1) (S N (U 3 3))) (U 3 1)
        (S (R (U 1 1) (S (S (R Z (U 3 2)) 
                            (U 1 1) 
                            (U 1 1)) 
                         (U 3 3))) 
           (U 3 1)
         (U 3 2))))
      (S (R (U 1 1) (S N (U 3 3))) (U 3 1) 
         (S (R (U 1 1) (S (S (R Z (U 3 2)) 
                             (U 1 1) 
                             (U 1 1)) 
                          (U 3 3))) 
            (U 3 1) (U 3 2)))
      (U 3 3)))
    (U 1 1) (U 1 1))
   (U 3 3)))
 Z (U 1 1))
}
