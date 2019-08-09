#lang racket

; Exercise 2.5.
; Show that we can represent pairs of nonnegative integers
; using only numbers and arithmetic operations if we
; represent the pair a and b as the integer that is the
; product 2^a * 3^b. Give the corresponding definitions
; of the procedures cons, car, and cdr.

(provide cons
         car
         cdr)

; assume (expt a b) is a^b

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

; works only if number, base and result are integer numbers
(define (simple-log number base)
  (define (iter x acc)
    (if (= (remainder x base) 0)
        (iter (/ x base) (+ acc 1))
        acc))
  (iter number 0))

(define (car z)
  (simple-log z 2))

(define (cdr z)
  (simple-log z 3))
