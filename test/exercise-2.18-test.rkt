#lang racket

(require rackunit
         "../main/exercise-2.18.rkt")

; Tests
(check-equal? (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))

(check-equal? (reverse null) null)

(check-equal? (reverse (list 1)) (list 1))
