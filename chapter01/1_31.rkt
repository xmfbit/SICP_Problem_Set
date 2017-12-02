#lang sicp
; define prod of a sequence
(define (prod term a next b)
  (if (> a b)
      1
      (* (term a) (prod term (next a) next b))))

; define factorial
(define (factorial n)
  (define (identity x) x)
  (prod identity 1 inc n))

; should be 24
(factorial 4)

; calculating pi
; pi/8 = (2n+2) !! / (2n+1)!!
(define (get-pi n)
  (define (square x) (* x x))
  (define (term k)
    (define den (+ (* 2 k) 2))
    (define num (+ (* 2 k) 1))
    (square (/ den num)))
  (/ (* (prod term 1 inc n) 8) (* 2 (+ n 1))))

; use float number representation
(exact->inexact (get-pi 1000))