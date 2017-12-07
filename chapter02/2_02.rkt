#lang sicp
;; make point
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

;; make line segment
(define (make-seg p1 p2)
  (cons p1 p2))

(define (start-seg l)
  (car l))

(define (end-seg l)
  (cdr l))

(define (mid-point l)
  (let ((x1 (x-point (start-seg l)))
        (x2 (x-point (end-seg l)))
        (y1 (y-point (start-seg l)))
        (y2 (y-point (end-seg l))))
     (make-point (/ (+ x1 x2) 2)
                 (/ (+ y1 y2) 2))))

(define p1 (make-point 3 4))

(define p2 (make-point 6 8))

(define l (make-seg p1 p2))

(define mid (mid-point l))

; should be (9/2, 6)
(print-point mid)

