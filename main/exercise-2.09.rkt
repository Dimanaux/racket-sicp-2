#lang racket

; Exercise 2.9.
; The width of an interval is half of the difference between
; its upper and lower bounds. The width is a measure of the
; uncertainty of the number specified by the interval. For
; some arithmetic operations the width of the result of
; combining two intervals is a function only of the widths
; of the argument intervals, whereas for others the width
; of the combination is not a function of the widths of
; the argument intervals. Show that the width of the sum
; (or difference) of two intervals is a function only of
; the widths of the intervals being added (or subtracted).
; Give examples to show that this is not true for
; multiplication or division.

; (a, b) + (c, d) = (a+c, b+d)
; width (a, b) = (b - a) / 2 = w1
; width (c, d) = (d - c) / 2 = w2
; width (a+c, b+d) = (b + d - a - c) / 2 = w1 + w2

; (a, b) - (c, d) = (a - d, b - c)
; width (a, b) = (b - a) / 2 = w1
; width (c, d) = (d - c) / 2 = w2
; width (a - d, b - c) = [(b - c) - (a - d)] / 2
;   = [b - c - a + d] / 2 = [b - a] / 2 + [d - c] / 2
;   = w1 + w2

; (x, x + 1) * (x, x + 1) = (x^2, x^2+2x+1) where x > 1
; width (x, x+1) = 0.5 = w1
; width (x, x+1) = 0.5 = w2
; width (x^2, x^2+2x+1) = [2x + 1] / 2 = w3
; As we can see w1, w2 are constant, but w3 can vary on
; x change. That means w3 depends not only on w1 and w2.

; x > 1
; (x, x + 1) / (x, x + 1) = (x, x + 1) * (1/[x+1], 1/x)
;   = (x/[x+1], [x+1]/x)
; width (x/[x+1], [x+1]/x) = [2x + 1] / [2x(x+1)]
; The same.
