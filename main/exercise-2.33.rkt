#lang racket

; Exercise 2.33.
; Fill in the missing expressions to complete the following
; definitions of some basic list-manipulation operations as
; accumulations:

; (define (map p sequence)
;   (accumulate (lambda (x y) <??>) nil sequence))
; (define (append seq1 seq2)
;   (accumulate cons <??> <??>))
; (define (length sequence)
;   (accumulate <??> 0 sequence))

(provide accumulate
         map
         append
         length)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate
    (lambda (x y) (cons (p x) y))
    null
    sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (i acc) (+ acc 1)) 0 sequence))
