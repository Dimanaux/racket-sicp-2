#lang racket

; Exercise 2.40.
; Define a procedure unique-pairs that, given an integer n,
; generates the sequence of pairs (i,j) with
; 1 <= j < i <= n. Use unique-pairs to simplify the
; definition of prime-sum-pairs given above.

(require "exercise-2.33.rkt")

(provide unique-pairs
         flatmap)

(define (enumerate-interval a b)
  (define (iter acc i)
    (if (< i a)
      acc
      (iter (cons i acc) (- i 1))))
  (iter (list) b))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list j i))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               unique-pairs)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond
        ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))
