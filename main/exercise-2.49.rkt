#lang racket

; Exercise 2.49.
; Use segments->painter to define the following primitive painters:
; a. The painter that draws the outline of the designated frame.
; b. The painter that draws an "X" by
;    connecting opposite corners of the frame.
; c. The painter that draws a diamond shape by connecting
;    the midpoints of the sides of the frame.
; d. The wave painter.

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

; The segments are given using coordinates with respect to
; the unit square. For each segment in the list, the painter
; transforms the segment endpoints with the frame coordinate
; map and draws a line between the transformed points.

(requrie
  "exercise-2.48.rkt")

(define (polyline vecs)
  (if (null? (cdr vecs))
    null
    (cons (make-segment (car vec) (cadr vec))
          (polyline (cdr vec)))))

(define (outline frame)
  (segments->painter
    (polyline
      (list
        (make-vect 0 0)
        (make-vect 1 0)
        (make-vect 1 1)
        (make-vect 0 1)
        (make-vect 0 0)))))

(define (cross frame)
  (segments->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 1))
      (make-segment (make-vect 0 1) (make-vect 1 -1)))))

(define (diamond frame)
  (segments->painter
    (let ([t (make-vect 0.5 0)]
          [r (make-vect 1 0.5)]
          [b (make-vect 0.5 1)]
          [l (make-vect 0 0.5)])
      (polyline
        (list t r b l t)))))

(define (wave frame)
  (define v make-vect)
  (segments->painter
    (append
      (polyline
        (list
          (v 0.00 0.15)
          (v 0.15 0.40)
          (v 0.30 0.35)
          (v 0.40 0.35)
          (v 0.35 0.15)
          (v 0.40 0.00)))
      (polyline
        (list
          (v 0.60 0.00)
          (v 0.65 0.15)
          (v 0.60 0.35)
          (v 0.75 0.35)
          (v 1.00 0.65)))
      (polyline
        (list
          (v 1.00 0.85)
          (v 0.60 0.55)
          (v 0.75 1.00)))
      (polyline
        (list
          (v 0.60 1.00)
          (v 0.50 0.70)
          (v 0.40 1.00)))
      (polyline
        (list
          (v 0.25 1.00)
          (v 0.35 0.50)
          (v 0.30 0.40)
          (v 0.15 0.60)
          (v 0.00 0.35))))))
