#lang racket

(require
  "exercise-2.46.rkt"
  "exercise-2.50.rkt")

(define (rotate90 painter)
  (transform-painter
    painter
    (make-vect 1.0 0.0)
    (make-vect 1.0 1.0)
    (make-vect 0.0 0.0)))

(define (rotate270 painter)
  (transform-painter
    painter
    (make-vect 0.0 1.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; Exercise 2.51.
; Define the below operation for painters. Below takes two
; painters as arguments. The resulting painter, given a
; frame, draws with the first painter in the bottom of the
; frame and with the second painter in the top. Define below
; in two different ways -- first by writing a procedure that
; is analogous to the beside procedure given above, and
; again in terms of beside and suitable rotation operations
; (from exercise 2.50).

(define (below painter1 painter2)
  (let
    ( [split-point (make-vect 0.0 0.5)]
      [paint-top
        (transform-painter
          painter1 (make-vect 0.0 0.0)
          (make-vect 1.0 0.0) split-point)]
      [paint-bottom
        (transform-painter
          painter2 split-point
          (make-vect 1.0 0.5) (make-vect 0.0 1.0))])
    (lambda (frame)
      (paint-top frame)
      (paint-bottom frame))))


(define (below-2 painter1 painter2)
  (rotate270
    (beside
      (rotate90 painter1)
      (rotate90 painter2))))
