#lang sicp

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))

(define (add-vect x y)
  (make-vect (+ (xcor-vect x) (xcor-vect y))
             (+ (ycor-vect x) (ycor-vect y))))

(define (sub-vect x y)
  (make-vect (- (xcor-vect x) (xcor-vect y))
             (- (ycor-vect x) (ycor-vect y))))

(define (scale-vect s x)
  (make-vect (* s (xcor-vect x))
             (* s (ycor-vect x))))

;; test
(define x (make-vect 1 2))
(define y (make-vect 3 4))
(add-vect x y)
(sub-vect x y)
(scale-vect 5 x)