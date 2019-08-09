#lang racket

(require rackunit
         "../main/exercise-2.05.rkt")

; Tests
(check-equal? (car (cons 3 4))
              3
              "car (cons 3 4) = 3")

(check-equal? (cdr (cons 3 4))
              4
              "cdr (cons 3 4) = 4")
