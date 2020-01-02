#lang racket

(require rackunit
         "../main/exercise-2.27.rkt")

; Tests
(check-equal?
  (deep-reverse (list (list 1 2) (list 3 4)))
  (list (list 4 3) (list 2 1))
  "deep-reverse ((1 2) (3 4))")

(check-equal?
  (deep-reverse (list 1 2 (list 3 4) 5))
  (list 5 (list 4 3) 2 1)
  "deep-reverse (1 2 (3 4) 5)")

(check-equal?
  (deep-reverse null)
  null
  "deep-reverse null")

(check-equal?
  (deep-reverse (list 1 null))
  (list null 1)
  "deep-reverse (1 null)")
