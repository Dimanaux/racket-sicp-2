#lang racket

(require rackunit
         "../main/exercise-2.37.rkt")

; Tests
(define v1 '(1 2 3))
(define v2 '(4 5 6))

(check-equal?
  (dot-product v1 v2)
  32)

(define a '((0 3 4) (2 5 0) (1 4 1)))
(define b '((1 2) (4 5) (6 9)))

(check-equal?
  (matrix-*-vector a v1)
  '(18 12 12))

(check-equal?
  (matrix-*-matrix a b)
  '((36 51) (22 29) (23 31)))
