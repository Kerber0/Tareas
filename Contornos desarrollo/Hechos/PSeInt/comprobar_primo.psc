Algoritmo comprobar_primo
	
Definir num, iterador Como Entero
Definir es_primo Como Logico
	
	
es_primo<-Verdadero
Escribir "Introduzca un número: "	
Leer num


Si num % 2 = 0 Entonces
	Escribir "No s primo por que es divisible por 2"
	es_primo <- Falso
FinSi
	
Si es_primo = Verdadero Entonces
	Para iterador <- 3 Hasta num -1 Con Paso 2 Hacer
		Si num % iterador = 0 Entonces
			Escribir "No es primo porque es divisible por " iterador
			es_primo <- Falso
		FinSi
	FinPara
FinSi

si es_primo = Verdadero Entonces
	Escribir "El número es primo"
FinSi

FinAlgoritmo
