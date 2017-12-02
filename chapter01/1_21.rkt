#lang sicp
(define (square x)
  (* x x))

(define (smallest-divisor n)
  (define (smallest-divisor-iter n m)
    (cond ((> (square m) n) n)
          ((= (remainder n m) 0) m)
          (smallest-divisor-iter n (inc m))))
  (smallest-divisor-iter n 2))

(smallest-divisor 199)
