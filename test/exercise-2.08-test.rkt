#lang racket

(require rackunit
         "../main/exercise-2.07.rkt"
         "../main/exercise-2.08.rkt")

(define e 0.000001)

; Tests
(define a (make-interval 3.7 3.8))
(define b (make-interval 3.2 4.4))

(define difference (sub-interval b a))

(check-= (lower-bound difference)
         -0.6
         e
         "lower-bound (3.2 4.4) - (3.7 3.8)")
(check-= (upper-bound difference)
         0.7
         e
         "upper-bound (3.2 4.4) - (3.7 3.8)")
