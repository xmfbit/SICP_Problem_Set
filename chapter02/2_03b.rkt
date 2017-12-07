#lang sicp

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

; the second representation of rectangle
; use top left corner point and width and height
(define (make-rec p w h)
  (cons (cons w h) p))

; we only need to modify this
(define (width rec)
  (car (car rec)))

(define (height rec)
  (cdr (car rec)))

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
(define w 1)
(define h 2)
(define rec (make-rec p1 w h))

; should be 6
(perimeter rec)
; should be 2
(area rec)