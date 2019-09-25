#lang racket

; Exercise 2.22.
; Louis Reasoner tries to rewrite the first square-list
; procedure of exercise 2.21 so that it evolves an iterative
; process:

; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things)
;               (cons (square (car things))
;                     answer))))
;   (iter items nil))

; Unfortunately, defining square-list this way produces the
; answer list in the reverse order of the one desired. Why?

; Louis then tries to fix his bug by interchanging the
; arguments to cons:

; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things)
;               (cons answer
;                     (square (car things))))))
;   (iter items nil))

; This doesn't work either. Explain.

; Unfortunately, defining square-list this way produces the
; answer list in the reverse order of the one desired. Why?
; It reverses order because answer changing like this:
; answer -> (x^2, answer)
; I. e. each element of things is being inserted to the head
; of answer, moving the rest elements to the end of list.
; But the rest elements comes first in original list.
; step | answer  | things 
; 0    | nil     | (1 2 3)
; 1    | (1)     | (2 3)
; 2    | (4 1)   | (3)
; 3    | (9 4 1) | nil

; Louis then tries to fix his bug by interchanging the
; arguments to cons. This doesn't work either. Explain.
; Now answer changes like this: answer -> (cons answer x)
; List has type of pair (produced by cons) where first
; element is an element of list and the second is a pair.
; list is a;
; where a is pair (1, b)
; where b is pair (2, c)
; where c is pair (3, nil).
; But this version does not produce a list.
; It produces pair with first element as a pair.
