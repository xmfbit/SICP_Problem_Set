#lang sicp
;; define: iterative improving
;  if good-enough?(guess) --> guess
;  else improve(guess)
(define (iterative-imporving good-enough? improve)
  (lambda (guess) (if (good-enough? guess)
                       guess
                       ((iterative-imporving good-enough? improve) (improve guess)))))

;; average
(define (average x y) 
  (/ (+ x y) 2))

;; average damp
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x)
  (* x x))

(define (sqrt x)
  (define tol 0.0001)
  ((iterative-imporving (lambda (guess) 
                                (< (abs 
                                     (- 
                                        (square guess) 
                                        x)) 
                                   tol))
                        (average-damp (lambda (y) (/ x y))))
                        1.0))

; should be 2
(sqrt 4.0)
; shoule be 1.732...
(sqrt 3.0)

;; fix-point
(define (fix-point f first-guess)
  (define tol 0.0001)
  ((iterative-imporving (lambda (guess) (< (abs (- (f guess) guess)) tol))
                        (lambda (guess) (f guess))) first-guess))

; should be 0.739...
(fix-point cos 1.0)
