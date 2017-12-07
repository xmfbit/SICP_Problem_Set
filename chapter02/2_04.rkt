#lang sicp
;; explain the correctness of given definition of `cons` and `car`

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; (car (cons x y)) -->
;; ((cons x y) (lambda (p q) p)) -->
;; (lambda (m) (m x y)) (lambda (p q) p) -->
;; ((lambda (p q) p) x y) -->
;; x
;; QED

; let's build `cdr`. it is easy given `car`
(define (cdr z)
  (z (lambda (p q) q)))

(define x (cons 1 2))
(car x)
(cdr x)