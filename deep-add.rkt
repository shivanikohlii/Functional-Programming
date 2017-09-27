#lang racket
;;Shivani Kohli
;Takes a list, adds just the numbers
;List -> number
;If the list is not null, it checks if the first element is a number and if it is, it adds the the first number to a recursive call of the rest of the list which will actually return the number. 
(define deep-add
  (lambda (s)
    (cond
          [( null? s) 0 ]
          [else
           (cond
             [(number? (car s)) (+(car s)(deep-add(cdr s)))]
             [else ;It checks if it is a list, if the first element is a list is calls the deep list add function on the first element and the rest of the list
              (cond
                [(list? (car s)) (+ (deep-list-add (car s)) (deep-list-add (cdr s))) ]
                [else (deep-add (cdr s))] ; It just drops the first value and calls the deep-add on the rest of the list
                )
              ]
             )
          ]  
                             
          )))
 
(define deep-list-add
  (lambda (s)
    (cond [(null? s)0] ; Checks if it is null. If it is, it returns zero. 
          [else
           (cond
             [(number? (car s)) (+ (car s)(deep-list-add(cdr s)))] ;If the first element is a number, it adds that to the recursiv call of the rest of the list
             [(list? (car s)) (deep-list-add (car s))] ;If it is a list, it calls the deep-list add function on the first element
             [else(deep-list-add (cdr s))]; Otherwise it calls the deep-list-add on the rest of the list. 
 
             )
           ]
          )))
