#lang sicp
; tree-map
(define (tree-map f tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map f subtree)
             (f subtree))) tree))

(define (display-tree tree)
  (write tree)
  (newline))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display-tree (tree-map (lambda (x) (* x x)) tree))