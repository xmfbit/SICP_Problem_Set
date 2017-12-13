#lang sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

; should be `(1 2 3 4 5 6)`
(write (append x y))
(newline)
; should be `((1 2 3) 4 5 6)`
(write (cons x y))
(newline)
; should be ((1 2 3) (4 5 6))
(write (list x y))
(newline)
