#lang racket

; Exercise 2.10.
; Ben Bitdiddle, an expert systems programmer, looks over
; Alyssa's shoulder and comments that it is not clear what
; it means to divide by an interval that spans zero. Modify
; Alyssa's code to check for this condition and to signal
; an error if it occurs.

(require "exercise-2.07.rkt")

(provide div-interval)

(define (spans? number interval)
  (<= (lower-bound interval) number (upper-bound interval)))

(define (div-interval x y)
  (if (spans? 0 y)
      (make-exn:fail:contract:divide-by-zero
        "Interval-divisor must not span zero!")
      (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))
