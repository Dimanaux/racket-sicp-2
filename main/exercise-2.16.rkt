#lang racket

; Exercise 2.16.
; Explain, in general, why equivalent algebraic expressions
; may lead to different answers. Can you devise an
; interval-arithmetic package that does not have this
; shortcoming, or is this task impossible? (Warning:
; This problem is very difficult.)

; Different but equivalent formulas lead to different
; answers (in constrast to usual numbers), because intervals
; algebra doesn't meet regular algebra laws, e. g.
; for intervals a, b equations
;   a/a = [a/a]/[a/a]
;   1/a = a * a / a
; are NOT actual (valid, real, relevant).

; We can design package that pospones all the calculations
; of intervals operations and run them only when they
; will to be printed. We can create strict rules how to
; reduce postponed calculations to produce the most accurate
; answer. These rules must reduce equivalent formulas to
; the same calculations.
