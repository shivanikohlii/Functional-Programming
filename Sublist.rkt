#lang racket
;Return if the first list a sublist of the second list
;Shivani Kohli
(define beginning?
  (lambda (list1 list2)
    (cond[ (null? list1)]
         [(null? list2) #f]
      [[ equal? (car list1)(car list2) ] (beginning? (cdr list1) (cdr list2))]
      [else #f]
      
)))

(define sublist?
  (lambda(lis1 lis2)
    (cond [(> (length lis1) (length lis2)) #f]
         [(beginning? lis1 lis2) #t]
         [else (sublist? lis1 (cdr lis2))]
         )))