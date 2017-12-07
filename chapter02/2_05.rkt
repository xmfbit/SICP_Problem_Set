#lang sicp
;;; we want to prove that a pair of non-negtive intergers can be 
;;; represented by this format: 2^a*3^b.
;;; Let me prove this in Chinese

;; 1. 对于任意非负整数a和b，2^a*3^b的结果是唯一的，这是显然的，
;; 2. 对于某个正整数n，方程n=2^a*3^b的非负整数解对(a, b)若存在，则唯一。
;; 下面证明2.
;; 假设上面方程至少存在两组解，为(a1,b1) (a2, b2)，那么：
;; 2^(a1-a2) * 3^(b1-b2) = 1
;; 说明要么 a1-a2=0且b1-b2=0；要么，(a1-a2)*(b1-b2) < 0 （因为m^k<1 <=> k<0）
;; 若是第二种情况，那么，不妨设a1 > a2，b1 < b2
;; 有 2^(a1-a2) = 3^(b2-b1)。这是不可能的，因为log2(x)和log3(x)
;; 两条函数的曲线有且仅有(1, 0)这个交点。
;; 证毕

;; computing x^n
(define (power x n)
  (define square (lambda (x) (* x x)))
  (cond ((= n 0) 1)
        ((even? n) (square (power x (/ n 2))))
        (else (* x
                 (square (power x (/ (- n 1) 2)))))))

(define (cons x y)
  (* (power 2 x) (power 3 y)))

; solve the equation x^m1*y^m2*...=n
; where x, y, ... are prime relatively

; key: m1 = argmax(n % x^k == 0)
(define (solve-exp x n)
  (define (iter m)
    (if (= (remainder n (power x m)) 0)
        (iter (inc m))
        (dec m)))
  (iter 1))

(define (car x)
  (solve-exp 2 x))

(define (cdr x)
  (solve-exp 3 x))

(define x (cons 3 4))
(car x)
(cdr x)

(define y (cons 0 1))
(car y)
(cdr y)