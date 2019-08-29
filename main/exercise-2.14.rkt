#lang racket

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Lem complains that Alyssa's program gives different
; answers for the two ways of computing.

; Exercise 2.14.
; Demonstrate that Lem is right. Investigate the behavior of
; the system on a variety of arithmetic expressions. Make
; some intervals A and B, and use them in computing the
; expressions A/A and A/B. You will get the most insight by
; using intervals whose width is a small percentage of the
; center value. Examine the results of the computation in
; center-percent form (see exercise 2.12).

(require "exercise-2.07.rkt"
         "exercise-2.12.rkt")

(define a (make-center-percent 1.5 1))
(define b (make-center-percent   3 2))

;;; > (par1 a b)
;;; '(0.954295081967213 . 1.0476610169491525)
;;; > (center (par1 a b))
;;; 1.0009780494581828
;;; > (percent (par1 a b))
;;; 4.66373538523034

;;; > (par2 a b)
;;; '(0.9866440677966102 . 1.013311475409836)
;;; > (center (par2 a b))
;;; 0.9999777716032231
;;; > (percent (par2 a b))
;;; 1.3334000200059988

; Here we can see that results of equivalent formulas
; calculations is different and par2 is more accurate.

;;; > (div-interval a a)
;;; '(0.9801980198019803 . 1.02020202020202)
;;; > (center (div-interval a a))
;;; 1.0002000200020003
;;; > (percent (div-interval a a))
;;; 1.9998000199979906

;;; > (div-interval b b)
;;; '(0.9607843137254902 . 1.0408163265306123)
;;; > (center (div-interval b b))
;;; 1.0008003201280513
;;; > (percent (div-interval b b))
;;; 3.9984006397441028

;;; > (div-interval a b)
;;; '(0.4852941176470589 . 0.5153061224489796)
;;; > (center (div-interval a b))
;;; 0.5003001200480193
;;; > (percent (div-interval a b))
;;; 2.9994001199759954

;;; > (percent (div-interval (make-center-percent 50 1)
;;;                          (make-center-percent 30 0.4)))
;;; 1.399944002239912

;;; > (percent (div-interval (make-center-percent 360 16)
;;;                          (make-center-percent 120 10)))
;;; 25.59055118110236

;;; > (percent (div-interval (make-center-percent 72 0.045)
;;;                          (make-center-percent 35 0.1)))
;;; 0.14499993475001208

; (percent (div-interval a b)) ~= (+ (percent a) (percent b))
