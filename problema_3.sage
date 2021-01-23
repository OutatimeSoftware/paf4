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

m=matrix(objects[0]).nrows()
    n=matrix(objects[0]).ncols()
    #Comprobar si es posible la operación
    flag=False
    for obj in objects:
        if(m == matrix(obj).nrows() and n == matrix(obj).ncols()):
            flag=True
        else:
            flag=False
            break
    if(flag):
        MR=[]
        if(m==1):                                                       #formar matriz(trabajar con vectores)
            for x in range(n):
                row=[]
                for obj in objects:
                    dato = obj[x]
                    row.append(dato)
                MatrizRelaciones.append(row)
        else:
            for x in range(n):                                          #formar matriz(trabajar con matrices)
                for y in range(m):
                    row=[]
                    for obj in objects:
                        dato = obj[x][y]
                        row.append(dato)
                    MatrizRelaciones.append(row)


        MatrizRelaciones=matrix(MatrizRelaciones).rref()                #Formar la ER
        for i in range(MatrizRelaciones.nrows() - 2):                   #Formatear las últimas dos lineas
            print ('[', end=" ")
            for j in range(MatrizRelaciones.ncols()):
                print ('{:>3s}'.format(str(MatrizRelaciones[i][j])), end=" ")
            print (']')   
    else:
        print("Los elementos deben pertenecer al mismo espacio V")