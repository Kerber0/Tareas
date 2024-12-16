""" Módulo que contiene funciones para calcular la serie de Fibonacci. """


def fibonacci_iterativa(limite):
    """
    Calcula y muestra la serie de Fibonacci hasta un número determinado de 
    términos usando un enfoque iterativo. Tambien retorna una lista con los
    terminos calculados
    """

    lista_fibonacci = [0, 1]
    primer_numero = 0
    segundo_numero = 1

    for _ in range(0, limite-2):
        fibonacci = primer_numero + segundo_numero
        lista_fibonacci.append(fibonacci)
        primer_numero = segundo_numero
        segundo_numero = fibonacci

    return lista_fibonacci


def fibonacci_recursiva(limite, serie=None):
    """
    Construye una lista de los primeros n términos de la serie de Fibonacci usando recursión.

    :param n: Número de términos de la serie de Fibonacci a generar.
    :param serie: Lista que almacena los términos generados (inicialmente vacía).
    :return: Lista con los términos de la serie de Fibonacci.
    """
    if serie is None:
        # Inicializamos la lista con los dos primeros términos de Fibonacci.
        serie = [0, 1]

    # Caso base: cuando la lista tiene 'límite' elementos, se retorna.
    if len(serie) >= limite:
        # Se retorna la lista con los 'límite' primeros términos.
        return serie[:limite]

    # Añadimos el siguiente término como la suma de los dos últimos.
    siguiente = serie[-2] + serie[-1]
    serie.append(siguiente)

    # Llamada recursiva para continuar llenando la lista.
    return fibonacci_recursiva(limite, serie)


def main():
    """
    Método principal para probar las funciones de la serie de Fibonacci.
    Los 20 primeros elementos de la serie de Fibonacci son:
    [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181]
    """

    limite = 20

    # Se recomienda probar con distintos valores de límite. Por ejemplo: 0, 1, 5...
    # y comparar con los valores proporcionados en el docstring de arriba

    # Serie de Fibonacci con método iterativo
    print("Cálculo de serie Fibonacci mediante método iterativo")
    print(fibonacci_iterativa(limite))

    # Serie de Fibonacci con método recursivo
    print("Cálculo de serie Fibonacci mediante método recursivo")
    print(fibonacci_recursiva(limite))


if __name__ == "__main__":
    main()
