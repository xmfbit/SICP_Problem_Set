#lang sicp

; a
(define a (list 1 3 (list 5 7) 9))
(display a)
(car (cdr (car (cdr (cdr a)))))

; b
(define b (list (list 7)))
(display b)
(car (car b))

; c
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display c)
(cadr (cadr (cadr (cadr (cadr (cadr c))))))
