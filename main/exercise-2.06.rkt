#lang racket

; Exercise 2.6.
; In case representing pairs as procedures wasn't
; mind-boggling enough, consider that, in a language that
; can manipulate procedures, we can get by without numbers
; (at least insofar as nonnegative integers are concerned)
; by implementing 0 and the operation of adding 1 as

(provide zero
         add-1
         one
         two
         +)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its
; inventor, Alonzo Church, the logician who invented the
; lambda calculus.

; Define one and two directly
; (not in terms of zero and add-1).
; (Hint: Use substitution to evaluate (add-1 zero)).
; Give a direct definition of the addition procedure +
; (not in terms of repeated application of add-1).

; zero is a function that takes a function and returns id.
; id can be defined like this:
;;; (define (id x) x)
; so zero is:
;;; (define (zero f) id)

; one = (add-1 zero)
; ((lambda (f) (lambda (x) (f ((n f) x)))) zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (id x))))
; (lambda (f) (lambda (x) (f x)))
; So
(define one (lambda (f) [lambda (x) (f x)]))
; In other words one is
; (define (one f) (lambda (x) (f x)))
; so one is id. In other words one takes function F and
; returns a function that applies F to its argument.

; two = (add-1 one)
; ((lambda (f) (lambda (x) (f ((n f) x)))) one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (f x))))
(define two (lambda (f) [lambda (x) (f (f x))]))

; two is a function that takes function F and returns
; a function that applies F two times to its argument.
; three -> returns functions that applies its argument 3...

; + takes Church numbers and combines them. If we have
; 3-times-application- and 5-times-application-functions
; as + arguments, so output will be 8-times-application-f.
(define compose
  (lambda (f g)
    [lambda (x) (f (g x))]))

(define +
  (lambda (a b)
    [lambda (f) (compose (a f) (b f))]))
