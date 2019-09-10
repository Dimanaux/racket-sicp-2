#lang racket

(require rackunit
         "../main/exercise-2.17.rkt")

; Tests
(check-equal? (last-pair (list 23 72 149 34)) 34)

(check-equal? (last-pair (list 1)) 1)

(check-exn exn:fail? (lambda () (last-pair null)))
