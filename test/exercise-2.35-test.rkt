#lang racket

(require rackunit
         "../main/exercise-2.35.rkt")

; Tests
(check-equal?
  (count-leaves '(()))
  0)

(check-equal?
  (count-leaves '((1) (2 3) ((4 5)) 6))
  6)
