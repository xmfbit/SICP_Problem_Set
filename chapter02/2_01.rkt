#lang sicp
; a better constructor for ration number

(define (make-rat n d)
  (let ((g (gcd n d)))
    (define ng (/ n g))
    (define dg (/ d g))
    (if (< (* ng dg) 0)
        (cons (- (abs ng)) (abs dg))
        (cons (abs ng) (abs dg)))))

; selectors
(define (number x) (car x))
(define (denom x) (cdr x))

; print rational number
(define (print-rat x)
  (display (number x))
  (display "/")
  (display (denom x))
  (newline))

; test for both positive
(define a (make-rat 1 2))
(print-rat a)

; test for negtive norminator 
(define b (make-rat -4 8))
(print-rat b)

; test for negtive denominator 
(define c (make-rat 4 -6))
(print-rat c)

; test for both negtive
(define d (make-rat -6 -8))
(print-rat d)

