#lang racket

(require rackunit
         "../main/exercise-2.28.rkt")

; Tests
(define x (list (list 1 2) (list 3 4)))

(check-equal?
  (fringe x)
  (list 1 2 3 4)
  (string-append "fringe " (~s x)))

(check-equal?
  (fringe (list x x))
  (list 1 2 3 4 1 2 3 4)
  (string-append "fringe " (~s (list x x))))

(check-equal?
  (fringe (list 1 2 3 4 5))
  (list 1 2 3 4 5)
  "fringe a flat list")
