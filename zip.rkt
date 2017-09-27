#lang racket
;Shivani Kohli
;zip list -> pair
;Upon given two lists returns pairs of the first two elements of the list. 
(define zip
  (lambda (s t) ;Takes two list
    (cond [(and (null? s)( null? t)) '()] ;checks to see if both list are empty and returns empty list
          [( < (length s)(length t)) (error 'zip "first list is too short")] ;error messages if the list are of unequal sizes
          [( > (length s)(length t)) (error 'zip "second list is too short")]
          [else(cons(list (car s) (car t)) (zip (cdr s) (cdr t)))] ;joins the first element of both the lists and recursively calls the rest of the list for both and joins them and
          ;Puts the over all result together
          )))