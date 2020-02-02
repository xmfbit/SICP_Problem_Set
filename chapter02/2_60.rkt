#lang sicp

; Determine an element x is in a given set or not
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; add an element to a given set
; just put the new element in the front of the internal list
(define (adjoin-set x set)
  (cons x set))

; Intersection of two sets
(define (intersection-set s1 s2)
  (cond ((or (null? s1) (null? s2)) '())
        ((element-of-set? (car s1) s2)
         (cons (car s1) (intersection-set (cdr s1) s2)))
        (else (intersection-set (cdr s1) s2))))

; Union two sets
(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set? (car s1) s2) s2)
        (else (cons (car s1) s2))))

  
;; test
(define s1 (list 1 2 3))
(define s2 (list 2 3 4))

(element-of-set? 1 s1)
(element-of-set? 1 s2)

(adjoin-set 1 s1)
(adjoin-set 4 s1)
(intersection-set s1 s2)
(union-set s1 s2)

;; expected output:
;#t
;#f
;(1 2 3)
;(4 1 2 3)
;(2 3)
;(1 2 3 4)