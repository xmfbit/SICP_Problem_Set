#lang sicp
;; Is a variable or not
(define (variable? x) (symbol? x))

;; Test two variables the same or not
(define (same-variable? v1 v2) 
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;; Test the variable equal to a given number
(define (=number? e val)
  (and (number? e) (= e val)))

;; Same expression or not
(define (same-exp? a b)
  (cond ((not (pair? a))
         (and (not (pair? b))
              (same-variable? a b)))
        ((null? (cdr a))
         (and (null? (cdr b))
              (same-variable? (car a) (car b))))
        (else (and (same-variable? (car a) (car b))
                   (same-exp? (cdr a) (cdr b))))))

;; make sum
(define (make-sum a b)
   (cond ((=number? a 0) b)
         ((=number? b 0) a)
         ((and (number? a) (number? b))
          (+ a b))
         ((same-exp? a b)
          (make-product '2 a))
         (else (list '+ a b))))

;; make-prod
(define (make-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        ((same-exp? a b) (make-exponentiation a '2))
        (else (list '* a b))))

;; Test the expression is sum form or not
;; The sum form is a list beginning with the symbol `+`
(define (sum? e)
  (and (pair? e) (eq? (car e) '+)))

;; Test the expression is product form or not
;; The product form is a list beginning with the symbol `*`
(define (product? e)
  (and (pair? e) (eq? (car e) '*)))

;; Get the two operators of `add`
(define (addend e)
  (cadr e))

(define (augend e)
  (if (null? (cdddr e))
      (caddr e)
      (append (list '+) (cddr e))))

;; Get the two operators of `product`
(define (multiplier e)
  (cadr e))

(define (multiplicand e)
  (if (null? (cdddr e))
      (caddr e)
      (append (list '*) (cddr e))))

;; Test the expression is exponentiation or not
(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

;; Get base and exponent 
(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(define (make-exponentiation u n)
  (cond ((=number? n 0) 1)
        ((=number? u 0) 0)
        ((=number? n 1) u)
        (else (list '** u n))))

;; Deriv
(define (deriv exp var) 
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0)) 
        ;; add exponentiation case
        ;;((exponentiation? exp) 1)
        ((exponentiation? exp)
          (let ((u (base exp))
                (n (exponent exp)))
            (make-product 
              (make-product 
                n 
                (make-exponentiation u (- n 1)))
              (deriv u var))))
          
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
          (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))))  
        (else
          (error "unknown expression type: DERIV" exp))))

;; for better display
(define (display-list l)
  (write l)
  (newline))

; test for sum, should be 2
(deriv '(+ x y x) 'x)

; test for multiply, should be 3yx^2,
; the real output is (+ (* x (+ (* x y) (* x y))) (* x (* x y))) 
(deriv '(* x x (* x y)) 'x)
(deriv '(* x x x) 'x)
; final test
(deriv '(* x y (+ x 3)) 'x)