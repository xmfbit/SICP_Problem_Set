#lang sicp
(define (f g) (g 2))

; g <- square
(f (lambda (x) (* x x)))

; g <= x*(x+1)
(f (lambda (x) (* (+ 1 x) x)))

; g <= f
(f f)