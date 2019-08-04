#lang racket

; Exercise 2.3.
; Implement a representation for rectangles in a plane.
; (Hint: You may want to make use of exercise 2.2.) In terms
; of your constructors and selectors, create procedures that
; compute the perimeter and the area of a given rectangle.
; Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction
; barriers, so that the same perimeter and area procedures
; will work using either representation?

(require "exercise-2.02.rkt")

; a, b - points in opposite angles (corners) of rectangle
; with sides parallel to coordinate axes.
(define (make-rect a b)
  (cons a b))

(define (first-point-rect rect)
  (car rect))

(define (second-point-rect rect)
  (cdr rect))

(define (rect-length rect)
  (abs (-
         (x-point (first-point-rect  rect))
         (x-point (second-point-rect rect)))))

(define (rect-width rect)
  (abs (-
         (y-point (first-point-rect  rect))
         (y-point (second-point-rect rect)))))

(define (area rect)
  (* (rect-length rect) (rect-width rect)))

(define (perimeter rect)
  (* (+ (rect-length rect) (rect-width rect)) 2))

; To implement rectangle in another way, we should also
; define procedures: rect-length, rect-width.
; Barriers we defined:
;  --- Programs that use rectangles ---
;      Rectangles in problem domain
;  ------- area, perimeter, ... -------
;  Rectangles as points or segments or
;    maybe others simpler structures
;  ----- cons, x-point, y-point...-----

; -------------------------------------

; Other possible implementations based on two adjacent
; sides (edges) of rectangle. It is much more complex
; than the first one.

;;; ; Make rectangle of two segments as its sides (edges).
;;; (define (make-rect s1 s2)
;;;   (cond
;;;     [(not (perpendicular? s1 s2))
;;;       (raise "Rectangle angles must be right!")]
;;;     [(not (chained? s1 s2))
;;;       (raise "Segments must have one common endline!")]
;;;     [else (cons s1 s2)]))

;;; (define (a-side rect) (car rect))
;;; (define (b-side rect) (cdr rect))

;;; (define (area rect)
;;;   (* (segment-length (a-side rect))
;;;      (segment-length (b-side rect))))

;;; (define (perimeter rect)
;;;   (* 2
;;;      (+ (segment-length (a-side rect))
;;;         (segment-length (b-side rect)))))

;;; ; Segment procedures.
;;; (define (segment-length seg)
;;;   (vector-length (make-vector seg)))

;;; ; Tells us if 2 segments belong to 2 perpendicular lines.
;;; ; Calculation is based on scalar (dot) product of vectors.
;;; ; Scalar product equals to 0 when cosine of angle between
;;; ; two vectors is 0 too.
;;; (define (perpendicular? s1 s2)
;;;   (let ([v1 (make-vector s1)]
;;;         [v2 (make-vector s2)])
;;;     (= (scalar-* v1 v2) 0))

;;; (define (chained? s1 s2)
;;;   (or (point-equal? (starting-point s1) (starting-point s2))
;;;       (point-equal? (starting-point s1) (ending-point s2))
;;;       (point-equal? (ending-point s1) (starting-point s2))
;;;       (point-equal? (ending-point s1) (ending-point s2))))


;;; ; Additional point procedure.
;;; (define (point-equal? p1 p2)
;;;   (and (= (x-point p1) (x-point p2))
;;;        (= (y-point p1) (y-point p2))))


;;; ; Vector procedures.
;;; ; Make vector of segment.
;;; (define (make-vector segment)
;;;   (let ([a (starting-point seg)]
;;;         [b (ending-point seg)])
;;;   (let ([x1 (x-point a)]
;;;         [y1 (y-point a)]
;;;         [x2 (x-point b)]
;;;         [y2 (y-point b)])
;;;   (cons (- x2 x1) (- y2 y1)))))

;;; (define (x-vector v) (car v))
;;; (define (y-vector v) (cdr v))

;;; (define (scalar-* v1 v2)
;;;   (let ([x1 (x-vector v1)]
;;;         [y1 (y-vector v1)]
;;;         [x2 (x-vector v2)]
;;;         [y2 (y-vector v2)])
;;;     (+ (* x1 x2) (* y1 y2))))

;;; (define (vector-length v)
;;;   (sqrt (sqr (x-vector v))
;;;         (sqr (y-vector v))))
