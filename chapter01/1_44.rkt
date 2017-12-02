#lang sicp
;; plot is used to show the function figure before and after smoothing
;; if confused, please refer the documentation:
;; https://docs.racket-lang.org/sicp-manual/
;; and plot documation:
;; https://docs.racket-lang.org/plot/intro.html#%28part._.Plotting_2.D_.Graphs%29
(#%require plot)
(#%require racket)

; smooth function f
(define (smooth f)
  (define dx 0.1)
  (lambda (x) (/ (+ (f x)
                    (f (- x dx))
                    (f (+ x dx)))
                 3)))

; repeat transformations n times
(define (repeat f n)
 (if (= n 1)
     f
     (lambda (x) (f ((repeat f (dec n)) x)))))

(define (smooth-n f n)
  ((repeat smooth n) f))

(define smoothed-abs (smooth-n abs 5))

; if not run using DrRacket, you need this to create a new window to plot
(plot-new-window? #t)
(plot (list (axes)
            (function abs (- 0.5) 0.5 #:label "abs")
            (function smoothed-abs #:label "smoothed-abs" #:color 0 #:style 'dot)))
