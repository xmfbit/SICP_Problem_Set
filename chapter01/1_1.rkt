#lang sicp
; get the smaller one in a tuple
(define (min a b)
  (if (< a b) a
      b))
; square of x
(define (square x)
  (* x x))
; sum of square of a series number
(define (sum a b c)
  (+ (square a)
     (square b)
     (square c)))
; sum of square of the larger two number
(define (sum_bigger_two a b c)
  (- (sum a b c)
     (square (min (min a b) (min a c)))))

(sum_bigger_two 3 2 3)
