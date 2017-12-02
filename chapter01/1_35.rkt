#lang sicp
; fix point
(define tol 0.00001)
(define (fix-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tol))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; get golden ratio
(exact->inexact (fix-point (lambda (x) (+ 1 (/ 1 x))) 1))
