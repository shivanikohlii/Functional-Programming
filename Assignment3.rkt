;;Ryan Thomas and Shivani Kohli

#lang plai
(define-type CWAE
  [num (n number?)]
  [add (lhs CWAE?) (rhs CWAE?)]
  [sub (lhs CWAE?) (rhs CWAE?)]
  [mul (lhs CWAE?) (rhs CWAE?)]
  [div (lhs CWAE?) (rhs CWAE?)]
  [negative(n CWAE?)]
  [with (name symbol?) (named-expr CWAE?) (body CWAE?)]
  [if< (lhs CWAE?) (rhs CWAE?)(t-val CWAE?)(t2-val CWAE?) ]
  [id (name symbol?)]
)

; calc : CWAE --> number
;; evaluates CWAE expressions by reducing them to numbers
(define (calc expr)
  (type-case CWAE expr
     [num (n) n]
     [add (l r) (+ (calc l) (calc r))]
     [sub (l r) (- (calc l) (calc r))]
     [mul (l r) (* (calc l) (calc r))]
     [div (l r) (/ (calc l) (calc r))]
     [negative (n) (* -1 (calc n))]
     [with (bound-id named-expr bound-body)
           (calc (subst bound-body bound-id (num (calc named-expr))))]
     [if< (l r t-val t2-val) (if (< (calc l) (calc r)) (calc t-val) (calc t2-val))]
     [id (v) (error 'calc "free identifier")]
  ))

;; parse : sexp -> CWAE
;; to convert s-expressions into CWAEs
(define (parse sexp)
  (cond [(number? sexp) (num sexp)]
        [(symbol? sexp) (id sexp)]
        [(list? sexp)
         (case (first sexp)
           [(+) (cond
                  [(> (length sexp) 3) ((error 'parse "Length list is too long"))]
                  [(< (length sexp) 3) ((error 'parse "Length list is too short"))]
                  [else
                     (add (parse (second sexp))
                     (parse (third sexp)))])]
           [(-) (cond
                  [( = 2 (length sexp))(negative (parse (second sexp)))]
                  [(> (length sexp) 3) ((error 'parse "Length of list is too long"))]
                  [(< (length sexp) 3) ((error 'parse "Length of list is too short"))]
                  [else (sub (parse (second sexp))
                     (parse (third sexp)))])]
            [(*) (cond
                  [(> (length sexp) 3) ((error 'parse "Length of list is too long"))]
                  [(< (length sexp) 3) ((error 'parse "Length of list is too short"))]
                  [else
                     (mul (parse (second sexp))
                     (parse (third sexp)))])]
            [(/) (cond
                  [(> (length sexp) 3) ((error 'parse "Length of list is too long"))]
                  [(< (length sexp) 3) ((error 'parse "Length of list is too short"))]
                  [else
                     (div (parse (second sexp))
                     (parse (third sexp)))])]
           
           [(with)(cond
                    [(not (= 3 (length sexp))) (error 'parse "With was incorrectly used")]
                    [(and (list? (second sexp)) (= 2 (length (second sexp))))
                    (with (first (second sexp))
                         (parse (second (second sexp)))
                         (parse (third sexp)))])]
           [(if<)
            (if< (parse (second sexp)) (parse (third sexp)) (parse (fourth sexp)) (parse (fifth sexp)))]
           [else (error 'parse "unkown operator")]
           )]     
   ))

(define(subst expr sub-id val)
    (type-case CWAE expr
        [num (n) expr]
        [add (l r) (add (subst l sub-id val) (subst r sub-id val))]
        [sub (l r) (sub (subst l sub-id val) (subst r sub-id val))]
        [mul (l r) (mul (subst l sub-id val) (subst r sub-id val))]
        [div (l r) (div (subst l sub-id val) (subst r sub-id val))]
        [negative (n) (negative(subst n sub-id val))]
        [if< (l r t-val t2-val) (subst l sub-id val) (subst r sub-id val) (subst t-val sub-id val) (subst t2-val sub-id val)]
        [with (bound-id named-expr bound-body)
              (if (symbol=? bound-id sub-id)
                 expr
                 (with bound-id named-expr (subst bound-body sub-id val)))
        ]
        [id (v) (if (symbol=? v sub-id) val expr)]
   ))



