#lang sicp
; count leaves
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                               (cond ((null? x) 0)
                                     ((pair? x) (count-leaves x))
                                     (else 1))) t)))

; should be 4
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)

; should be 8
(define y (list x x))
(count-leaves y)