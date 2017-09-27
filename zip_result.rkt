;Shivani Kohli
;Question:Write a function zip which takes two lists as parameters and returns a list of pairs where the first pair consists of the first elements of the two parameters,
;the second pair has the second elements of the parameters, etc. If the lists are not the same length, you should use the builtin function error to report an error.
Welcome to DrRacket, version 6.10 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (zip '(1) '())
. . zip: second list is too short
> (zip '() '())
'()
> (zip '(1) '(2))
'((1 2))
> (zip '(1 2) '(a b))
'((1 a) (2 b))
>   (zip '(a b c d e) '(32 7 10 3 1) )
'((a 32) (b 7) (c 10) (d 3) (e 1))
>  (zip '((a b) c (d e f)) '(c (a) (b c)) )
'(((a b) c) (c (a)) ((d e f) (b c)))
>  (zip '(1 2 -3) '(50 40 30 20))
. . zip: first list is too short
> 