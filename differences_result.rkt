;Shivani Kohli
;Question  One way to study a sequence of numbers is to compute the differences between successive terms.
;If you reach all zeros after k steps, it means the original sequence can be generated by a degree k polynomial. Write a function differences which takes a list of numbers as a parameter and returns the list of differences.
;That is, a list containing the second minus the first, third minus the second, etc.
Welcome to DrRacket, version 6.10 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (differences '())
'()
> (differences '(1))
'()
> (differences '(1 2))
'(1)
> (differences '(2 7 10 3 6))
'(5 3 -7 3)
> (differences '(1 3))
'(2)
> (differences '())
'()
>   (differences '(1 2 -3 -4 7 12))
'(1 -5 -1 11 5)
> (differences '(-1 -2 -3))
'(-1 -1)
> 