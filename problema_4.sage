def product(A,u,v):
    r"""
    DESCRIPCIÓN:
        Verifica que la matriz dada sea positiva negativa, 
        Calcula el producto interno de dos vectores 'u' y 'v'
    ENTRADA:
        - A   -   Matriz
        - u   -   Vector
        - v   -   Vector
    SALIDA:
        Devuleve un número, el producto de 'u' y 'v'
    EJEMPLOS:
    
    ::
        # Caso 1
        
        Entrada:
        
        A = [[1,0],[0,1]]
        u = [1,1]
        v = [1,1]
        
        Salida:
            
            > 2
            
            ::
            
        # Caso 2
        
        Entrada:
        
        A = [[1,0],[0,1]]      
        u = [1,2,1]
        v = [1,1]
        
        Salida:
        
            > Las dimenciones de los datos proporcionados no son compatibles
            
            ::
            
       # Caso 3
       
           Entrada:
           
                        A = [[1,1],[1,1]]
                        u = [7, -4, 5]
                        v = [3, 3, 4]
           
           Salida:
           
               > La matriz A no es positiva definida
               
           ::
       
       # Caso 4
       
           Entrada:
           
                    A = [[7,2],[2,1]]
                    u = [4,4]
                    v = [1,5]
           
           Salida:
           
               > 96
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
        Calcula la proyección ortogonal de 'u' sobre 'v'
    ENTRADA:
        - A   -   Matriz
        - u   -   Vector
        - v   -   Vector
    SALIDA:
        Devuelve (c, w), donde 'c' es el coeficiente de Fourier de 'u' con respecto a 'v'. 'w' es un vector, la proyección ortogonal de 'u' sobre 'v'.
    EJEMPLOS:
    
        ::
        # Caso 1
        
            Entrada:
            
                A = [[1,0],[0,1]]
                u = [-3, 9]
                v = [ 1, 2]
            
            Salida:
            
                > (3, (3, 6))
                
        ::
       
       # Caso 2
       
           Entrada:
           
               A = [[1,0],[0,1]]
               u = [7, -4, 5]
               v = [2, -1, 2]
           
           Salida:
           
               > Las dimenciones de los datos proporcionados no son compatibles
               
       ::        
               
       # Caso 3
       
           Entrada:
           
               A = [[1,1,1],[0,0,0]]
               u = [5, 7 , 2]
               v = [2, 5, 5]
           
           Salida:
           
               > La matriz A no es positiva definida
       
       ::
       
      # Caso 4
       
           Entrada:
           
               A = [[7,2],[2,1]]
               u = [1,1]
               v = [2,2]
           
           Salida:
           
               > (1/2, (1, 1))
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
        Calcula los coeficientes de Fourier de 'v' con respecto a la base ortogonal.
    ENTRADA:
        - A   -   Matriz
        - B   -   Conjunto ortogonal
        - v   -   Vector
    SALIDA:
        Devuelve la lista 'c_1,...,c_r', donde c_i es el coeficiente de Fourier de 'v' con respecto a la base ortogonal.
    EJEMPLOS:
        ::
        # Caso 1
        
           Entrada:
           
               A = [[1,0],[0,1]]
               B = {[1,2,2],[2,-2,1],[2,1,-2]}
               v = [3,4,5]
           
           Salida:
           
               > Las dimenciones de los datos proporcionados no son compatibles
        ::
        # Caso 2
        
            Entrada: 
            
                A = [[7,2],[2,1]]
                B = {[1,1],[1,-1],[0,1]}
                v = [2,1]
                
            Salida:
            
                >  (7/4, 11/4, 5)
        
        ::
        
        # Caso 3
        
            Entrada:
            
                A = [[2,2,1],[2,1,1]]
                B = {[1,1,0],[1,-1,1],[0,1,0]}
                v = [2,1,2]
            
            Salida:
            
                > La matriz A no es positiva definida
        
        ::
        
        # Caso 4
        
            Entrada:
            
                A = [[1,0],[0,1]]
                B = {[1,-1],[-1,1],[1,1]}
                v = [1,1]
            
            Salida:
            
                >    (0, 0, 1)
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
        Aplica el proceso de ortogonalización de Gram - Schmidt
    ENTRADA:
        - A   -   Matriz
        - B   -   Colección de vectores linealmente independientes
    SALIDA:
        Devuelve una lista de vectores, obtenida al aplicar el proceso de Gram - Schmidt
    EJEMPLOS:
        ::
        # Caso 1
        
            Entrada:
            
                A = [[1,1,1],[1,0,1]]
		B = ([1,0,0],[1,-1,0],[1,0,1])
                
            Salida:
            
                > La matriz A no es positiva definida
        ::
        
        # Caso 2
        
            Entrada:
            
                A = [[1,0],[0,1]]
		B = ([1,2],[2,1],[1,1])
            
            Salida:
            
                > [(1, 2), (6/5, -3/5), (0, 0)]
        
        ::
        
        # Caso 3w
        
            Entrada:
            
                A = [[7,2],[2,1]]
		B = ([1,0],[0,1],[2,2])
            
            Salida:
            
                > [(1, 0), (-2/7, 1), (0, 0)]
        
        ::
        
        # Caso 4
        
            Entrada:
            
                A = [[2, 2],[2,4]]
		B = ([1,2],[2,3],[3,4])
            
            Salida:
            
                > [(1, 2), (5/13, -3/13), (0, 0)]
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
    else:
        print("La matriz A no es positiva definida")
        return E