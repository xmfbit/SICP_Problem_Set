#lang sicp
; we only need to change the selectors
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))
;; selector
(define (left-branch tree)
  (if (null? tree)
      nil
      (car tree)))
(define (right-branch tree)
  (if (null? tree)
      nil
      (cdr tree)))

(define (branch-length b)
  (if (null? b)
      0
      (car b)))
(define (branch-structure b)
  (if (null? b)
      nil
      (cdr b)))

;; total weight
(define (branch-weight b)
  (if (null? b)
      0
      (let ((struct (branch-structure b)))
        (if (not (pair? struct))
            struct
            (total-weight struct)))))

(define (total-weight tree)
  (if (null? tree)
      0
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (+ (branch-weight left)
           (branch-weight right)))))

(define left-b (make-branch 1 2))
(define right-b (make-branch 3 4))
(define tree (make-mobile left-b right-b))
; should be 6
(total-weight tree)

(define new-right-b (make-branch 6 tree))
(define new-tree (make-mobile left-b new-right-b))
; should be 2 + 2 + 4 = 8
(total-weight new-tree)

;; test a mobile is blanced or not
(define (branch-torqe b)
  (if (null? b)
      0
      (* (branch-length b)
         (branch-weight b))))

(define (blanced? mobile)
  (if (null? mobile)
      #t
      (let ((lb (left-branch mobile))
            (rb (right-branch mobile)))
        (if (not (= (branch-torqe lb) (branch-torqe rb)))
            #f
            (let ((ls (branch-structure lb))
                  (rs (branch-structure rb)))
              (cond ((not (equal? (pair? ls) (pair? rs))) #f)
                    ((pair? ls) (and (blanced? ls) (blanced? rs)))
                    (else #t)))))))

(blanced? tree)
(blanced? new-tree)

;; let's make a blanced tree
(define lb (make-branch 2 3))
(define rb (make-branch 3 2))
(define blanced-tree (make-mobile lb rb))
(blanced? blanced-tree)

(define large-lb (make-branch 2 blanced-tree))
(define large-rb (make-branch 2 blanced-tree))
(define large-tree (make-mobile large-lb large-rb))
(blanced? large-tree)

