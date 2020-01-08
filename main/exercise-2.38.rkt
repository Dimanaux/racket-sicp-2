#lang racket

; Exercise 2.38.
; The accumulate procedure is also known as fold-right,
; because it combines the first element of the sequence
; with the result of combining all the elements to the
; right. There is also a fold-left, which is similar to
; fold-right, except that it combines elements working
; in the opposite direction:

; (define (fold-left op initial sequence)
;   (define (iter result rest)
;     (if (null? rest)
;         result
;         (iter (op result (car rest))
;               (cdr rest))))
;   (iter initial sequence))

; What are the values of
; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))
; (fold-right list nil (list 1 2 3))
; (fold-left list nil (list 1 2 3))

; Give a property that op should satisfy to guarantee that
; fold-right and fold-left will produce the same values for
; any sequence.

(provide fold-left fold-right)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; What are the values of
; > (fold-right / 1 (list 1 2 3))
;;; (fr / 1 '(1 2 3)) =
;;; (/ 1 (fr / 1 '(2 3))) =
;;; (/ 1 (/ 2 (fr / 1 '(3)))) =
;;; (/ 1 (/ 2 (/ 3 (fr / 1 '())))) =
;;; (/ 1 (/ 2 (/ 3 1))) ; see this line
;;; = (/ 1 (/ 2 3)) = (/ 1 2/3) = 3/2
; 3/2
; (fold-left / 1 (list 1 2 3))
;;; (fl / 1 '(1 2 3)) =
;;; (i 1 '(1 2 3)) =
;;; (i (/ 1 1) '(2 3)) =
;;; (i (/ (/ 1 1) 2) '(3)) =
;;; (i (/ (/ (/ 1 1) 2) 3) '()) =
;;; (/ (/ (/ 1 1) 2) 3) ; see this line
;;; (/ (/ 1 2) 3) = (/ 1/2 3) = 1/6
; 1/6
; (fold-right list nil (list 1 2 3))
;;; (fr list '() '(1 2 3)) =
;;; (list 1 (fr list '() '(2 3))) =
;;; (list 1 (list 2 (fr list '() '(3)))) =
;;; (list 1 (list 2 (list 3 (fr list '() '())))) =
;;; (list 1 (list 2 (list 3 '())))
;;; = '(1 (2 (3 ())))
; (fold-left list nil (list 1 2 3))
;;; (fl list '() '(1 2 3)) =
;;; (i '() '(1 2 3)) =
;;; (i (list '() 1) '(2 3)) =
;;; (i (list (list '() 1) 2) '(3)) =
;;; (i (list (list (list '() 1) 2) 3) '()) =
;;; (list (list (list '() 1) 2) 3)
;;; = '(((() 1) 2) 3)

; Give a property that op should satisfy to guarantee that
; fold-right and fold-left will produce the same values for
; any sequence.

; So fold-right is (op 1 (op 2 ...(op N init)...))
; fold-left is ...(op (op (op init 1) 2) 3)...
; Operation op must be associative, since fold-right and
; fold-left has different braces order and results are
; different if op is not associative.
; But also op must be commutative because we see that
; fold-right applies op to the last element of the list and
; the initial value and fold-left applies it to the initial
; value and the first elemnt of the list.
; Let's see that string concatenation has assotiative
; property but hasn't commutative one. ("a" * "b") * "c" ===
; "a" * ("b" * "c") === "abc" BUT "a" * "b" /= "b" * "a".
; and results for fold-right and fold-left:
; > (fold-right string-append "0" '("1" "2" "3"))
; "1230"
; > (fold-left string-append "0" '("1" "2" "3"))
; "0123"
; Indeed, we see that they produces different results.
