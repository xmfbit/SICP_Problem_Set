#lang sicp

; print by interpreter

(define a (list 1 (list 2 (list 3 4))))
(display a)

; output: (1 (2 (3 4)))

; box-pointer structure

; |-|-| -> |-|-| -> |-|-| -> |-|-| -> NIL 
;  ↓        ↓        ↓        ↓
;  1        2        3        4

; the tree

;    /\
;   1  /\
;     2  /\
;       3  4