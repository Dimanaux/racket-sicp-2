#lang racket

(require rackunit
         "../main/exercise-2.20.rkt")

; Tests
(check-equal?
  (same-parity 1 2 3 4 5 6 7)
  (list 1 3 5 7))

(check-equal?
  (same-parity 2 3 4 5 6 7)
  (list 2 4 6))
