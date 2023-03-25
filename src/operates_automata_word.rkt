#lang racket

; Automata
(define my_automata '( 
                ((a 1 b) (a 0 a) (b 1 a) (b 0 b))  ; trans
                a                                   ; initial status
                (b)                                 ; final status
                ) 
)

; buscar transicion
(define (find_transition automata_transitions state letter)
    (if (null? automata_transitions)
        #f
        (let (  
                ; primer trio
                [i_transition (car automata_transitions)]
                ; el resto de la lista
                [transition_rest (cdr automata_transitions)]
            )
            (let (
                    ; estado de origen
                    [i_transition_status_from (car i_transition)]
                    ; letra
                    [i_transition_letter (cadr i_transition)]
                    ; estado destino
                    [i_transition_status_to (caddr i_transition)]
                )
                (if (and 
                        (equal? i_transition_status_from state) 
                        (equal? i_transition_letter letter))
                    i_transition_status_to
                    (find_transition transition_rest state letter)
                )
            )
        )
    )
)

; test find_transition
; (find_transition '( (a 1 b) (a 0 a) (b 1 a) (b 0 b) ) 'b 1)

(define (get_next_state automata letter current_state)
    (let (
            [automata_transitions (car automata)]
        )
        (let (
                [next_state (find_transition automata_transitions current_state letter)]
            )
            next_state
        )
    )
)

; ; test get_next_state
; (display "(get_next_state my_automata 1 'a)")
; (newline)
; (get_next_state my_automata 1 'a)

; (display "(get_next_state my_automata 1 'b)")
; (newline)
; (get_next_state my_automata 1 'b)

; (display "(get_next_state my_automata 0 'a)")
; (newline)
; (get_next_state my_automata 0 'a)

; (display "(get_next_state my_automata 0 'b)")
; (newline)
; (get_next_state my_automata 0 'b)


(define (operate_recursive automata word current_state)
    (let (
            [automata_finals (caddr automata)] ; estado final del automata (automata[2])
        )
        (if (null? word)
            ; si la palabra esta vacia, verificamos si el estado actual es final      
            (if [member current_state automata_finals] #t #f)
            ; si la palabra no esta vacia:
            (let (
                    [current_letter (car word)] ; current letter
                    [next_word (cdr word)] ; next word
                )
                (let (
                        [next_state (get_next_state automata current_letter current_state)] ; next state
                    )
                    (operate_recursive automata next_word next_state) ; recursive call
                )
            )
        )
    )
)


; (operate_recursive my_automata '() 'a)
; (operate_recursive my_automata '() 'b)
; (operate_recursive my_automata '(1) 'a)


(define (operate automata word)
    (let (
            [automata_initial (cadr automata)] ; estado inicial del automata (automata[1])
        )
        (operate_recursive automata word automata_initial)
    )
)


(define (test_operate my_automata word)
    (display "word: ")
    (display word)
    (newline)
    (display "operate automata")
    (newline)
    (display (operate my_automata word))
    (newline)
    (newline)
)

; Word
(define my_word '(0 1 0 1 1))


(test_operate my_automata my_word)

(test_operate my_automata '(0 1))

(test_operate my_automata '(0 0 0 1 1 1 0 0 1 0 0 1))
