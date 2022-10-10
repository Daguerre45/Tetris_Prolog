%LA CUADRICULA DEL TETRIS TIENE 10 COLUMNAS X 16 FILAS

%en la columna x lanzar pieza
lanzarPieza(Columna):-
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna
    retractall(contador(Columna,N)),
    N4 is N + 4, %le sumo 4 ya que meto la pieza vertical
    assert(contador(Columna,N4)).

imborrable:-
    contador(columna,N), N =:= 0. %N es igual a 0


borrarFila:-
    \+imborrable,
    decrementarTodos.


decrementarTodos:-
    decrementar(10).


decrementarTodos(0). % Caso base
decrementarTodos(Columna):-
    columna > 0,
    decrementar(Columna),
    Columna1 is Columna - 1,
    decrementarTodos(Columna1).


decrementar(Columna):-
    contador(Columna,N),
    retractall(contador(Columna,N)),
    N1 is N - 1,
    assert(contador(Columna,N1)).

%Base de conocimientos
