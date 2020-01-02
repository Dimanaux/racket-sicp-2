#lang racket

(require rackunit
         "../main/exercise-2.40.rkt")

(define (list<? l1 l2)
  (let ([h1 (car l1)]
        [h2 (car l2)])
    (cond
      [(null? h1) true]
      [(null? h2) false]
      [(< h1 h2) true]
      [(> h1 h2) false]
      [else (list<? (cdr l1) (cdr l2))])))

; Tests
(check-equal?
  (flatmap list '(1 2 3))
  '(1 2 3))

(check-equal?
  (flatmap (lambda (x) x) '((1 2) (3) (4 5)))
  '(1 2 3 4 5))

(check-equal?
  (sort (unique-pairs 4) list<?)
  '((1 2) (1 3) (1 4) (2 3) (2 4) (3 4)))
