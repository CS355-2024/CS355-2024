#lang sicp

;; Define a lambda function that returns the composition of both the functions

(define (compose f g)
  (lambda (x) (f (g x))))