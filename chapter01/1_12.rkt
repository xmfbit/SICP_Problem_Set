#lang sicp
; get item of nth row, ith col in pascal triangle
(define (pascal-triangle-item n i)
  (cond ((or (= n 1)
             (= i 1)
             (= i n))
             1)
        (else (+
               (pascal-triangle-item (dec n) i)
               (pascal-triangle-item (dec n) (dec i))))))

; check
(pascal-triangle-item 1 1)

(pascal-triangle-item 4 2)
