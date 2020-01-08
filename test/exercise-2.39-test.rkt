#lang racket

(require rackunit
         "../main/exercise-2.39.rkt")

; Tests
(define (test rev)
  (check-equal?
    (rev '(1 2 3))
    '(3 2 1))
  (check-equal?
    (rev '(8 10 32 4 9 0 -1))
    '(-1 0 9 4 32 10 8))
  (check-equal?
    (rev '(2 1))
    '(1 2))
  (check-equal?
    (rev '())
    '()))

(test reverse-r)
(test reverse-l)
