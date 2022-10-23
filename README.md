# TETRIS EN PROLOG

## CÓMO FUNCIONA
##### Tendremos un escenario imaginado,el cual está compuesto por 16 filas y 10 columnas, sobre este escenario nosotros iremos colocando nuestras piezas a lo largo del juego. En esta versión del código, solo está la implementación de añadir piezas verticales, añadir cuadrados y añadir las L tanto mirando a la derecha como a la izquierda. Estas fichas no se podrán rotar en ningún momento y una vez dejes un hueco dentro del escenario por cualquier motivo, no podrás rellenar ese hueco con otra ficha.

## PARA EJECUTARLO
##### Tendrás que instalarte prolog en tu SSOO, una vez realizado esa descarga, tendrá que acceder desde un terminal a la carpeta donde se ha clonado el repositoorio y una vez ahi para poder compilar y poder hacer consultas tendrá que poner lo siguiente
 1.
 ```cmd
 swipl tetris.pl
 ```
 2.
  ```cmd
['tetris.pl'].
 ```
##### Una vez realizado estos dos pasos ya podrá hacer consultas. Si en algún momento se cambia el códgo se deberá repetir el paso 2 antes de realizar la consulta

### FICHA VERTICAL 
![Image text](https://github.com/Daguerre45/Tetris_Prolog/blob/main/im%C3%A1genes/pieza_vertical.png)

Para lanzar una pieza vertical lo que haremos será pasarle únicamente la columna en la que se quiere colocar la pieza, y lo que hace es mediante un contandor ver si hay alguna pieza debajo o no, es decir, el contador almacena el número de huecos que están ocupados en la columna por otras fichas o por huecos vacíos donde no se van a poder añadir piezas, si este contatador te permite añadir la pieza la pieza vertical se colocará.


```cmd
lanzarPiezaVertical(1). %Lanza la pieza vertical en la columna 1
```
```prolog
lanzarPiezaVertical(Columna):-
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    retractall(contador(Columna,N)),
    N4 is N + 4, %le sumo 4 ya que meto la pieza vertical
    N4 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N4)).
```


### FICHA CUADRADO
![Image text](https://github.com/Daguerre45/Tetris_Prolog/blob/main/im%C3%A1genes/pieza_cuadrado.png)

Para lanzar la pieza cuadrada lo que haremos será pasarle nuevamente una columna en la que se quiere colocar la pieza, dicha columna será donde se coloque la parte izquierda del cubo. Al confugurarlo de dicha manera esta pieza no se puede poner en la columna 10 ya que se saldría del tablero y ocuparía parte de la columna 10 y de la columna 11, la cual es inexistente. Luego lo que hace es coger la columna que tiene a la derecha para poder añadir los dos huecos que ocupa el cuadrado en cada columna. 


```prolog
lanzarPiezaCuadrado(Columna):-
    \+ Columna = 10, %si la columna es 10 no se puede lanzar la pieza cuadrada
    Columna2 is Columna + 1,
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    contador(Columna2,N1),
    retractall(contador(Columna,N)),
    retractall(contador(Columna2,N1)),
    N2 is N + 2, %le sumo 2 ya que meto los 2 horizontales
    N3 is N1 + 2, %le sumo 2 ya que meto los 2 verticales
    N2 =< 16, %si no se sale de la cuadricula
    N3 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N2)),
    assert(contador(Columna2,N3)).
```
### FICHA L
![Image text](https://github.com/Daguerre45/Tetris_Prolog/blob/main/im%C3%A1genes/pieza_Lderecha.png)
![Image text](https://github.com/Daguerre45/Tetris_Prolog/blob/main/im%C3%A1genes/pieza_Lizquierda.png)

Para lanzar una pieza en forma de L tanto sea hacia la derecha como hacia la izquierda seguiremos la mísma técnica del cubo, le pasaremos una columna que será donde se coloque la parte vertical de la pieza y dependiendo de si es hacia la derecha o hacia la izquierda la L pues sumareos una columna o se la restaremos para sumar al contador ambas partes de la pieza.

```prolog
lanzarPiezaLDerecha(Columna):-
    \+ Columna = 10, %si la columna es 10 no se puede lanzar la pieza cuadrada
    Columna2 is Columna + 1,
    contador(Columna,N), %N es el numero de huecos que hay ocupados en la columna EN REALIDAD ES (X,Y)
    contador(Columna2,N1),
    retractall(contador(Columna,N)), %parte vertical de la L
    retractall(contador(Columna2,N1)), %parte horizontal de la L
    N2 is N + 3, %le sumo 3 ya que meto los cuadrados verticales
    N3 is N1 + 1, %le sumo 1 ya que le meto el cuadrado hacia la derecha
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
    N2 is N + 3, %le sumo 3 ya que meto los cuadrados verticales
    N3 is N1 + 1, %le sumo 1 ya que le meto el cuadrado hacia la izquierda
    N2 =< 16, %si no se sale de la cuadricula
    N3 =< 16, %si no se sale de la cuadricula
    assert(contador(Columna,N2)),
    assert(contador(Columna2,N3)).
```
## Autores

- <span style="color:grey">**@Daguerre45 -> Alberto Daguerre Torres**</span>
- <span style="color:grey">**@pblrvo -> Pablo Rivero**</span>
