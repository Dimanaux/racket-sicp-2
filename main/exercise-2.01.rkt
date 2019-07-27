#lang racket

; Exercise 2.1.
; Define a better version of make-rat that handles both
; positive and negative arguments. Make-rat should normalize
; the sign so that if the rational number is positive, both
; the numerator and denominator are positive, and if the
; rational number is negative, only the numerator is
; negative.

(provide make-rat
         numer
         denom)

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (if (>= d 0)
      (let ([g (gcd n d)])
        (cons (/ n g) (/ d g)))
      (make-rat (- n) (- d))))
