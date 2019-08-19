#lang racket

(require rackunit
         "../main/exercise-2.07.rkt")

(define e 0.000001)

; Tests
(define a (make-interval 1.0 2.0))

(check-= (lower-bound a) 1.0 e "lower-bound (1, 2)")
(check-= (upper-bound a) 2.0 e "upper-bound (1, 2)")


(define b (make-interval 3.1 3.4))

(define sum (add-interval a b))

(check-= (lower-bound sum)
         4.1
         e
         "lower-bound (1 2) + (3.1 3.4)")
(check-= (upper-bound sum)
         5.4
         e
         "upper-bound (1 2) + (3.1 3.4)")


(define product (mul-interval a b))

(check-= (lower-bound product)
         3.1
         e
         "lower-bound (1 2) * (3.1 3.4)")
(check-= (upper-bound product)
         6.8
         e
         "upper-bound (1 2) * (3.1 3.4)")


(define quotient (div-interval a b))

(check-= (lower-bound quotient)
         0.294117647
         e
         "lower-bound (1 2) / (3.1 3.4)")
(check-= (upper-bound quotient)
         0.64516129
         e
         "upper-bound (1 2) / (3.1 3.4)")
