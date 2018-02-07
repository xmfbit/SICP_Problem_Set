#lang sicp
; queen-puzzle solution
(define empty-board nil)

;;; (define (queens board-size)
;;;   (define (queen-cols k)
;;;     (if (= k 0) ;; return empty board if k==0
;;;         (list empty-board)
;;;         (filter
;;;           ;; for each position, check if safe
;;;           (lambda (pos) (safe? k pos))  
;;;           ;; used to generate all possible postions
;;;           (flatmap
;;;             ;; for the rest queens
;;;             (lambda (rest-of-queens)
;;;               ;; put the next queen into a new row [0...board_size]
;;;               (map (lambda (new-row)
;;;                      (adjoin-position
;;;                        new-row k rest-of-queens))
;;;                    (enumerate-interval 1 board-size)))
;;;             (queen-cols (- k 1))))))
;;;   (queen-cols board-size))

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

(define (adjoin-position row k queens)
  (if (= k 1)
      (append (list row) queens)
      (append queens (list row))))

(define (safe? k pos)
  (if (null? pos)
      #t
      (and (not (= k (car pos))) (safe? k (cdr pos))))
