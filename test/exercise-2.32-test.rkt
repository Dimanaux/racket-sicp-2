#lang racket

(require rackunit
         "../main/exercise-2.32.rkt")

; Tests
(check-equal?
  (subsets '())
  '(()))

(check-equal?
  (subsets '(1))
  '(() (1)))

(check-equal?
  (subsets '(1 2 3))
  '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)))
