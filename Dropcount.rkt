#lang racket
; If number is smaller than previous one, keeps a tab. counts the number of times in a list the previous number was greater than current
(define dropcount
  (lambda(list) 
   (cond [( = (length list) 1) 0]
         [(< (car list) (cadr list)) (dropcount (cdr list))]
         [ else (> (car list) (car(cdr list))) (+ 1(dropcount (cdr list)))]
          
          )))
  