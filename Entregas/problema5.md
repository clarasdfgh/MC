# Modelos de Computación 20-21: Problema 5

###### Clara María Romero Lara

### Implementación y ejecución de un autómata con pila para un lenguaje libre de contexto:

#### Implementación:

Desde JFLAP seleccionamos la opción `Pushdown Automaton` y en el desplegable elegimos `Multiple character input`.

![image-20210118173559029](/home/clara/.config/Typora/typora-user-images/image-20210118173559029.png)

Definimos los estados (q0 y q1) y editamos nuestro autómata:

![image-20210118174723897](/home/clara/.config/Typora/typora-user-images/image-20210118174723897.png)

#### Ejecución:

Este autómata acepta de entrada cadenas de 0 y 1 en las que el número de 1 es igual al número de 0. Desde el menú `Input`, `Step by State` introducimos la entrada, que debe cumplir con esta propiedad: hemos escogido 0011. Seleccionamos en el desplegable la opción `Accept by: empty stack`

![image-20210118175635212](/home/clara/.config/Typora/typora-user-images/image-20210118175635212.png)

![image-20210118175813377](/home/clara/.config/Typora/typora-user-images/image-20210118175813377.png)

La pila ha comenzado con el símbolo tope Z dentro. Le damos a `Step`, y empezará a leer símbolos de la cinta de entrada.

![image-20210118180131619](/home/clara/.config/Typora/typora-user-images/image-20210118180131619.png)

El autómata podría escoger entre dos reglas: la regla `λ,Z ;λ `, y la regla `0,Z; XZ` . La que nos interesa para la cadena introducida es la segunda: el 0 lo recibe de la cinta de entrada, y la Z estaba en la pila.

![image-20210118180230738](/home/clara/.config/Typora/typora-user-images/image-20210118180230738.png)

En este paso aplicamos la misma regla para el siguiente cero: sustituye la Z por XZ. Con esto hemos leído los ceros.

![image-20210118181137332](/home/clara/.config/Typora/typora-user-images/image-20210118181137332.png)

Vamos a empezar a leer los unos. La regla aplicada sería `1,x;λ `, saca la primera X.

![image-20210118181239485](/home/clara/.config/Typora/typora-user-images/image-20210118181239485.png)

Se lee el siguiente 1, se saca la última X de la pila. Hemos terminado de leer la cadena, así que la única regla que podríamos aplicar sería `λ,Z;λ `. Termina la ejecución y, al pulsar por última vez `Step` vemos que la cadena introducida era correcta.

![image-20210118184604113](/home/clara/.config/Typora/typora-user-images/image-20210118184604113.png)

![image-20210118184938894](/home/clara/.config/Typora/typora-user-images/image-20210118184938894.png)