#lang racket

; Exercise 2.13.
; Show that under the assumption of small percentage
; tolerances there is a simple formula for the approximate
; percentage tolerance of the product of two intervals in
; terms of the tolerances of the factors. You may simplify
; the problem by assuming that all numbers are positive.

; a = (a1, a2) = (ca * [1 - ta/100], ca * [1 + ta/100])
; b = (b1, b2) = (cb * [1 - tb/100], cb * [1 + tb/100])
; where cX - center of interval X, tX - tolerance
; cX = [X1 + X2] / 2
; tX = [X2 - cX] / cX * 100
; = [X2 - {X1 + X2} / 2] / {[X1 + X2] / 2} * 100
; = [{X2 - X1} / 2] / {[X1 + X2] / 2} * 100
; = [X2 - X1] / [X2 + X1] * 100
; = 100 * [1 - 2 * X1 / {X1 + X2}]
;
; 0 < a1 < a2, 0 < b1 < b2
; ta << ca, tb << cb
; a * b = (a1 * b1, a2 * b2)
; = (ca * [1 - ta/100] * cb * [1 - tb/100],
;    ca * [1 + ta/100] * cb * [1 + tb/100])
; tolerance (a * b) =
; {ca
;    * [1 + ta/100]
;    * cb * [1 + tb/100]
;  - ca
;    * [1 - ta/100]
;    * cb
;    * [1 - tb/100]}
; / {ca
;    * [1 + ta/100]
;    * cb
;    * [1 + tb/100]
;  + ca
;    * [1 - ta/100]
;    * cb * [1 - tb/100]}
; = {[1 + ta/100]*[1 + tb/100] - [1 - ta/100]*[1 - tb/100]}
;  / {[1 + ta/100]*[1 + tb/100] + [1 - ta/100]*[1 - tb/100]}
; = {...} / {1 + ta/100 + tb/100 + ta*tb/10000 +
;             1 - ta/100 - tb/100 + ta*tb/10000}
; = {...} / {2 * [1 + ta*tb/10000]}
; = {1 + ta/100 + tb/100 + ta*tb/10000
;   - 1 + ta/100 + tb/100 - ta*tb/10000} / {...}
; = {2 * [ta/100 + tb/100]} / {2 * [1 + ta*tb/10000]}
; = [ta + tb] / [100 + ta*tb/100]
; since ta << ca and tb << cb -> ta*tb << ca*cb
; so we can drop ta*tb/100 and we get
; tolerance (a * b) ~= tolerance (a) + tolerance(b)
