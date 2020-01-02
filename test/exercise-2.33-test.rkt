#lang racket

(require rackunit
         "../main/exercise-2.33.rkt")

; Tests
(check-equal?
  (accumulate + 0 '(1 2 3))
  6)

(check-equal?
  (map (lambda (x) (* x 2)) '(1 2 3))
  '(2 4 6))

(check-equal?
  (append '(1 2) '(3 4))
  '(1 2 3 4))

(check-equal?
  (length '(1 2 3 4 5))
  5)
