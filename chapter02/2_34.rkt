#lang sicp
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; evaluates a polynomial using Horner’s rule
(define (horner-eval x coefficient-sequence) 
  (accumulate (lambda (this-coeff higher-terms)
                      (+ (* higher-terms x)
                         this-coeff))
                0
                coefficient-sequence))

; 1 + 3x + 5x^3 + x^5 at x = 2 => 1+6+40+32=79
(horner-eval 2 (list 1 3 0 5 0 1))