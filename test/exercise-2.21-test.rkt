#lang racket

(require rackunit
         "../main/exercise-2.21.rkt")

; (square-list (list 1 2 3 4))
; (1 4 9 16)

; Tests
(check-equal?
  (square-list (list 1 2 3))
  (list 1 4 9))


(check-equal?
  (square-list null)
  null)
