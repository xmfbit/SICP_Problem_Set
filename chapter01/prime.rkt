#lang sicp
(define (square x)
  (* x x))

(define (smallest-divisor n)
  (define (smallest-divisor-iter n m)
    (cond ((> (square m) n) n)
          ((= (remainder n m) 0) m)
          (else (smallest-divisor-iter n (inc m)))))
  (smallest-divisor-iter n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; find the smallest prime number larger than start
;(define (search-for-primes-iter start n start-time)
;  (cond ((= n 0) (display "end"))
;        ((prime? start) ((newline)
                         (display start)
                         (report-prime (- (runtime) start-time))
                         (search-for-primes-iter (+ start 2) (dec n) (runtime))))
        (else (search-for-primes-iter (+ start 2) n (runtime)))))

(define (search-for-primes from n)
  (search-for-primes-iter (inc from) n (runtime)))

(search-for-primes 1000 3)

                         
        
        

