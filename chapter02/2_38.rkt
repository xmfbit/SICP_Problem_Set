#lang sicp
(define (fold-left op init seq)
  (define (iter res rest)
    (if (null? rest)
        res
        (iter (op res (car rest))
              (cdr rest))))
  (iter init seq))

(define (fold-right op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

;; values of following expressions
(fold-right / 1 (list 1 2 3))
; f(1 2 3) --> 1 / f(2, 3) --> 1 / (2 / f(3)) -->
; 1 / (2 / (3 / f(nil))) --> 1 / (2 / (3 / init)) = 3/2

(fold-left / 1 (list 1 2 3))
; f(1 2 3) --> (iter 1 (1 2 3)) --> (iter (/ 1 2) (3)) -->
; (iter 1/2 (3)) --> (iter 1/2/3 (nil)) --> 1/6

(write (fold-right list nil (list 1 2 3)))
(newline)
; list(1 list(2 (list 3)))
(write (fold-left list nil (list 1 2 3)))
(newline)
; (list (list nil 1) 2)

; op(a, b) = op(b, a), for example: +, *