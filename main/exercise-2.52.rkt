#lang racket

; Exercise 2.52.
; Make changes to the square limit of wave shown in figure
; 2.9 by working at each of the levels described above.
; In particular:
; a. Add some segments to the primitive wave painter of
;    exercise 2.49 (to add a smile, for example).
; b. Change the pattern constructed by corner-split
;    (for example, by using only one copy of the up-split
;    and right-split images instead of two).
; c. Modify the version of square-limit that uses
;    square-of-four so as to assemble the corners in a
;    different pattern. (For example, you might make the big
;    Mr. Rogers look outward from each corner of the square.)

(provide
  wave
  corner-split
  square-of-four)

; a.
(define (wave frame)
  (define v make-vect)
  (segments->painter
    (append
      (polyline (list (v 0 0.15) (v 0.15 0.4) (v 0.3 0.35)
                      (v 0.4 0.35) (v 0.35 0.15) (v 0.4 0)))
      (polyline (list (v 0.6 0) (v 0.65 0.15) (v 0.6 0.35)
                      (v 0.75 0.35) (v 1 0.65)))
      (polyline (list (v 1 0.85) (v 0.6 0.55) (v 0.75 1)))
      (polyline (list (v 0.6 1) (v 0.5 0.7) (v 0.4 1)))
      (polyline (list (v 0.25 1) (v 0.35 0.5) (v 0.3 0.4)
                      (v 0.15 0.6) (v 0 0.35)))
      (polyline (list (v 0.45 0.15) (v 0.45 0.2))) ; left eye
      (polyline (list (v 0.55 0.15) (v 0.55 0.2))) ; right eye
      (polyline (list (v 0.4 0.2) (v 0.5 0.25) (v 0.6 0.2)))))) ; smile

; b.
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ([up (up-split painter (- n 1)])
            [right (right-split painter (- n 1))]
            [smaller (corner-split painter (n - 1))])
        (square-of-four up smaller painter right))))

; c.
(define (square-limit painter n)
  (let
    ([combine4
      (square-of-four identity flip-horiz flip-vert rotate180)])
    (combine4 (corner-split painter n))))
