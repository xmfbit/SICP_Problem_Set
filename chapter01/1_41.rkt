#lang sicp
;;; crazy Double!
; double(f(x)) => g, where g(x) = f(f(x))

(define (double f)
 (lambda (x) (f (f x))))

; should be 21
(((double (double double)) inc) 5)

; should be (2^2)^2=16
((double (lambda (x) (* x x))) 2)