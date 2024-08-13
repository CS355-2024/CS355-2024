#lang sicp

;; Many different ways to pick the least two, this way is by picking the maximum element and adding the other two.

(define (leastTwo x y z)
  (cond ((and (>= x y) (>= x z)) (+ y z))
        ((and (>= y x) (>= y z)) (+ x z))
        ((and (>= z y) (>= z x)) (+ y x))))

;; A cleaner way to do the same, using the same logic

(define (leastTwoElegant x y z)
  (- (+ x y z) (max x y z)))
  
