#lang racket

; Exercise 2.35.
; Redefine count-leaves from section 2.2.2
; as an accumulation:

; (define (count-leaves t)
;   (accumulate <??> <??> (map <??> <??>)))

(require "exercise-2.33.rkt")

(provide count-leaves)

(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (subtree)
        (if (list? subtree)
            (count-leaves subtree)
            1))
      t)))
