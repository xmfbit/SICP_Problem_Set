#lang sicp
; copied from the text book
; accumulate a seq from inintial state
(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (display-seq s)
  (write s)
  (newline))

; implement `map`
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define a (list 1 2 3))
(display-seq (map (lambda (x) (+ x 1)) a))

; implement `append` 
(define (append seq1 seq2) 
  (accumulate cons seq2 seq1))

(define b (list 4 5))
(display-seq (append a b))

; implement `length`
(define (length sequence) 
  (accumulate + 0 sequence))

(length a)