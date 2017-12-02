#lang sicp
(define (square x)
  (* x x))

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((= (remainder n 2) 1) (* b (fast-exp b (dec n))))
        (else (square (fast-exp b (/ n 2))))))

(fast-exp 2 8)

(define (fast-exp-iter a b n)
  (cond ((= n 0) a)
        ((= (remainder n 2) 1) (fast-exp-iter (* a b) b (dec n)))
        (else (fast-exp-iter a (square b) (/ n 2)))))

(define (fast-exp-exercise b n)
  (fast-exp-iter 1 b n))

(fast-exp-exercise 2 8)
