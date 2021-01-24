def conjunto_g(R,o,t): 
    r"""
    DESCRIPCIÓN:

        Determina un conjunto generador para un subespacio 'W', el cual está definido por una matriz de relaciones.

    ENTRADA:

        - R   -   Matriz de relaciones
        - o   -   Número para indicar el tipo de subespacio 
        - t   -   Tamaño de las matries cuando 'o' sea igual a 3

    SALIDA:

        Devuelve un conjunto generador para el subespacio

    EJEMPLOS:

        # Caso 1 
        
        Entrada:
        
        R =
            | 1,  0,  8 |
            | 1, -2,  1 |
            |-1,  1, -4 |
            |-2,  4, -1 |
            
         o = 1
         t = 1
         
         Salida:
        
            La matriz de relaciones es linealmente independiente, la unica solucion es el vector 0
            
            
       # Caso 2
       
       Entrada:
       
       R = 
           [1, 1, 1,  1]
           [1,-1, 9, -5]
       
       o = 3
       o = 4
       
       Salida:
       
            [ 5]
            [-4]
            [-1]
            [ 0]

            [-2]
            [ 3]
            [ 0]
            [-1]

    AUTORES:

        Rodrigo Pantoja,
        Jocelyn Novelo,
        Miguel Ávila,
        Jorge Reyes
    """
    n=R.nrows(); #Numero de filas
    m=R.ncols(); #Numero de columnas
    
    ER=R.rref();          #La pasa a su forma reducida
def conjunto_g(R,o,t): 
    n=R.nrows(); #Numero de filas
    m=R.ncols(); #Numero de columnas
    
    ER=R.rref();          #La pasa a su forma reducida
    
    piv_col=list(ER.pivots());          #Regresa la lista de las columnas de los pivotes (aka las columnas basicas)
    
    n_libres=m-len(piv_col);      #Guarda unicamente el numero de columnas de variables libres
    lista_vectores=[]             #Guardar los vectores
    free=[];                      #Inicializa para guardar las columnas de variables libre
    vacio=[]
    if n_libres==0:       #compara si no hay variables libres
        print("La matriz de relaciones es linealmente independiente, la unica solucion es el vector 0")
    else:                                #Si no
        for k in range(m):
            vacio.append(0)
        filas_matriz=ER.rows()           #Convierte la matriz escalonada reducida a una lista de vectores
        matriz_cuadrada = []
        index = 0
        for k in range(m):
            if piv_col.count(k)==1:      #Si la columna k aparece como pivote
                matriz_cuadrada.append(filas_matriz[index])    #Agrega la fila al la lista de filas de la nueva matriz cuadrada
                index+=1
            else:
                matriz_cuadrada.append(vacio)                 #Si no aparece como pivote entonces agrega una fila vacia
        matriz_cuadrada=matrix(m,matriz_cuadrada)             #convierte la lista de vectores a una matriz cuadrada
        I = matrix.identity(m)                                #matriz identidad
        matriz_cuadrada=matriz_cuadrada-I                     #resta la identidad a la matriz cuadrada
        
        for k in range(m):
            if piv_col.count(k)==0:      #Si la columna k no aparece como pivote
                lista_vectores.append(matriz_cuadrada.column(k)) #convierte la columna libre k  y lo convierte a vector,además de agregarlo a la lista de vectores        
         
        if o==1:
            print(tuple(lista_vectores))
        elif o==2:
            u=[]
            P=PolynomialRing(QQ,m,'t') #Toma en cuenta el caso de los polinomios
            t=list(P.gens())
            for i in range (n_libres):
                    lista_vectores[i]=list(lista_vectores[i])#convierte al vector en lista
                    u.append(lista_vectores[i][0])#Agrega el primer elemento del vector
                    for j in range (1,m):
                        u[i]+=lista_vectores[i][j]*t[j]#Suma los siguientes elemntos elementos y los multiplica por su correspondiente t^j
                    lista_vectores[i]=tuple(lista_vectores[i])
            print(tuple(u))
        elif o==3:
            if m%t==0: #sirve para verificar que el tamaño de la matriz coincide con el tamaño de los vectores de la base
                for i in range (n_libres):
                        lista_vectores[i]=list(lista_vectores[i])
                        lista_vectores[i]=matrix(t,lista_vectores[i])#Convierte los vectores a matriz
                        print(lista_vectores[i])
                        print()
            else:
                print("El tamaño específicado para la matriz no coincide con el tamaño de los vectores de la base")
        else:
            print("Opción inválida")
            
A=matrix([[1,1,1,1],[1,-1,9,-5]])
conjunto_g(A,3,4)
      