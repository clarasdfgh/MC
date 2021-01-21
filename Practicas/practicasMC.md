# Modelos de Computación 20-21: Prácticas

###### Clara María Romero Lara



## Práctica 1: gramáticas libres y dependientes del contexto

#### Gramática libre de contexto

Trabajamos con la siguiente gramática *G = (V, T, P, S)* :

- Variables (V): 
  - `V = {S, A, B}`
- Símbolos terminales (T): 
  - `T = {a, b} `
- Reglas de producción (P): 
  - `S➛aB`
  - `S➛bA`
  - `A➛a`
  - `A➛aS  `
  - `A➛bAA  `
  - `B➛b  `
  - `B➛bS  `
  - `B➛aBB  `
- Símbolo de inicio (S): 
  - `S = {S}`

Iniciamos JFLAP y seleccionamos la opción `grammar`. Nos aparecerá un menú en el que introducir nuestra gramática:

![image-20210119171422521](/home/clara/.config/Typora/typora-user-images/image-20210119171422521.png)

Si seleccionamos la opción `test`, JFLAP nos confirma que se trata de una gramática libre de contexto.

![image-20210119171628545](/home/clara/.config/Typora/typora-user-images/image-20210119171628545.png)

Ahora vamos a introducir una cadena. Seleccionamos la opción `input > brute force parse`, introducimos la cadena y la ejecutamos con ` Start` y pulsando repetidas veces el botón `Step` para construir el árbol de derivación:

![image-20210119172052290](/home/clara/.config/Typora/typora-user-images/image-20210119172052290.png)

En el desplegable también podremos seleccionar la opción de verlo en formato de tabla:

![image-20210119172203689](/home/clara/.config/Typora/typora-user-images/image-20210119172203689.png)

El problema de las gramáticas libres de contexto es que, como podemos ver, incluso en una gramática así de simple  **JFLAP ha recorrido** **66 nodos** hasta encontrar las reglas de producción correctas. En gramáticas mayores esto es una gran cantidad de tiempo perdido en procesamiento.

#### Gramática dependiente del contexto

Trabajamos con la siguiente gramática *G = (V, T, P, S)* :

- Variables (V): 
  - `V = {S, X, Y}`
- Símbolos terminales (T): 
  - `T = {a, b, c} `
- Reglas de producción (P): 
  - `S➛abc`
  - `S➛aXbc`
  - `Xb➛bX`
  - `Xc➛Ybcc`
  - `bY➛Yb`
  - `aY➛aaX  `
  - `aY➛aa  `
- Símbolo de inicio (S): 
  - `S = {S}`



Introducimos nuestra gramática a JFLAP y comprobamos con `test` que se trata de una gramática dependiente del contexto:

![image-20210119175044841](/home/clara/.config/Typora/typora-user-images/image-20210119175044841.png)

![image-20210119175141439](/home/clara/.config/Typora/typora-user-images/image-20210119175141439.png)

La ejecutamos de nuevo con `input > brute force parse`:

![image-20210119175804579](/home/clara/.config/Typora/typora-user-images/image-20210119175804579.png)

Podemos seleccionar también la tabla de derivación:

![image-20210119175827370](/home/clara/.config/Typora/typora-user-images/image-20210119175827370.png)

Podemos ver, además, que se han generado nada más que 7 nodos para una cadena de longitud 6.



## Práctica 2: uso de analizadores léxicos

Vamos a crear un analizador léxico en código lex:

```c
minus	[a-z]
mayus	[A-Z]
num		[0-9]

abc		[{minus}|{mayus}]
alfanum [{abc}|{numero}]

signo	(\+)
prefijo	({signo}?{num}{11})
tfno	({num}{9})

dominio (\@{alfanum}+\.){1,2})
correo	({alfanum}+{dominio}{abc}{2,})

username("clara123"|"frankyyy"|"b0nez"|"nana")

%%
{prefijo}	{printf ("Prefijo válido: %s\n",  yytext);}
{tfno}		{printf ("Telefono válido: %s\n", yytext);}
{correo}	{printf ("Correo válido: %s\n",   yytext);}
{username}	{printf ("Usuario válido: %s\n",  yytext);}
.+			{printf ("Incorrecto: %s\n",      yytext);}
%%
int yywrap(){
	return 1;
}

int main(){
	yylex();
	return 1;
}
```

Con la siguiente orden pasaremos de `.l` a código c `.c`:

```bash
lex -o p2.c p2.l
```

 Y una vez es código c, podemos compilar con gcc normalmente:

```
gcc p2.c -o p2 
```

Finalmente, ejecutamos y vemos la salida:

```
+34123123123
Prefijo válido: +34123123123

123123123
Telefono válido: 123123123

clara123
Usuario válido: clara123

clara@asd.es
Correo válido: clara@asd.es
```



## Práctica 3: implementación de un codificador y su decodificador

Este codificador toma como entrada una cadena de ceros y unos y los codifica de la siguiente manera:

- **Para el primer símbolo:**
  - Si es un 0 se codifica como un 0
  - Si es un 1 se codifica como un 1
- **Para los demás símbolos:**
  - Si el anterior leído es un 0:
    - Si es un 0 se codifica como un 0
    - Si es un 1 se codifica como un 1
  - Si el anterior leído es un 1:
    - Si es un 0 se codifica como un 1
    - Si es un 1 se codifica como un 0

![image-20210119192101965](/home/clara/.config/Typora/typora-user-images/image-20210119192101965.png)

Lo ejecutamos con  `input > step ` con la cadena 1000101:

![image-20210119192801734](/home/clara/.config/Typora/typora-user-images/image-20210119192801734.png)

1. El primer caracter no cambia. ***1***000101
2. Anterior leído: 1. El cero cambia a uno *1**1***00101
3. Anterior leído: 0. El cero no cambia *11**0***0101
4. Anterior leído: 0. El cero no cambia *110**0***101
5. Anterior leído: 0. El uno no cambia *1100**1***01
6. Anterior leído: 1. El cero cambia a uno *11001**1***1
7. Anterior leído: 0. El uno no cambia *110011**1***

Comprobamos que el decodificador funciona pasándole la cadena resultado (*1100111*) y viendo que nos devuelve la original (*1000101*):

![image-20210119193929921](/home/clara/.config/Typora/typora-user-images/image-20210119193929921.png)



## Práctica 4: autómata con pila según el modelo de estados finales

Este autómata acepta cadenas ceros y unos, primero los ceros y luego los unos, en las que el número de ceros sea mayor o igual a el número de unos:

![image-20210119190407870](/home/clara/.config/Typora/typora-user-images/image-20210119190407870.png)

Vamos a introducir una cadena con esas características: 0011. Para ello, seleccionamos `input > step by state` y en el desplegable, `Final state`

![image-20210119190454938](/home/clara/.config/Typora/typora-user-images/image-20210119190454938.png)

Ahora comprobamos qué ocurre si introducimos una cadena incorrecta: 0111

![image-20210119190626317](/home/clara/.config/Typora/typora-user-images/image-20210119190626317.png)

Y finalmente, comprobamos que acepta como entrada la cadena vacía:

![image-20210119190532015](/home/clara/.config/Typora/typora-user-images/image-20210119190532015.png)