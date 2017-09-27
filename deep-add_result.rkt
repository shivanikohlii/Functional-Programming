Question: Write a function deep-add which takes a list as a parameter and computes the sum of all numbers which appear anywhere in the list or in sublists.
You may find it useful to know that Scheme has a function number? which returns #t if its argument is numeric atom and #f otherwise.

Welcome to DrRacket, version 6.10 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (deep-add '(these (arent 77) (all 32 (numbers 93 here))))
202
> (deep-add '())
0
> (deep-add '(1 2))
3
> (deep-add '(1 2 3))
6
> (deep-add '(((1)) 2 3))
6
>   (deep-add '(5 a b 8 2))
15
> (deep-add '((4 (6 1)) 2 3 (4)))
20
> (deep-add '(no numbers here))
0
> 