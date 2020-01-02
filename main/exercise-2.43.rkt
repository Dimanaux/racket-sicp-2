#lang racket

; Exercise 2.43.
; Louis Reasoner is having a terrible time doing exercise
; 2.42. His queens procedure seems to work, but it runs
; extremely slowly. (Louis never does manage to wait long
; enough for it to solve even the 6x6 case.) When Louis
; asks Eva Lu Ator for help, she points out that he has
; interchanged the order of the nested mappings in the
; flatmap, writing it as

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

; Explain why this interchange makes the program run slowly.
; Estimate how long it will take Louis's program to solve
; the eight-queens puzzle, assuming that the program in
; exercise 2.42 solves the puzzle in time T.

; Compare to 2.42
; (flatmap
;   (lambda (rest-of-queens)
;     (map (lambda (new-row)
;             (adjoin-position new-row k rest-of-queens))
;           (enumerate-interval 1 board-size)))
;   (queen-cols (- k 1)))
; Louis' version calls queen-cols procedure for each
; column of the board. QC 8 calls (QC 7) 8 times, QC 7 calls
; (QC 6) 7 times and so on. Each call also produces safe?
; procedure call that may give us exponential growth of
; complexity.
