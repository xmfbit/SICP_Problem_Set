#lang sicp

;;; same parity
(define (same-parity first . others)
  (define (iter others)
    (if (null? others)
        nil
        (let ((r (remainder first 2))
              (p (remainder (car others) 2)))
          (if (= r p)
              (append (list (car others)) (iter (cdr others)))
              (iter (cdr others))))))
  (append (list first) (iter others)))

; display list
(define (display-list a)
  (write a)
  (newline))

(define odd-nums (same-parity 1 2 3 4 5 6 7))
(display-list odd-nums)

(define even-nums (same-parity 2 4 9 10))
(display-list even-nums)
