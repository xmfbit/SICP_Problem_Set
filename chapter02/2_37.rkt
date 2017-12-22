#lang sicp
;; basic operations of vector and matrix
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;;; start!
(define (display-vector v)
  (cond ((not (null? v)) (write v))))

(define (display-matrix m)
  (map display-vector m))

; dot product of two vectors
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; v1 = (1, 2, 3)
(define v1 (list 1 2 3))
; v2 = (-1 -2 0)
(define v2 (list -1 -2 0))

; shoule be -5 
(dot-product v1 v2)

; multiplication of vector and matrix
(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define a1 (list 1 -1 0))
(define a2 (list 3 2 -1))
(define a3 (list 0 0 1))

; matrix A = [a1; a2; a3]
(define A (list a1 a2  a3))
(define Av (matrix-*-vector A v1))
(display-vector Av)
(newline)

;; transpose
; this is not a perfect solution
; I have no good solution for avoiding `nil` at the end of the matrix 
(define (transpose m)
  (accumulate-n cons nil m))

(define At (transpose A))
(display-matrix At)
(newline)

;; matrix multiplication
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector n v)) m)))

(define B (list a1 a2 a3))
(define AB (matrix-*-matrix A B))
(display-matrix AB)
(newline)

