#lang racket

; Exercise 2.37.
; Suppose we represent vectors v = (v[i]) as sequences of
; numbers, and matrices m = (m[ij]) as sequences of vectors
; (the rows of the matrix). For example, the matrix
; ┌         ┐
; │ 1 2 3 4 │
; │ 4 5 6 6 │
; │ 6 7 8 9 │
; └         ┘
; is represented as the sequence ((1 2 3 4) (4 5 6 6)
; (6 7 8 9)). With this representation, we can use sequence
; operations to concisely express the basic matrix and
; vector operations. These operations (which are described
; in any book on matrix algebra) are the following:

; (dot-product v w) returns the sum S[i]v[i]w[i]
; (matrix-*-vector m v) returns vector t,
;     where t[i] = S[j]m[ij]v[i]
; (matrix-*-matrix m n) returns matrix p,
;     where p[ij] = S[k]m[ik]n[k]
; (transpose m) returns matrix n, where nij = mji
; where S - sigma

; We can define the dot product as

; (define (dot-product v w)
;   (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following
; procedures for computing the other matrix operations.
; (The procedure accumulate-n is defined in exercise 2.36.)

; (define (matrix-*-vector m v)
;   (map <??> m))
; (define (transpose mat)
;   (accumulate-n <??> <??> mat))
; (define (matrix-*-matrix m n)
;   (let ((cols (transpose n)))
;     (map <??> m)))

(require "exercise-2.36.rkt")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(provide dot-product
         matrix-*-vector
         transpose
         matrix-*-matrix)

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ([cols (transpose n)])
    (map
      (lambda (mi)
        (matrix-*-vector cols mi))
      m)))
