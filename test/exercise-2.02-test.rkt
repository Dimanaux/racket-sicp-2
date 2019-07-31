#lang racket

(require "../main/exercise-2.02.rkt")

; Tests
; Program should not fail.
; If program fails, solution is wrong.
(define a (make-point 3 4))
(define b (make-point 6 -8))
(define s (make-segment a b))

(print-point (starting-point s))
(print-point b)
(newline)
