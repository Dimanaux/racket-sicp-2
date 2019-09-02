#lang racket

; Exercise 2.15.
; Eva Lu Ator, another user, has also noticed the different
; intervals computed by different but algebraically
; equivalent expressions. She says that a formula to compute
; with intervals using Alyssa's system will produce tighter
; error bounds if it can be written in such a form that no
; variable that represents an uncertain number is repeated.
; Thus, she says, par2 is a "better" program for parallel
; resistances than par1. Is she right? Why?

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; (a1 a2) + (b1 b2) = ([a1 + b1] [a2 + b2])
; tolerance (a1 a2) = 100 * [a2 - a1] / [a2 + a1]
; tolerance (b1 b2) = 100 * [b2 - b1] / [b2 + b1]
; tolerance (a1 a2) + (b1 b2) =
;       100 * [a2 + b2 - a1 - b1]
;           / [a2 + b2 + a1 + b1] =
;       100 * [width a + width b]
;           / [center a + center b]
; Adding interval changes tolerance (error, percent)
; like this.

;;; > (percent a)
;;; 0.9999999999999934
;;; > (percent (div-interval one a))
;;; 0.9999999999999953
;;; > (percent (div-interval one (div-interval one a)))
;;; 1.0000000000000009
; Inverting intervals doesn't (almost) change its error

; Multiplying intervals adds their errors (exercsie 2.13,
; with small errors).

; Dividing intervals adds their errors too (exercise 2.14).

; So we see, that par2 is really better. But it is better
; not because it doesn't repeat its parameters, but because
; it uses less calls of procedures, that increases errors.
