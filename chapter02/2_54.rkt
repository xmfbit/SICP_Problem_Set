#lang sicp

(define (equal? a b)
  (if (null? a)
      (null? b)
      (if (not (pair? a))
          (and (not (pair? b))
               (eq? a b))
          (and (pair? b)
               (eq? (car a) (car b))
               (equal? (cdr a) (cdr b))))))

;;; test

;; 1. a is nil or b is nil
;; false, false, true
(equal? nil `(a b c)) 
(equal? '(a b c) nil)
(equal? nil nil)

;; 2. a is equal to b
;; all true
(equal? '(a b) `(a b))
(equal? 'a 'a)

;; 3. a is not equal to b
;; all false
(equal? `(a b) `(a b c))
(equal? '(a b c) '(a b))
(equal? 'a '(a b))
(equal? '(a b) 'a)

;; 4. the test cases in textbook
;; false, true
(equal? '(this is a list) '(this (is a) list))
(equal? '(this is a list) '(this is a list))
