#lang sicp
;;; get the last non-empty elment of list
(define (last-pair items)
  (cond ((null? items) (error "empty list!"))
        ((null? (cdr items)) (car items))
        (else (last-pair (cdr items)))))

(define a (list 1 2 3 4))
(last-pair a)

(last-pair (list 1))
