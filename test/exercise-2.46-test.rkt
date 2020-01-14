#lang racket

(require
  rackunit
  "../main/exercise-2.46.rkt")

(define ax 3)
(define ay -4)
(define a (make-vect ax ay))

(define bx 7)
(define by 5)
(define b (make-vect bx by))

; Tests
(check-equal? (xcor-vect a) ax)
(check-equal? (ycor-vect a) ay)
(check-equal? (xcor-vect b) bx)
(check-equal? (ycor-vect b) by)

(check-equal? (add-vect a b) (make-vect 10 1))
(check-equal? (add-vect b a) (add-vect a b))

(check-equal? (sub-vect a b) (make-vect -4 -9))

(check-equal? (scale-vect a 2) (make-vect 6 -8))

(check-equal? (sub-vect b a) (scale-vect (sub-vect a b) -1))
