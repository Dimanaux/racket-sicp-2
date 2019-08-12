#lang racket

(require rackunit
         "../main/exercise-2.06.rkt")

(define (inc x) (- x (- 1)))

(define (to-number church-number)
  ((church-number inc) 0))

; Tests
(define (church-equal? actual expected message)
  (check-equal? (to-number actual)
                (to-number expected)
                message))

(church-equal? one
               (add-1 zero)
               "exptected one to be equal to (add-1 zero)")

(church-equal? two
               (add-1 (add-1 zero))
               "exptected two = (add-1 (add-1 zero))")

(church-equal? two
               (add-1 one)
               "exptected two = (add-1 one)")

; Now we can assume that 2 is defined correctly.
(church-equal? (+ one two)
               (add-1 two)
               "(+ one two) is three")

(check-equal? (to-number (+ one two))
              3
              "(+ one two) is three")

(church-equal? (+ two two)
               (add-1 (add-1 two))
               "2 + 2 is 4")
