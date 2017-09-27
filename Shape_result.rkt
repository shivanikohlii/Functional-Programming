;Shivani Kohli
;Question: ;Write a function shape which takes a list as a parameter and returns a list in which all atoms have been removed.
;That is, the parentheses should still all be there, but nothing else. One could imagine doing this by turning the list into a string and deleting everything except the parentheses. You shouldn't do that, but rather use standard list manipulation functions (like we have been doing) to produce the answer.
;This function is a bit tricky, but work out different cases by hand and think about how to turn that into Scheme.

Welcome to DrRacket, version 6.10 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (shape '())
'()
> (shape '(1))
'()
> (shape '((1)))
'(())
> (shape '((1) 2))
'(())
>   (shape '((a 34)(b 77)(g 6)) )
'(() () ())
>   (shape '(a b c) )
'()
> (shape '(() a ((c () x)())) )
'(() ((()) ()))
> 