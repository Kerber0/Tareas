Algoritmo Ej5
	num_bin<-0
	mult<-1
	Escribir 'Escribir numero decimal para convertir en binario:'
	Leer num_decim
	Mientras num_decim > 0 Hacer
		num_bin = num_bin + num_decim % 2 * mult
		num_decim<- trunc(num_decim / 2)
		mult<-mult*10
		Fin Mientras
	Escribir num_bin
FinAlgoritmo
