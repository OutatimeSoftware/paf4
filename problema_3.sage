def matrizDeRelaciones(*objects):
    r'''
    DESCRIPCION:

        La funcion obtiene una lista de elementos de un espacio vectorial V. 
        Calcula la matriz y la lleva a su forma escalonada reducida. Retorna
        la matriz de relaciones.
    
    ENTRADA:

        * Una lista v1, ... , vn de elementos en el mismo espacio V
        
    SALIDA:

        * Una matriz de relaciones 
    
    EJEMPLOS:
    
        # Caso 1
        
            Entrada:
            
                [ 1,-1, 2, 1],[-1, 1, 1, 2],[ 0, 0, 3, 3],[ 2,-2, 1,-1]
            
            Salida:
            
                > 
                    [   1   0   1   1 ]
                    [   0   1   1  -1 ]
                    
                    
       # Caso 2
       
           Entrada:
           
               [1, -1]  [-1, 1]  [ 0, 0]  [ 2,-2]
               [2,  1], [ 1, 2], [ 3, 3], [ 1,-1]  
                
           Salida:
           
               > 
                   [   1   0   1   1 ]
                   [   0   1   1  -1 ]
                   
       # Caso 3
       
           Entrada:
               
               [[1, 2],[3, 4]],[[1, 1],[1,1]],[[0,0],[0,0]],[[2,1],[1,1]]
           
           Salida:
           
               > 
                    [   1   0   0   0 ]
                    [   0   1   0   0 ]
                    [   0   0   0   1 ]
       
       # Caso 4
       
           Entrada:
               
               [[1, 1, 1],[3, 4, 3]],[[0,0],[0,0]],[[2,1],[1,1]]
               
           Salida:
           
               > Deben pertenecer al mismo espacio vectorial (tener la misma dimensión)
    
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
        MatrizRelaciones=[]
        if(m==1): 
            for x in range(n):                     
                row=[]          
                for obj in objects: 
                    dato = obj[x] 
                    row.append(dato) 
                MatrizRelaciones.append(row) 
        else:            
            for x in range(n):                     
                for y in range(m): 
                    row=[]          
                    for obj in objects: 
                        dato = obj[x][y] 
                        row.append(dato)     
                    MatrizRelaciones.append(row) 
        
        MatrizRelaciones=matrix(MatrizRelaciones).rref()       
        r0=[]
        for i in range(MatrizRelaciones.nrows()): 
            cont=0
            for j in range(MatrizRelaciones.ncols()): 
                if(MatrizRelaciones[i][j]==0): 
                    cont+=1
                if(cont==MatrizRelaciones.nrows()): 
                    r0.append(cont)
        
        for i in range(MatrizRelaciones.nrows()-len(r0)):                       #Formar la salida
            print ('[', end=" ")
            for j in range(MatrizRelaciones.ncols()): 
                print ('{:>3s}'.format(str(MatrizRelaciones[i][j])), end=" ") 
            print (']')
            
    else:
        print("Deben pertenecer al mismo espacio vectorial (tener la misma dimensión)")