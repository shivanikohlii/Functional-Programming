Welcome to DrRacket, version 6.10 [3m].
Language: racket, with debugging; memory limit: 128 MB.
> (beginning? '(this is nested) '(this is (nested)))
#f
> (beginning? '(a b c) '(a b c d e))
#t
> (beginning? '(a b c) '(a b))
#f
> (beginning? '(ant box cow) '(ant box cow))
#t
> (beginning? '() '(1 2 3))
#t
> 