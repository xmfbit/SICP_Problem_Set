#lang sicp
; use `map`
(define (square-tree tree)
  (let ((f (lambda (x) (* x x))))
    (map (lambda (subtree)
           (if (not (pair? subtree))
               (f subtree)
               (square-tree subtree))) tree)))

(define (display-tree tree)
  (write tree)
  (newline))
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display-tree (square-tree tree))