%LA CUADRICULA DEL TETRIS TIENE 10 COLUMNAS X 16 FILAS

:- dynamic contador/2.

%en la columna x lanzar pieza
lanzarPiezaVertical(Columna):-
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    retractall(contador(Columna,N)),
    N4 is N + 4, %le sumo 4 ya que meto la pieza vertical
    N4 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N4)).

lanzarPiezaCuadrado(Columna):-
    \+ Columna = 10, %si la columna es 10 no se puede lanzar la pieza cuadrada
    Columna2 is Columna + 1,
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    contador(Columna2,N1),
    retractall(contador(Columna,N)),
    retractall(contador(Columna2,N1)),
    N2 is N + 2, 
    N3 is N1 + 2,
    N2 =< 16, %si no se sale de la cuadricula
    N3 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N2)),
    assert(contador(Columna2,N3)).

lanzarPiezaLDerecha(Columna):-
    \+ Columna = 10, %si la columna es 10 no se puede lanzar la pieza cuadrada
    Columna2 is Columna + 1,
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    contador(Columna2,N1),
    retractall(contador(Columna,N)), %parte vertical de la L
    retractall(contador(Columna2,N1)), %parte horizontal de la L
    N2 is N + 3, 
    N3 is N1 + 1,
    N2 =< 16, %si no se sale de la cuadricula
    N3 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N2)),
    assert(contador(Columna2,N3)).

lanzarPiezaLIzquierda(Columna):-
    \+ Columna = 1, %si la columna es 10 no se puede lanzar la pieza cuadrada
    Columna2 is Columna - 1,
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    contador(Columna2,N1),
    retractall(contador(Columna,N)), %parte vertical de la L
    retractall(contador(Columna2,N1)), %parte horizontal de la L
    N2 is N + 3, 
    N3 is N1 + 1,
    N2 =< 16, %si no se sale de la cuadricula
    N3 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N2)),
    assert(contador(Columna2,N3)).

imborrable:-
    contador(columna,N), N =:= 0. %N es igual a 0


borrarFila:-
    \+imborrable,
    decrementarTodos.


decrementarTodos:-
    decrementar(10),
    Columna1 is Columna - 1,
    decrementarTodos(Columna1).

decrementar(Columna):-
    contador(Columna,N),
    retractall(contador(Columna,N)),
    N1 is N - 1,
    assert(contador(Columna,N1)).

%Base de conocimientos
contador(1,0).
contador(2,0).
contador(3,0).
contador(4,0).
contador(5,0).
contador(6,0).
contador(7,0).
contador(8,0).
contador(9,0).
contador(10,0).