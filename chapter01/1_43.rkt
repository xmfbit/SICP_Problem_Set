#lang sicp
; repeat transformations n times
(define (repeat f n)
 (if (= n 1)
     f
     (lambda (x) (f ((repeat f (dec n)) x)))))

((repeat (lambda (x) (* x x)) 2) 5)