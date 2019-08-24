#lang racket

(require rackunit
         "../main/exercise-2.10.rkt")
(require (prefix-in std: "../main/exercise-2.07.rkt"))


(define a (std:make-interval -1 -0.5))
(define b (std:make-interval 2 3))
(define c (std:make-interval -1 1))
(define d (std:make-interval 0 1))

; Tests
(check-exn
  exn:fail?
  (lambda () (div-interval a c)))

(check-not-exn
  (lambda () (div-interval a b)))

(check-not-exn
  (lambda () (div-interval c a)))

(check-exn
  exn:fail?
  (lambda () (div-interval b d)))

(check-exn
  exn:fail?
  (lambda () (div-interval d d)))
