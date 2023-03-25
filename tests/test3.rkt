#lang racket

(cdr '(1 2 3 4 5))
; si tenemos una lista de trios
(define list '((1 1 a) (1 2 b) (2 1 A) (2 1 B)))
; y queremos obtener el ultimo elemento del trio teniendo los dos primeros
(define (buscar my_list p1 p2)
    (if (null? my_list)
        #f
        (let (  
                ; primer trio
                [item (car my_list)]
                ; el resto de la lista
                [my_list_rest (cdr my_list)]
            )
            (let (
                    ; el primer elemento del trio
                    [item_1 (car item)]
                    ; el segundo elemento del trio
                    [item_2 (cadr item)]
                    ; el tercer elemento del trio
                    [item_3 (caddr item)]
                )
                (if (and (equal? item_1 p1) (equal? item_2 p2))
                    item_3
                    (buscar my_list_rest p1 p2)
                )
            )
        )
    )
)

(display "(buscar list 1 1)")
(newline)
(display (buscar list 4 1))
(newline)
