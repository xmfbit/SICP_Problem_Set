#lang sicp
; iterative sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

; try it!
(define (identity x) x)
; should be 5050
(sum identity 1 inc 100)