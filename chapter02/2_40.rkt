#lang sicp
(#%require math/number-theory)

;display list
(define (display-list a)
  (display a)
  (newline))

; acuumulate
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; filter
(define (filter predictor seq)
  (accumulate (lambda (x y)
                (if (predictor x)
                    (cons x y)
                    y)) nil seq))

; generate range(a, b+1)
(define (enumerate-interval a b)
  (if (> a b)
      nil
      (append (list a) (enumerate-interval (inc a) b))))

; flat map
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; unique pair
(define (unique-pair n)
  (flatmap 
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
  (enumerate-interval 1 n)))

; check the sum of the elements of pair is prime or not
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; make a pair of (a, b, sum(a, b))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; get all prime pairs (i, j), where 1<=j<i<=n and i + j is a prime
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pair n))))

(define a (prime-sum-pairs 6))
(display-list a)
          