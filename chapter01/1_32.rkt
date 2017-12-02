#lang sicp

; accumulate is a more general form of sum and prod
; this is a recursive version
;;; (define (accumulate combiner null-value term a next b)
;;;   (if (> a b) 
;;;       null-value
;;;       (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; this is a iterative version
(define (accumulate combiner null-value term a next b)
  (define (iter combiner term a next result)
    (if (> a b)
        result
        (iter combiner term (next a) next (combiner a result))))
  (iter combiner term a next null-value))

; construct sum using accumulate
(define (sum term a next b)
  (define (add x y) (+ x y))
  (accumulate add 0 term a next b))

(define (identity x) x)

;should be 5050
(sum identity 1 inc 100)

; construct prod using accumulate
(define (prod term a next b)
  (define (mul x y) (* x y))
  (accumulate mul 1 term a next b))

; 4! should be 24
(prod identity 1 inc 4)