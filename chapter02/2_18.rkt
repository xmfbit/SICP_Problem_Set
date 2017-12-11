#lang sicp
;;; append list2 to list1
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;;; reverse a list
(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(write (reverse (list 1 2 3 4)))
(newline)