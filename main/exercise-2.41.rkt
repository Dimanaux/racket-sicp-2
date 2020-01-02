#lang racket

; Exercise 2.41.
; Write a procedure to find all ordered triples of distinct
; positive integers i, j, and k less than or equal to a
; given integer n that sum to a given integer s.

(require "exercise-2.40.rkt")

(provide triples-with-sum
         triples)

(define (enumerate-interval a b)
  (define (iter acc i)
    (if (= i a)
      (cons a acc)
      (iter (cons i acc) (- i 1))))
  (iter (list) b))

(define (triples-with-sum n s)
  (filter
    (lambda (t) (= (sum t) s))
    (triples n)))

(define (triples n)
  (flatmap
    (lambda (i) (map (lambda (p) (append p (list i))) (unique-pairs (- i 1))))
    (enumerate-interval 3 n)))

(define (sum xs) (foldr + 0 xs))
