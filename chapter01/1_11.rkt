#lang sicp
; recursive process
(define (f x)
  (if (< x 3)
      x
      (+ (f(- x 1))
         (* 2 (f(- x 2)))
         (* 3 (f(- x 3))))))

(f 2)
(f 4)
(f 10)

; iterative process
(define (nf x)
  (define (f-iter a b c counter)
    (cond ((= counter 0) a)
          ((= counter 1) b)
          ((= counter 2) c)
          (else (f-iter b
                        c
                        (+ (* 3 a) (* 2 b) c)
                        (- counter 1)))))
  (f-iter 0 1 2 x))

(nf 2)
(nf 4)
(nf 10)
