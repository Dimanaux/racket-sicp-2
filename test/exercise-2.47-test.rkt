#lang racket

(require
  rackunit
  "../main/exercise-2.47.rkt")

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
  (triples-with-sum 4 6)
  '((1 2 3)))

(check-equal?
  (sort (triples-with-sum 5 8) list<?)
  '((1 2 5) (1 3 4)))

(check-equal?
  (sort (triples-with-sum 10 10) list<?)
  '((1 2 7) (1 3 6) (1 4 5) (2 3 5)))
