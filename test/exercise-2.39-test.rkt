#lang racket

(require rackunit
         "../main/exercise-2.39.rkt")

; Tests
(define (test rev)
  (check-equal?
    (rev '(1 2 3))
    '(1 2 3))
  (check-equal?
    (rev '())
    '()))

(test reverse-r)
(test reverse-l)
