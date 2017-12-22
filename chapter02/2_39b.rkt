#lang sicp
(define (fold-left op init seq)
  (define (iter res rest)
    (if (null? rest)
        res
        (iter (op res (car rest))
              (cdr rest))))
  (iter init seq))

(define (reverse seq)
  (fold-left (lambda (x y) (cons y x)) nil seq))

(define (display-list x)
  (write x)
  (newline))

(define a (list 1 2 3))
(display-list (reverse a))