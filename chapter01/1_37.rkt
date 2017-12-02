#lang sicp
;; cont-fac
; recursive version
;;; (define (cont-frac n d k)
;;;   (define (iter n d i)
;;;     (if (> i k)
;;;         0
;;;         (/ (n i) 
;;;            (+ (d i) 
;;;               (iter n d (inc i))))))
;;;   (iter n d 1))

; iterative version
(define (cont-frac n d k)
  (define (iter n d i result)
    (if (< i 1)
        result
        (iter n d (dec i)
              (/ (n i) 
                 (+ (d i) 
                    result)))))
  (iter n d k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(define (cont-frac-golden k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(define (appro-golden-ratio tol)
  (define (enough? guess next)
    (let ((fg (cont-frac-golden guess))
          (fn (cont-frac-golden next)))
          (< (abs (- fg fn)) tol)))
  (define (try start)
    (if (enough? start (inc start))
        (inc start)
        (try (inc start))))
  (try 1))

(appro-golden-ratio 0.00001)