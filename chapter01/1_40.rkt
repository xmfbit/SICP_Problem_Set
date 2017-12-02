#lang sicp
;;; use newton-method to solve equation:
;;; x^3 + ax^2 + bx + c = 0
(define (display-newline)
 (display "=========")
 (newline))
;; first, let's build derivate of some function g
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

; test for (deriv g),
; D(x^2)|x=1 = 2
(display "1. Test for Dg, D(x^2)=2 when x=1")
(newline)
((deriv (lambda (x) (* x x))) 1)

(display-newline)

;; second, newton-transform
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

; test for newton-transform
(display "2. Test for newton trans, NT(x^2)=0.5 when x=1")
(newline)
((newton-transform (lambda (x) (* x x))) 1)

(display-newline)

;; third, fix-point
; copied from 1_35.rkt
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

;; forth, fix-point for newton method
(define (newton-method g guess)
  (fix-point (newton-transform g) guess))

; test for newton method 
(display "4. Test for newton method for x^2=0, should get 0")
(newline)
(newton-method (lambda (x) (* x x)) 1.0)

;; five, create a solver for the equations
(define (cubic a b c)
  (lambda (x) (+ c
                 (* x
                    (+ b
                       (* x
                          (+ x a)))))))

(define (newton-equation-solver a b c)
  (newton-method (cubic a b c) 1))

; five, Test solver for a=b=0, c=-1
(display "5. Test for solver for cubic equation, when a=b=0, c=-1, should get 1")
(newline)
(newton-equation-solver 0 0 -1)

(display-newline)

(display "6. Test for solver for cubic equation, when a=b=0, c=-8, should get 2")
(newline)
(newton-equation-solver 0 0 -8)