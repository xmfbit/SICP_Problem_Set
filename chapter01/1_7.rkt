#lang sicp
(define (abs x)
  (if (< x 0) (- x)
      x))

(define (good-enough? guess x)
   (< (abs (- (* guess guess) x)) 0.00001))

(define (average x y)
  ( / (+ x y)
      2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))

(define (sqrt x)
  (sqrt-iter 1. x))

(define (new-sqrt x)
  (new-sqrt-iter 1. x))

(sqrt 2)
  
(new-sqrt (+ 1 1))

(+ (new-sqrt (+ 1 2)) 3)
