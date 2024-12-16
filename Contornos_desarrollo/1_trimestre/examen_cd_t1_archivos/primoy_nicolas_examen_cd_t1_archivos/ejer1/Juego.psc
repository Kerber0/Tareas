Algoritmo Juego
	Escribir ' Quieres jugar un juego?' 
	Leer  Respuesta
	Si respuesta == 'Si'
		Entonces
		Escribir 'Ingrese el numero de intentos de juego:'
		Leer  Intentos
		Si Intentos == ' '
			Entonces
			Intentos <- 10
			
		FinSi
		Num <- azar(100)
		Escribir ' Elige un número para ganar'
		Leer ganador
		Mientras Intentos > 0
			Si num > ganador
				Escribir 'El numero es menor'
			FinSi
			Si num <  ganador
				Escribir 'El número es mayor'
			FinSi
			Si num == ganador
				Escribir 'Ganaste!'
			FinSi
		FinMientras
		
	SiNo
		Escribir ' La opción no es válida'
		
	FinSi
	

Fin Algoritmo

