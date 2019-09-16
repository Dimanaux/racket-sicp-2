#lang racket

(require rackunit
         "../main/exercise-2.19.rkt")

; Tests
(check-equal? (cc 100 us-coins) 292 "292 ways to exchange $1")

(check-equal? (cc 10 us-coins) 4 "4 ways to exchange $0.1")

(check-equal? (cc 1 uk-coins) 2 "2 ways to exchange £0.01")

(check-equal? (cc 2 uk-coins) 4 "4 ways to exchange £0.02")

(check-equal? (cc 5 uk-coins) 13 "13 ways to exchange £0.05")
