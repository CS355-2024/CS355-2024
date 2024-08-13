#lang sicp

;; Definitions specified in the question

(define (inc x) (+ x 1))

(define zero (lambda () '())) ;; '() is syntax for an empty list in scheme, is arbitrarily chosen. Note that zero is itself a function (without any arguments) that returns the empty list when called
(define (succ x) (lambda () x)) ;; Wraps a lambda function around x, which itself is a function (without arguments)
(define (pred x) (x)) ;; Calls the argument (which is itself a function without arguments), unrolls one wrapped function to give the predecessor (is (pred zero) defined?)

(define one (succ zero))
(define two (succ one))
(define three (succ two))
(define four (succ three))
(define five (succ four))

(define (is-zero? x) (null? (x))) ;; Calls the argument (function) to check if it returns an empty list

(define (is-equal? x y) ;; Recursive check for equality, using is-zero because that is the only way of comparing two quantities that we have so far.
  (cond ((is-zero? x) (is-zero? y))
        ((is-zero? y) (is-zero? x))
        (else (is-equal? (pred x) (pred y)))))


;; Testing
(is-equal? zero one)
(is-equal? zero zero)
(is-equal? four (succ (succ (succ (succ zero)))))
(is-equal? two (pred (succ two)))


(define (add-church x y)
  (if (is-zero? y)
      x
      (add-church (succ x) (pred y)))) ;; Note here that x can be regarded as a state variable, and y can be regarded as a counter, can be taken as an iterative definition.


;; This additionally implements the absolute value of the difference. To just return the difference (for x >= y) remove the second if block.
(define (subtract-church x y)
  (if (is-zero? y)
      x
      (if (is-zero? x)
          y
          (subtract-church (pred x) (pred y)))))


;; Defining multiplication as repeated addition (xy = x(y-1) + x)
(define (multiply-church x y)
  (if (is-zero? y)
      zero
      (add-church (multiply-church x (pred y)) x)))
