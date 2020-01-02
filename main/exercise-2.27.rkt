#lang racket

; Exercise 2.27.
; Modify your reverse procedure of exercise 2.18 to produce
; a deep-reverse procedure that takes a list as argument and
; returns as its value the list with its elements reversed
; and with all sublists deep-reversed as well. For example,
; (define x (list (list 1 2) (list 3 4)))
;
; x
; ((1 2) (3 4))
;
; (reverse x)
; ((3 4) (1 2))
;
; (deep-reverse x)
; ((4 3) (2 1))

(provide deep-reverse)

; We added check `if it is a list` for each element of
; the list. If it is we apply deep-reverse to it and
; prepend it to the resulting list.
(define (deep-reverse list)
  (define (iter xs acc)
    (cond
      [(null? xs) acc]
      [(list? (car xs))
          (iter (cdr xs) (cons (deep-reverse (car xs)) acc))]
      [else (iter (cdr xs) (cons (car xs) acc))]))
  (iter list null))
