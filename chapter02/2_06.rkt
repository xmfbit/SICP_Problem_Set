#lang sicp

;; about church numeral, see this wiki:
;; https://en.wikipedia.org/wiki/Church_encoding
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;;; What is (add-1 zero) ? Using substitetion model:
;;; (add-1 zero) -->
;;; (lambda (f) (lambda (x) (f ((zero f) x)))) -->
;;; (lambda (f) (lambda (x) (f (identity-transform x)))) , zero is `identity transform` -->
;;; (lambda (f) (lambda (x) (f x)))
;;; return value is a procedure that tranform input x once.
;;; which is 1 in Church encoding

;; let's test it! the result should be 2
(((add-1 zero) inc) 1)

;; continue
; define one and two
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; let's test! should be 2
((one inc) 1)
; should be 3
((two inc) 1)

;; define add
(define (add x y)
  (lambda (f) (lambda (var) ((x f) ((y f) var)))))

; should be 4
(((add one two) inc) 1)