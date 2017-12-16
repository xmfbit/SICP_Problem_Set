#lang sicp
(define (subsets s) 
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

;; explanation:
; set S = {s_1, s_2, ..., s_n}
; Subset(S) = Subset(S') + \for \all S'' \subseteq S', (s_1 ∪ S'')
; where, S' = {s_2, ..., s_n}

(define (display-set s)
  (write s)
  (newline))

(define s (list 1 2 3))
(display-set (subsets s))