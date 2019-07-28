#lang racket

(require rackunit
         "../main/exercise-2.01.rkt")

; Tests
(define a (make-rat 3 6))

(check-equal? (numer a) 1 "numer 3/6 (1/2) = 1")
(check-equal? (denom a) 2 "denom 3/6 (1/2) = 2")

(define b (make-rat 24 -30))

(check-equal? (numer b) -4 "numer 24/-30 (-4/5) = -4")
(check-equal? (denom b) 5  "denom 24/-30 (-4/5) = 5")
