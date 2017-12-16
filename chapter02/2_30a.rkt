#lang sicp
; use naive method
(define (square-tree tree)
  (let ((f (lambda (x) (* x x))))
    (cond ((null? tree) nil)
          ((not (pair? tree)) (f tree))
          (else (cons (square-tree (car tree))
                      (square-tree (cdr tree)))))))
(define (display-tree tree)
  (write tree)
  (newline))
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display-tree (square-tree tree))