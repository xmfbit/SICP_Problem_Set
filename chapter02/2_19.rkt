#lang sicp

(define (cc amount coin-values)
  (cond ((= amount 0) 1)  
        ; amout < 0 or don't have coin
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          ; only use the first one
          (+ (cc amount
                 (except-first-domination 
                  coin-values))
             (cc (- amount
                    (first-domination
                     coin-values))
                 coin-values)))))

(define (no-more? items)
  (null? items))

(define (except-first-domination items)
  (cdr items))

(define (first-domination items)
  (car items))

; should be 292
(define us-coins (list 50 25 10 5 1))
(cc 100 us-coins)