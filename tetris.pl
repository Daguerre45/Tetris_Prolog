
lanzarPieza(Columna):-
    contador(Columna,N),
    retractall(contador(Columna,N)),
    N4 is N + 4,
    assert(contador(Columna,N4)).

imborrable:-
    contador(Columna,N), N =:= 0.

borrarFila:-
    \+imborrable,
    decrementarTodos.

decrementarTodos:-
    decrementar(10).

decrementarTodos(0).
decrementarTodos(Columna):-
    Columna > 0,
    decrementar(Columna),
    Columna1 is Columna - 1,
    decrementarTodos(Columna1).

decrementar(Columna):-
    contador(Columna,N),
    retractall(contador(Columna,N1)),
    N1 is N - 1,
    assert(contador(Columna,N1)).
    