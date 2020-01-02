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

(define (reverse-r sequence)
  (fold-right
    (lambda (x y) (append x (list y)))
    null
    sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))
