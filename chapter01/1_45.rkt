#lang sicp

;; average
(define (average x y) 
  (/ (+ x y) 2))

;; average damp
(define (average-damp f)
  (lambda (x) (average x (f x))))

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

;; get fix-point of transform(f)
;; not of original f
(define (fix-point-transform f transform guess)
  (fix-point (transform f) guess))

; repeat transformations n times
(define (repeat f n)
 (if (= n 1)
     f
     (lambda (x) (f ((repeat f (dec n)) x)))))

;; comput log_2(x)
(define (log2 x)
  (/ (log x) (log 2)))

;; solve the equation: y^n == x,
;  starting from the initial value "guess"
(define (nth-root n x guess)
  ; function: f(y) = y^k
  (define (power y k)
    (if (= k 0)
        1
        (* y (power y (dec k)))))
  ; repeat number should be: m = floor(log_2(n))
  (let ((m (floor (log2 n))))
    (fix-point-transform (lambda (y) (/ x (power y (dec n))))
                         (repeat average-damp m)
                         guess)))

;; solver "x^2 = 4"
(nth-root 2 4 1.0)

;; solve "x^4 = 16"
(nth-root 4 16 1.0)

;; solve "x^10 = 1024"
(nth-root 10 1024 3.0)
