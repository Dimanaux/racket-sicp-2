#lang racket

(require rackunit
         "../main/exercise-2.12.rkt")

; Tests
(define epsilon 1e-6)

(check-=
  (width (make-center-percent 5 1))
  0.05
  epsilon)

(check-=
  (percent (make-center-width 10 2))
  20
  epsilon)
