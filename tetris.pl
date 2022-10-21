
%LA CUADRICULA DEL TETRIS TIENE 10 COLUMNAS X 16 FILAS

:- dynamic casillaOcupada/2.

%en la columna x lanzar pieza
lanzarPiezaVertical(Columna):-
    lanzamientoValido(Columna, Fila),
    lanzarPiezaVertical(Columna, Fila).

lanzarPiezaVertical(Columna, Fila) :-
    assert(casillaOcupada(Columna, Fila)),
    F1 is Fila + 1,
    assert(casillaOcupada(Columna, F1)),
    F2 is Fila + 2,
    assert(casillaOcupada(Columna, F2)),
    F3 is Fila + 3,
    assert(casillaOcupada(Columna, F3)).

lanzamientoValido(1,1).

lanzamientoValido(Columna, Fila) :-
    \+(casillaOcupada(Columna, Fila)),
    \+(casillaOcupada(Columna, 17)),
    ocupadasLasDeAbajo(Columna, Fila).

ocupadasLasDeAbajo(Columna, Fila) :-
    casillaOcupada(Columna, Fila-1).
    
imborrable:-
    contador(columna,N), 
    N =:= 0. %N es igual a 0

borrarFila:-
    \+imborrable,
    decrementarTodos.

decrementarTodos:-
    decrementar(10).


decrementarTodos(0). % Caso base
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

%Base de conocimientos

casillaOcupada(1, 0).
casillaOcupada(2, 0).
casillaOcupada(3, 0).
casillaOcupada(4, 0).
casillaOcupada(5, 0).
casillaOcupada(6, 0).
casillaOcupada(7, 0).
casillaOcupada(8, 0).
casillaOcupada(9, 0).
casillaOcupada(10,0).

