#lang racket

(require rackunit
         "../main/exercise-2.34.rkt")

; Tests
(check-equal?
  (horner-eval 2 (list 1 3 0 5 0 1))
  79)
