Algoritmo Fechadecumpleanios
	anioactual<- 2024
	mesactual<-09
	diaactual<-30
	Escribir 'Escribir a�o de nacimiento:'
	Leer anionacim
	Si anionacim <= 1880 Entonces
		Escribir 'Fecha introducida invalida'
		Repetir
			Escribir 'Vuelva a escribir el a�o de nacimiento:'
			Leer anionacim
		Hasta Que anionacim > 1880
		Fin Si
	Escribir 'Escribir mes de nacimiento:'
	Leer mesdenacim
	Escribir 'Escribir d�a de nacimiento:'
	Leer dianacim
	edad<- anioactual- anionacim
	Si (mesdenacim > mesactual) o (mesdenacim == mesactual y dianacim > diaactual)
			Escribir edad-1
		SiNo
			Escribir edad
		Fin Si
	
FinAlgoritmo

