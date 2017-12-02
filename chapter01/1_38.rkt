#lang sicp
;;; use cont-frac to calculate e by Euler
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

; e-2 = (cont-frac n d k) (by euler)
; n_i = 1, for \all i >= 1
; d_i = 1,2,1,1,4,1,1,6...
(define (get-e k)
  ; the key issue is to define d to generate den
  (define (d i)
    ; x = 2i + 2
    ; if x%3 == 0 => x/3
    ; else 1
    (let ((x (+ 2 (* 2 i))))
      (if (= (remainder x 3)
             0)
          (/ x 3)
          1)))
  (+ (cont-frac (lambda (i) 1.0)
                d
                k)
     2))

(get-e 10)