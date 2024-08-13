#lang sicp

;; Recursive implementation of product, the recursive call is multiplied by (term a) after every step
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; Factorial, lambda functions passed for term and next

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

;; Iterative implementation of product, the state being updated is val

(define (product-iter val term a next b)
  (if (> a b)
      val
      (product-iter (* val (term a)) term (next a) next b)))

;; Factorial defined in terms of product-iter

(define (factorial-iter n)
  (product-iter 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))
