#lang sicp

(define (display-list a)
  (write a)
  (newline))

(define (square x) (* x x))

;; version 1.0, from scratch
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) 
            (square-list (cdr items)))))

(display-list (square-list (list 1 2 3 4)))

;; version 2.0, using map
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-map items)
  (map square items))

(display-list (square-list-map (list 1 2 3 4)))