#lang sicp

;; iterative-improve takes two functions as arguments, should not take in guess or x as arguments, those will be supplied in the two functions and the sqrt function respectively.

;; inside the iterative-improve function, create a recursive function which checks if the guess is good enough and returns guess if it is, otherwise improves the guess and sends it back into the function. It then returns the function.

(define (iterative-improve improve good-enough?)
  (define (proc guess)
    (if (good-enough? guess)
        guess
        (proc (improve guess))))
  proc)


;; This is the normal sqrt implementation taken from the slides, the only change is what the sqrt function returns, it calls the iterative-improve procedure on the two functions defined above, and with a starting guess.

(define (average x y)
  (/ (+ x y) 2))
(define (square x)
  (* x x))
(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve improve good-enough?) 1.0))