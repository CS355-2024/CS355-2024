#lang sicp

;; Helper functions for average, square and cube

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

;; The code for sqrt, taken from sir's slides

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

;; A similar program for cube root (Note the encapsulation of the two functions improve and good-enough? inside the procedure cbrt)

(define (cbrt x)
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) 0.001))
  (define (cbrt-iter guess)
    (if (good-enough? guess)
        guess
        (cbrt-iter (improve guess))))
  (cbrt-iter 1.0))


