#lang racket

; Exercise 2.2.
; Consider the problem of representing line segments in a
; plane. Each segment is represented as a pair of points:
; a starting point and an ending point. Define a constructor
; make-segment and selectors start-segment and end-segment
; that define the representation of segments in terms of
; points. Furthermore, a point can be represented as a pair
; of numbers: the x coordinate and the y coordinate.
; Accordingly, specify a constructor make-point and
; selectors x-point and y-point that define this
; representation. Finally, using your selectors and
; constructors, define a procedure midpoint-segment that
; takes a line segment as argument and returns its midpoint
; (the point whose coordinates are the average of the
; coordinates of the endpoints). To try your procedures,
; you'll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(provide make-point x-point y-point
         make-segment starting-point ending-point
         print-point)

; segment
; a, b - points
(define (make-segment a b)
  (cons a b))

(define (starting-point a)
  (car a))

(define (ending-point a)
  (cdr a))

; point
(define (make-point x y)
    (cons x y))

(define (x-point a)
  (car a))

(define (y-point a)
  (cdr a))

(define (half x) (/ x 2))

; takes segment
(define (midpoint-segment s)
  (let ([a (starting-point s)]
        [b (ending-point s)])
  (let ([x1 (x-point a)]
        [y1 (y-point a)]
        [x2 (x-point b)]
        [y2 (y-point b)])
    (make-segment
      (make-point (half x1) (half y1))
      (make-point (half x2) (half y2))))))
