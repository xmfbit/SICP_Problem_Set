#lang sicp

(define (element-of-set? x set)
  (cond ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set s1 s2)
  (if (or (null? s1) (null? s2))
      '()
      (let ((x1 (car s1))
            (x2 (car s2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr s1)
                                       (cdr s2))))
              ((< x1 x2)
               (intersection-set (cdr s1) s2))
              (else (intersection-set s1 (cdr s2)))))))

(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (let ((h (car set)))
        (cond ((= x h) set)
              ((< x h) (cons x set))
              (else (cons h
                          (adjoin-set x (cdr set))))))))

(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((null? s2) s1)
        (else (let ((x1 (car s1))
                    (x2 (car s2)))
                (cond ((< x1 x2) (cons x1
                                       (union-set (cdr s1) s2)))
                      ((> x1 x2) (cons x2
                                       (union-set s1 (cdr s2))))
                      (else (union-set (cdr s1) (cdr s2))))))))

; test
(define s1 (list 1 2 4))
(define s2 (list 3 4 5 6))

(element-of-set? 1 s1)
(element-of-set? 1 s2)

(intersection-set s1 s2)

(adjoin-set 0 s1)
(adjoin-set 1 s1)
(adjoin-set 2 s1)
(adjoin-set 3 s1)
(adjoin-set 4 s1)

(union-set s1 s2)
