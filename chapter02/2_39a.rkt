#lang sicp

(define (fold-right op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))

(define (display-list x)
  (write x)
  (newline))
  
(define a (list 1 2 3))
(display-list (reverse a))