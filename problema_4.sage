def product(A,u,v):
    r"""
    DESCRIPCIÓN:

        Verifica si es posible el producto entre los siguientes tres elementos: 'A', 'u' y 'v'.

    ENTRADA:

        - A   -   Matriz
        - u   -   Vector
        - v   -   Vector

    SALIDA:

        Devuelve el resultado obtenido.

    EJEMPLOS:

        # Caso 1

    AUTORES:

        Rodrigo Pantoja,
        Jocelyn Novelo,
        Miguel Ávila,
        Jorge Reyes
    """
    if (A.is_positive_definite() and len(u)==len(v) and len(v)==A.nrows()):
        return u*A*v
    elif (A.is_positive_definite()==false):
        print("La matriz A no es positiva definida")
        return E
    else:
        print("Las dimenciones de los datos proporcionados no son compatibles")
        return E


def proyOrt(A,u,v):
    r"""
    DESCRIPCIÓN:

        Proyecta la ortogonalización.

    ENTRADA:

        - A   -   Matriz
        - u   -   Vector
        - v   -   Vector

    SALIDA:

        Devuelve una cadena de resultados del producto.

    EJEMPLOS:

        # Caso 1

    AUTORES:

        Rodrigo Pantoja,
        Jocelyn Novelo,
        Miguel Ávila,
        Jorge Reyes
    """
    if (A.is_positive_definite() and len(u)==len(v) and len(v)==A.nrows()):
        resultado = []
        resultado.append(product(A,u,v)/product(A,v,v))
        resultado.append(resultado[0]*v)
        return tuple(resultado)
    elif (A.is_positive_definite()==false):
        print("La matriz A no es positiva definida")
        return E
    else:
        print("Las dimenciones de los datos proporcionados no son compatibles")
        return E

def coefFourier(A,B,v):
    r"""
    DESCRIPCIÓN:

        Determina la serie de Fourier de las matrices dadas.

    ENTRADA:

        - A   -   Matriz
        - B   -   Matriz
        - v   -   Vector

    SALIDA:

        Devuelve la serie de Fourier de las matrices dadas.

    EJEMPLOS:

        # Caso 1

    AUTORES:

        Rodrigo Pantoja,
        Jocelyn Novelo,
        Miguel Ávila,
        Jorge Reyes
    """
    if (A.is_positive_definite() and len(v)==A.nrows()):
        lista = []
        for i in B:
            aux = proyOrt(A,v,i)
            print(aux[0])
            lista.append(aux[0])
        return tuple(lista)
    elif (A.is_positive_definite()==false):
        print("La matriz A no es positiva definida")
        return E
    else:
        print("Las dimenciones de los datos proporcionados no son compatibles")
        return E

def ortogonalizar(A,B):
    r"""
    DESCRIPCIÓN:

        Construye a partir de un conjunto de vectores otro conjunto ortogonal de vectores que genere el mismo sub-espacio vectorial.

    ENTRADA:

        - A   -   Vector
        - B   -   Vector

    SALIDA:

        Conjunto de vectores

    EJEMPLOS:

        # Caso 1

    AUTORES:

        Rodrigo Pantoja,
        Jocelyn Novelo,
        Miguel Ávila,
        Jorge Reyes
    """
    if (A.is_positive_definite()):
        lista = []
        for i in B:
            vi = i                       #inicializa v'_i como v_i
            for j in lista:
                aux = proyOrt(A,i,j)     #hace la proyeccion ortogonal a lo largo de v_j
                vi = vi - aux[1]         #resta v_i-c*v'_j
            lista.append(vi)             #despues del ciclo queda como v'_i y lo agrega a la lista
        return lista
    elif (A.is_positive_definite()==false):
        print("La matriz A no es positiva definida")
        return E
    else:
        return "XD"


product?
#A=matrix(3,[1,0,0,0,1,0,0,0,1])
#a=vector([1,1,1])
#b=vector([0,1,1])
#c=vector([0,0,1])
#u=vector([1,2])
#v=vector([18,-6,-9])
#print(product(A,u,v))
#print(proyOrt(A,u,v))
#print(coefFourier(A,(a,b,c),v))
#print(ortogonalizar(A,(a,b,c)))
