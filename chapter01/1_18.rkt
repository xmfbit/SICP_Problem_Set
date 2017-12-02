#lang sicp
(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mul-iter a b res)
  (cond ((= b 0) res)
        ((even? b) (fast-mul-iter (double a) (halve b) res))
        (else (fast-mul-iter a (dec b) (+ a res)))))

(define (fast-mul a b)
  (fast-mul-iter a b 0))

(fast-mul 6 900)
