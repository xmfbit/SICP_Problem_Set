#lang sicp

; filter-accumulate
(define (filter-accumulate combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a) (filter-accumulate combiner null-value term (next a) next b predicate))
          (filter-accumulate combiner null-value term (next a) next b predicate))))

;;; a, sum of square of prime numbers in [a, b]
(define (square x)
  (* x x))

(define (smallest-divisor n)
  (define (smallest-divisor-iter n m)
    (cond ((> (square m) n) n)
          ((= (remainder n m) 0) m)
          (else (smallest-divisor-iter n (inc m)))))
  (smallest-divisor-iter n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

; add op
(define (add x y) (+ x y))

(define (sum-square-prime a b)
  (filter-accumulate add 0 square a inc b prime?))

; should be 13
(sum-square-prime 2 4)

; should be 0
(sum-square-prime 2 1)

;;; b, product of positive numbers less than n that relatively prime to n

; gcd
(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(define (mul x y) (* x y))

(define (product-prime-n n)
  (define (prime-n? x) (= (gcd x n) 1))
  (filter-accumulate mul 1 identity 2 inc n prime-n?))

(product-prime-n 5)