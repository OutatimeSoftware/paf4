def MatRel(*elementos):
    '''
    DESCRIPCION:

        La funcion obtiene una lista de elementos de un espacio vectorial V. 
        Calcula la matriz y la lleva a su forma escalonada reducida. Retorna
        la matriz de relaciones.
    
    ENTRADA:

        * Una lista v1, ... , vn de elementos en el mismo espacio V
        
    SALIDA:

        * Una matriz de relaciones 
    
    
    '''

    m=objects[0].nrows()
    n=objects[0].ncols()


     #Comprobar si es posible la operación
    flag=False
    for obj in objects:
        if(m == obj.nrows() and n == obj.cols()):
            flag=True
        else:
            flag=False
            break
    if(flag):                                                                   #Bandera que comprueba si es posible
        MatrizDeRelaciones=[]
        for x in range(n):                                                      #Comenzamos a formar la matriz
            for y in range(m):
                row=[]
                for obj in objects:
                    elemento = obj[x][y]
                    row.append(elemento)
                MatrizDeRelaciones.append(row)

        MatrizDeRelaciones=MatrizDeRelaciones.rref()                            #Formar la ER
        for i in range(len(MatrizDeRelaciones)):
            print ('[', end=" ")
            for j in range(len(MatrizDeRelaciones[i])):
                print ('{:>3s}'.format(str(MatrizDeRelaciones[i][j])), end=" ") #Imprimir la ER
            print (']')
    else:
        print("Los elementos deben pertenecer al mismo espacio V")




MatRel([[1,0],[1,1]],[[0,1],[1,0]],[[2,3],[5,2]],[[1,1],[2,1]])