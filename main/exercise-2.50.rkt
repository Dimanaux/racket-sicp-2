#lang racket

(require
  "exercise-2.46.rkt")

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
          (make-frame new-origin
                      (sub-vect (m corner1) new-origin)
                      (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)   ; new origin
                     (make-vect 1.0 1.0)   ; new end of edge1
                     (make-vect 0.0 0.0))) ; new end of edge2

; Exercise 2.50.
; Define the transformation flip-horiz, which flips painters
; horizontally, and transformations that rotate painters
; counterclockwise by 180 degrees and 270 degrees.

(provide
  no-transform
  flip-horiz
  rotate180
  rotate270)

(define (no-transform painter)
  (transform-painter painter
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 1.0)))

(define (flip-horiz painter)
  (transform-painter
    painter
    (make-vect 1.0 0.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)))

(define (rotate180 painter)
  (transform-painter
    painter
    (make-vect 1.0 1.0)
    (make-vect 0.0 1.0)
    (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter
    painter
    (make-vect 0.0 1.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)))
