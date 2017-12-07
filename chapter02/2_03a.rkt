#lang sicp

;; to build abstraction barrier, we need extract the computing method 
;; for the lengths of two edges of rectangle

; make point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

; the first representation of rectangle
; use left-top corner point and right-bottom corner point
; for another repretation, see 2_03b.rkt

(define (make-rec p1 p2)
  (cons p1 p2))

(define (width rec)
  (let ((x1 (x-point (car rec)))
        (x2 (x-point (cdr rec))))
    (- x2 x1)))

(define (height rec)
  (let ((y1 (y-point (car rec)))
        (y2 (y-point (cdr rec))))
    (- y1 y2)))

; get perimeter
(define (perimeter rec)
  (let ((x (width rec))
        (y (height rec)))
    (+ x x y y)))

(define (area rec)
  (let ((x (width rec))
        (y (height rec)))
    (* x y)))

(define p1 (make-point 0 2))
(define p2 (make-point 1 0))
(define rec (make-rec p1 p2))

; should be 6
(perimeter rec)
; should be 2
(area rec)