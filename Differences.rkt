#lang racket
;Shivani Kohli
;Gives the difference of subsequent numbers so subtracts index(2) from index(1)
; difference list -> list
(define differences
  (lambda (s)
    (cond [(null? s) '()] ;IF list is null return empty parenthesis.
          [(<= (length s) 1)'()] ;If the list size is less than or equal to 1, it rerurns the parenthesis
          [else(cons(- (cadr s)(car s))(differences (cdr s)))] ; otherwise it cons the difference of the first element of the list with the second and the recursive call of  differences on the rest of the list. 
          )))