#lang sicp

;;; what is the output of the following expressions?

;; (a b c)
(write (list 'a 'b 'c))

;; ((george))
(write (list (list `george)))

;; ((y1 y2))
(write (cdr '((x1 x2) (y1 y2))))

;; (y1 y2)
(write (cadr `((x1 x2) (y1 y2))))

;; false
(pair? (car '(a shot list)))

;; false
(memq 'red '((red shoes) (blue socks)))

;; (red shoes blue socks)
(memq 'red '(red shoes blue socks))