#lang racket

(require rackunit
         "../main/exercise-2.04.rkt")

; Tests
(check-equal? (car (cons 1 2))
              1
              "car (cons 1 2) = 1")

(check-equal? (cdr (cons 1 2))
              2
              "cdr (cons 1 2) = 2")
