#lang sicp
(#%require sicp-pict)

;; A mathematical vector is called a vect here, 
;; in order to avoid confusion with the builtin vectors of Scheme.
;; so we don't define `make-vect` again.

;;; make segmentat using vector `start` and `end`
(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;; test
(define s (make-segment (make-vect 1 2) (make-vect 2 3)))

(start-segment s)
(end-segment s)
