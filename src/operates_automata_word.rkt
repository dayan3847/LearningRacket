#lang racket

; Word
(define word '(0 1 0 1 1))
; Automata
(define automata '(((a 1 b) (a 0 a) (b 1 a) (b 0 b)) a (b) ))
; Automata transitions
(define automata_transitions (car automata))
; Automata initial state
(define automata_initial (cadr automata))
; Automata final states
(define automata_finals (caddr automata))

; display automata_transitions
(display "automata transitions: ")
(display automata_transitions)
(newline)
; display automata_initial
(display "automata initial: ")
(display automata_initial)
(newline)
; display automata_finals
(display "automata finals: ")
(display automata_finals)
(newline)

(define (next automata current_state letter)
    (define automata_transitions (car automata))
    (define next_state (caddr (assoc (list current_state letter) automata_transitions)))
    next_state
)

(define (operate automata current_state word)
    (define automata_finals (caddr automata))
    (cond
        ([null? word] ; if word is empty
            (cond
                ([member current_state automata_finals] #t) ; if current state is final
                (else #f) ; if current state is not final
            )
        )
        (else ; if word is not empty
            (let (
                [current_letter (car word)] ; current letter
                [next_word (cdr word)] ; next word
                [next_state (caddr (assoc current_word automata_transitions))] ; next state
                )
                (operate automata next_state next_word) ; recursive call
            )
        )
    )
)

(display "no word in state a: ")
(operate automata 'a '())
(newline)
(display "no word in state b: ")
(operate automata 'b '())
(newline)

;(define transiciones (car automata))
;(define inicial (cadr automata))
;(define finales (caddr automata))
;(verifica transiciones inicial finales palabra))
;(opera automata palabra)
