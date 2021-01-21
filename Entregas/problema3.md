# Modelos de Computación 20-21: Problema 3

###### Clara María Romero Lara

### Aplicación del lema de bombeo para lenguajes regulares  de generación de palíndromos:

|                  L = {u ∈ {0,1}* : u = u-1}                  |
| :----------------------------------------------------------: |
| *La cadena (leída de izda a dcha) se lee igual que la cadena invertida* |



#### Lema de bombeo:

> Sea `L` un conjunto regular, entonces existe una `n ∈ N` tal que `∀z ∈ L`, si `|z| \>= n`, entonces `z` se puede expresar de la forma `z = u v w` ,  donde:
>
> - `|uv| <= n`
> - `|v| > 1`
> - `(∀i >= 0)   u v^i w ∈ L`
>
> Además `n` puede ser el número de estados de cualquier autómata que acepte el lenguaje `L`



#### Demostración:

Suponemos una cadena `z = 0^n 1^n 0^n`.  Si este fuera un lenguaje regular para el cual existe una  `n ∈ N` tal que `∀z ∈ L`, si `|z| \>= n`, debería cumplir las tres propiedades que propone el lema de bombeo.

La longitud de nuestra cadena es `|z| = |0^n 1^n 0^n| = 3n` , donde `3n > n` y verifica que se puede expresar en forma ``z = u v w = 0^n 1^n 0^n`. Veamos las propiedades:

1. `|uv| <= n`. `u` y `v` deben de ser, como máximo, los `n` primeros ceros: de otra forma, incluíriamos un símbolo y no se cumpliría la propiedad, puesto que la longitud sería `|uv| = |0^n 1| = n+1`. Asumiendo eso, se cumple esta propiedad.

   En tal caso, podemos ya definir `u v w`:

   - `u = 0^k`, los `k` primeros ceros
   - `v = 0^l`, los `l` siguientes ceros
   - `w = 0^(n-k-l) 1^n 0^n`, los ceros restantes, todos los unos y todos los ceros tras los unos.

2. `|v| >= 1`. Entonces, si `v = 0^l` donde `l >= 1`, sabemos que al menos debe haber un cero.

3. `(∀i >= 0)   u v^i w ∈ L`. Bombeamos con `i=0`:

   ```
   u v^0 w = u w =  0^k 0^(n-k-l) 1^n 0^n
   
   0^k 0^(n-k-l) 1^n 0^n ∈ L? 
   
   Agrupamos ceros:
   0^k 0^(n-k-l) 1^n 0^n = 0^(n-l) 1^n 0^n
   
   Obtenemos 0^(n-l) 1^n 0^n donde l >= 1: por lo cual, no coincide con su inversa: la l hace que la cadena deje de ser un palíndromo.
   ```

   Hemos alcanzado la contradicción que demuestra que no, nuestro lenguaje no es regular.

   