#lang racket

(require rackunit
         "../main/exercise-2.30.rkt")

; Tests
(define (test f)
  (check-equal? (f null) null)
  (check-equal? (f (list 1)) (list 1))
  (check-equal? (f (list 1 2 3)) (list 1 4 9))
  (check-equal?
    (f (list (list 1 2) 3 (list 4 5 6)))
    (list (list 1 4) 9 (list 16 25 36))))

(test square-tree)
(test square-tree-map)
