#lang sicp

;; Can define both exponentiation and modulo functions recursively, however since both of them are inbuilt, can use them directly.

(define (modexp x y n)
  (modulo (expt x y) n))

;; Try and find differences between the inbuilt functions modulo and remainder!