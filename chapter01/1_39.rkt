#lang sicp
;;; use cont-frac to calculate tan(x)
;; iterative cont-frac
(define (cont-frac n d k)
  (define (iter n d i result)
    (if (< i 1)
        result
        (iter n d (dec i)
              (/ (n i) 
                 (+ (d i) 
                    result)))))
  (iter n d k 0))

(define (tan-cf x k)
  ;; n_i = 1 if i==1 else -x^2
  (define (n i)
    (if (= i 1)
        x
        (-(* x x))))
  ;; d_i = 2i-1
  (define (d i)
    (- (* 2 i) 1))

  (cont-frac n d k))

;; 0.0.785398163... is \pi/4
(tan-cf 0.7853981633974483 10)

(tan-cf 3.141592653589793 10)

;; tan(1) should be 1.5574077246549023
(tan-cf 1.0 10)