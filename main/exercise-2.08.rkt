#lang racket

; Exercise 2.8.
; Using reasoning analogous to Alyssa's, describe how the
; difference of two intervals may be computed. Define a
; corresponding subtraction procedure, called sub-interval.

(require "exercise-2.07.rkt")

(provide sub-interval)

; (a, b) - (c, d) = (a - d, b - c)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
