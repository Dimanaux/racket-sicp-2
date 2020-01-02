#lang racket

(require rackunit
         "../main/exercise-2.31.rkt")

(define tree
  (list (list 1 (list 2 3) 4) 5 6))

(define (double x) (* x 2))

; Tests
(check-equal?
  (tree-map double tree)
  (list (list 2 (list 4 6) 8) 10 12))
