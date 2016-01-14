#lang racket

(require "edsl.rkt")
(require "compiler.rkt")
(require "loader.rkt")

(define (irdump path)
  (let*-values ([(gen) (load-frep path)]
                [(r ss) (generate-statements (call-with-edsl-root gen))])
    (for ([s (in-list ss)])
      (pretty-write s)
      (newline))
    (printf "Result in: ~a~n" r)))

(command-line
  #:program "irdump"
  #:args (path)
  (irdump path))