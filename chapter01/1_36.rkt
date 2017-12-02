#lang sicp
; fix point with display
(define tol 0.00001)
(define (fix-point-with-display f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tol))
  
  ; display n on stdout
  (define (report counter n)
    (display "(") (display counter) (display ")")
    (display (exact->inexact n))
    (newline))
  ; try guess and appro
  (define (try counter guess)
    (report counter guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          (exact->inexact next)
          (try (inc counter) next))))
  (try 1 first-guess))

(fix-point-with-display (lambda (x) (+ 1 (/ 1 x))) 1)

;; without `average damping`, need 29 iterations
(fix-point-with-display (lambda (x) (/ (log 1000) (log x))) 4)

;; use 'average damping', only 7 iterations!
(define (average x y) (/ (+ x y) 2))
(fix-point-with-display (lambda (x) (average x 
                                             (/ (log 1000)
                                                (log x)))) 4)