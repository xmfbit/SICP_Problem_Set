#lang sicp

(define (display-list items)
  (write items)
  (newline))
;; copied from 2_18.rkt
;;; reverse a list
(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

;; deep copy
(define (deep-reverse items)
  (if (null? items)
      nil
      (if (pair? items)
          (append (deep-reverse (cdr items)) (list (deep-reverse (car items))))
          items)))

(define x (list (list 1 2) 3 4))

(display-list (reverse x))

(display-list (deep-reverse x))
