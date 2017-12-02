; computing intergral using simpson's rule
; see https://zh.wikipedia.org/wiki/%E8%BE%9B%E6%99%AE%E6%A3%AE%E7%A9%8D%E5%88%86%E6%B3%95
; \int_{a}^{b}f(x)dx = 
#lang sicp

; x^3
(define (cube x) (* x x x))

; sum of a series of transformed numbers
(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
         (sum term (next a) next b))))

; at the beginning, lst's have a try
; sum of 1^3 --> 3^3
(sum cube 1 inc 3)

; simpson intergral of f(x)
(define (simpson-int f a b n)
  ; h = (b-a)/n
  (define h (/ (- b a) n))
  ; value of y_k
  (define (y k) (f (+ a (* k h))))
  ; get term of k: alpha*y_k
  (define (term k) 
    (cond ((> k n) 0)
          ((or (= k 0)
               (= k n))
               (y k))
          ((even? k) (* 2 (y k)))
          (else (* 4 (y k)))))
  (* (sum term 0 inc n)
     (/ h 3)
     ))

; have a try! the value should be 1/4
(simpson-int cube 0 1 1000)