#lang racket

; Exercise 2.45.
; Right-split and up-split can be expressed as instances of
; a general splitting operation. Define a procedure split
; with the property that evaluating

(define right-split (split beside below))
(define up-split (split below beside))

; produces procedures right-split and up-split with the
; same behaviors as the ones already defined.

; (define (right-split painter n)
;   (if (= n 0)
;       painter
;       (let ([smaller (right-split painter (- n 1))])
;         (beside painter (below smaller smaller)))))

(define (split p1 p2)
  (define (splitter painter n)
    (if (= n 0)
        painter
        (let ([smaller (splitter painter (- n 1))])
          (p1 painter (p2 smaller smaller)))))
  splitter)
