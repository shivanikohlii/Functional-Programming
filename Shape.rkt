#lang racket
;;Shivani Kohli
;;Takes in a list gives up the () without the atoms in it
; List -> '()

(define shape
  (lambda (lat) ; Takes list as input
        (cond [(null? lat)lat][(not (list? (car lat))) (shape (cdr lat))] ;Checks if list is empty, if yes returns the list, checks if the first element of lat is not a list, recursively calls shape on the rest of the list
              [else (cons (shape (car lat)) (shape (cdr lat)))] ;Otherwise combines the recrusive call to the first element of the list and rest of the list
              )))