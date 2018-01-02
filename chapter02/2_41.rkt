#lang sicp

;; find all triples (i,j,k) where 1 <= i < j < k <= n
;; and i + j + k = s

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

; make tuple (i, j), where 0 < j < i <= n
(define (make-tuple n)
  (flatmap (lambda (i) 
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

; make triple (i, j, k), where 0 < k < j < i <= n
(define (make-triple n)
  (flatmap (lambda (p)
             (map (lambda (k) (append p (list k)))
                  (enumerate-interval 1 (- (cadr p) 1))))
           (make-tuple n)))

(define (triple-sum n s)
  (filter (lambda (p) 
            (= (+ 
                 (car p) 
                 (cadr p) 
                 (car (cdr (cdr p)))) s))
          (make-triple n)))

(display-list (triple-sum 10 20))
