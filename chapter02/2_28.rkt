#lang sicp
;; get leavers of a tree
;; easiest situation:
;; list(1) --> list(1)
;; list(2) --> list(2)
;; ....
;; list(list (1) 2) --> list(1, 2)
;; ==>
;; from left to right, add non-pair elements to a list, which is
;; empty at the beginning
(define (fringe tree)
  (define (iter nodes leaves)
    (cond ((null? nodes) nil)
          ((not (pair? nodes)) (list nodes))
          (else (append 
                  (append leaves (iter (car nodes) leaves))
                  (iter (cdr nodes) leaves)))))
                  
  (iter tree nil))

(define (display-list x)
  (write x)
  (newline))

(define x (list (list 1 2) (list 3 4)))
;should be 1 2 3 4
(display-list (fringe x))
; should be 1 2 3 4 1 2 3 4
(display-list (fringe (list x x)))

; should be 1 2 3 4
(define y (list (list 1 2) 3 4))
(display-list (fringe y))