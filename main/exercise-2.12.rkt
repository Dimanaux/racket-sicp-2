#lang racket

(require "exercise-2.07.rkt")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; Exercise 2.12.
; Define a constructor make-center-percent that takes a
; center and a percentage tolerance and produces the
; desired interval. You must also define a selector percent
; that produces the percentage tolerance for a given
; interval. The center selector is the same as the one
; shown above.

(provide make-center-percent
         percent
         make-center-width
         center
         width)

(define (make-center-percent x percent)
  (make-center-width x (* x percent 0.01)))

(define (percent i)
  (let ([lb (lower-bound i)]
        [ub (upper-bound i)])
    (/ (* 100 (- ub lb)) (+ ub lb))))
