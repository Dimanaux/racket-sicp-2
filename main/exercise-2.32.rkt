#lang racket

; Exercise 2.32.
; We can represent a set as a list of distinct elements,
; and we can represent the set of all subsets of the set
; as a list of lists. For example, if the set is (1 2 3),
; then the set of all subsets is
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)). Complete
; the following definition of a procedure that generates
; the set of subsets of a set and give a clear
; explanation of why it works:

; (define (subsets s)
;   (if (null? s)
;       (list nil)
;       (let ((rest (subsets (cdr s))))
;         (append rest (map <??> rest)))))

(provide subsets)

(define (subsets s)
  (if (null? s)
      (list null)
      (let ([rest (subsets (cdr s))])
          (append
              rest
              (map
                  (lambda (subset) (cons (car s) subset))
                  rest)))))

; Imagine we have (1 2) as s. We must get (() (1) (2) (1 2))
; as (subsets s). Is s null? No, so (subsets s) =
; (append rest (map ?? rest)), where rest is
; (subsets (cdr s)). We want to subsets work right, so
; rest = (subsets (2)) = (() (2))
; ((2) ()) + (map ?? rest) MUST BE (() (1) (2) (1 2))
; (map ?? rest) MUST BE ((1) (1 2)). So we see that
; it is ^^^ rest subsets with prepended first element of s.

; Lets prove subsets works right.
; (subsets ()) -> (())               OK
; (subsets (1)) -> append (()) (map (prepend 1) (())) ->
;   append (()) ((1)) -> (() (1))    OK
; We see, that our procedure does not change elements of s,
; so if it works for (x1 x2..xN) then it works for
; (y1 y2..yN).
; Suggest subsets works correctly for (y2 y3..yN), so
; subsets of (y1 y2..yN) is all the subsets of (y2 y3..yN)
; themself and with included y1. So rest is correct as we
; suggested. And result is correct, since result is
; rest UNION (map (add y1) rest)
