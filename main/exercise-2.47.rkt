#lang racket

; Exercise 2.47
; Here are two possible constructors for frames:

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (cons-make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; For each constructor supply the appropriate selectors
; to produce an implementation for frames.

(provide
  make-frame origin-frame edge1-frame edge2-frame
  cons-make-frame cons-origin-frame cons-edge1-frame cons-edge2-frame)

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cadr (cdr frame)))


(define (cons-origin-frame frame)
  (car frame))

(define (cons-edge1-frame frame)
  (cadr frame))

(define (cons-edge2-frame frame)
  (cdr (cdr frame)))
