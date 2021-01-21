# Modelos de Computación 20-21: Problema 1

###### Clara María Romero Lara

### Obtener la gramática para el lenguaje de palíndromos de orden par siguiente:

| L = {uu-1 \| u ∊ {a,b}\*} |
| :-----------------------: |
|     G = {V, T, P, S}      |

- **Variables (V):**

  > V = {E}

  

- **Símbolos terminales (T):** 

  > T = {a,b}

  

- **Reglas de producción (P):**

  > P = { E ➛    a S a
  >
  > ​		 E ➛	b S b	
  >
  > ​		 E ➛    ε
  >
  > ​       }

  

- **Símbolo de inicio (S):**

  > S = {E}



###### Ejemplo:

| aSa ➛ abSba ➛ abbSbba ➛ abbεbba ➛ abbbba |
| :--------------------------------------: |
|    *Hemos aplicado aSa, bSb, bSb, ε*     |



