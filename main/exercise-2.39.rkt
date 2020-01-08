#lang racket

; Exercise 2.39.
; Complete the following definitions of reverse
; (exercise 2.18) in terms of fold-right and fold-left
; from exercise 2.38:

;(define (reverse sequence)
;  (fold-right (lambda (x y) <??>) nil sequence))
;(define (reverse sequence)
;  (fold-left (lambda (x y) <??>) nil sequence))

(require "exercise-2.38.rkt")

(provide
  reverse-r
  reverse-l)

(define (reverse-r sequence)
  (fold-right
    (lambda (x acc) (append acc (list x)))
    null
    sequence))

(define (reverse-l sequence)
  (fold-left
    (lambda (x y) (cons y x))
    null
    sequence))
