#lang sicp

(define (make-vect x y)
  (cons x y))

(define (make-frame origin e1 e2)
  (list origin e1 e2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(define o (make-vect 1 2))
(define e1 (make-vect 1 1))
(define e2 (make-vect -1 1))

(define f (make-frame o e1 e2))
(origin-frame f)
(edge1-frame f)
(edge2-frame f)