#lang racket

;Exercise 2.11.
; In passing, Ben also cryptically comments: "By testing
; the signs of the endpoints of the intervals, it is
; possible to break mul-interval into nine cases, only one
; of which requires more than two multiplications." Rewrite
; this procedure using Ben's suggestion.

(require "exercise-2.07.rkt")

(define (mul-interval a b)
  (let ([a1 (lower-bound a)]
        [a2 (upper-bound a)]
        [b1 (lower-bound b)]
        [b2 (upper-bound b)])
    (cond
      [(and (< a2 0) (< b2 0))
        (make-interval (* a2 b2) (* a1 b1))]
      [(and (< a2 0) (>= b1 0))
        (make-interval (* a2 b1) (* a1 b2))]
      [(and (< a2 0) (< b1 0) (>= b2 0))
        (make-interval (* a1 b2) (* a1 b1))]
      [(and (>= a1 0) (< b2 0))
        (make-interval (* a1 b2) (* a2 b1))]
      [(and (>= a1 0) (>= b1 0))
        (make-interval (* a1 b1) (* a2 b2))]
      [(and (>= a1 0) (< b1 0) (>= b2 0))
        (make-interval (* a2 b1) (* a2 b2))]
      ; a1 < 0 and a2 >= 0 below.
      [(and (< b2 0))
        (make-interval (* a2 b1) (* a1 b1))]
      [(and (>= b1 0))
        (make-interval (* a1 b2) (* a2 b2))]
      ; else a1 < 0 and a2 >= 0 and b1 < 0 and b2 >= 0
      [else
        (let ([l1 (* a1 b2)]
              [l2 (* a2 b1)]
              [u1 (* a1 b1)]
              [u2 (* a2 b2)])
          (make-interval (min l1 l2) (max u1 u2)))]))
