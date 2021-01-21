# Modelos de Computación 20-21: Problema 4

###### Clara María Romero Lara

### Para un lenguaje libre contexto, comprobar si una gramática para el lenguaje es ambigua:

> Encontrar dos árboles de derivación distintos para una misma cadena del lenguaje

Tomemos la siguiente gramática *G = {V, T, P, S}*:

- Variables (V): 
  - `V = {E}`
- Símbolos terminales (T): 
  - `T = {x, y, +, *, ), (} `
- Reglas de producción (P): 
  - `E➛xEx`
  - `E➛xEy`
  - `E➛(E)`
  - `E➛E+E  `
  - `E➛E*E  `
  - `E➛x  `
  - `E➛y  `
  - `E➛ε  `
- Símbolo de inicio (S): 
  - `S = {E}`



























Demostremos con árboles de derivación cómo la cadena `(x+x) * y` es ambigua:

|                    Árbol de derivación A                     |                    Árbol de derivación B                     |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="/home/clara/Documents/MC/Entregas/8807b41f-b97c-409a-a76e-5f06e8fe8327.png" style="zoom:80%;" /> | <img src="/home/clara/Documents/MC/Entregas/740c7537-e12e-4942-8484-90f0ed183f47.png" style="zoom:80%;" /> |



