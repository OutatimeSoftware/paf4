def resolver(A,b):
    r"""
    DESCRIPCION DE LA FUNCION:

        Funcion que permite saber si es inconsistente o si existe una solucion.Si existe una solucion, comprueba si es determinado o indeterminado, encuentra la forma       escalonada,las variables basicas y libres, escribe las variables basicas en terminos de las libre y saber si las dimensiones son compatibles

    ENTRADA:
    
        - Una matriz A
    
        - Un vector B
    
    SALIDA:
    
        Indica si es determinado o no

        Escribe su forma escalonada
    
        Escribe las variables basicas y variables libres
    
        Escribe las variables basicas en terminos de las libres
    
        Menciona si las dimensiones son compatibles


    EJEMPLOS::

    b=vector([3,4])
    
    A = matrix(QQ, 2, 3, [1, 2, 3, 4 , 5, 6])

    Obtenemos lo siguiente:

        El sistema es indeterminado

            La forma escalonada reducida de [A|b] es:
            
                [   1    0   -1|-7/3]
                
                [   0    1    2| 8/3]


                Variables basicas:
                
                (x1, x2)


                Variables libres:
                
                (x3,)


               Variables basicas en termino de las variables libres:
               
               x1=x3 - 7/3
               
               x2=-2*x3 + 8/3

          La solucion general es:(x3 - 7/3, -2*x3 + 8/3, x3) con (x3,) en los reales


           ::

    A = matrix(QQ, 2, 2, [1, 0, 1, 0])

    b = vector([0, 0])

        Obtenemos lo siguiente:

            El sistema es indeterminado


                La forma escalonada reducida de [A|b] es:

                [1 0|0]
                
                [0 0|0]

                
                Variables basicas:
                
                (x1,)

                
                Variables libres:
                
                (x2,)

                
                Variables basicas en termino de las variables libres:
                
                x1=0

                
                La solucion general es:(0, x2) con (x2,) en los reales

                ::



    A = matrix(QQ, 2, 2, [10, 8, 2 ,3])
    
    b = vector([2, 2])

    Obtenemos lo siguiente:

        El sistema es determinado

        La forma escalonada reducida de [A|b] es:
    
        [   1    0|-5/7]
        
        [   0    1| 8/7]

        
        Variables basicas:
        
        (x1, x2)

        Variables libres:
        
        ()

        Variables basicas en termino de las variables libres:
        
        x1=-5/7
        
        x2=8/7

        
        La solucion general es:(-5/7, 8/7) con () en los reales

        ::

    A = matrix(QQ, 1, 6, [2, 4, 6, 8, 10, 12])
    
    b = vector([5])

    Obtenemos lo siguiente:
        
        El sistema es indeterminado

        
        La forma escalonada reducida de [A|b] es:
        
        [  1   2   3   4   5   6|5/2]

        
        Variables basicas:
        
        (x1,)

        
        Variables libres:
        
        (x2, x3, x4, x5, x6)

        
        Variables basicas en termino de las variables libres:
        
        x1=-2x2 - 3x3 - 4x4 - 5x5 - 6x6 + 5/2

        
        La solucion general es:(-2x2 - 3x3 - 4x4 - 5x5 - 6x6 + 5/2, x2, x3, x4, x5, x6) con (x2, x3, x4, x5, x6) en los reales

        ::

    A = matrix(QQ, 3, [5, 15, 5, 5, 15, 5])
    
    b = vector([5, 5, 5])
    
    Obtenemos lo siguiente:
        
        El sistema es inconsistente
    
    AUTHORS:

    Jocelyn Novelo Aguayo
    
    Rodrigo Pantoja Vazquez
    
    Miguel Rodrigo Ávila
    
    Jorge Reyes Treviño
    """
    n=A.nrows();
    m=A.ncols();
    if A.nrows()==b.degree():
        Ab=A.augment(b,true);
        EAb=Ab.rref();
    else:
        print("Las dimenciones de la matriz A y el vector b no son compatibles");
        sys.exit()
    
    piv_col=list(EAb.pivots());          #Regresa la lista de las columnas de los pivotes (aka las columnas basicas)
    piv_row=list(EAb.pivot_rows());      #Regresa la lista de los renglones de los pivotes


    if piv_col.count(m)==1:              #compara si la ultima columna es basica
        print("El sistema es inconsistente");
    else:                                #Si no
        R = PolynomialRing(QQ, m+1, 'x') #Crea el conjunto de variables (max m+1)
        x=list(R.gens())                 #Crea la lista x0,x1,x2...xm
        x.pop(0)                         #quita x0
        x=vector(x);                     # lo convierte a vector
    
        basicX=[]
        freeX=[]
        free=[];                         #Lista de las columnas de las variables libres
        for k in range(m):
            if piv_col.count(k)==0:      #Si la columna k no aparece como pivote
                free.append(k);          #Lo agrega a la lista de las variables libres
            
        sol=[];                          # vector solucion
    
        if A.rank()==m:                             #Verifica si el rango es igual al numero de columnas
            print("\nEl sistema es determinado\n");
        else:
            print("\nEl sistema es indeterminado\n");
        
        print("La forma escalonada reducida de [A|b] es:")
        print(EAb)   
    
        for i in range(m):
            if 1==piv_col.count(i):      # Si la columna es basica
                aux=EAb[i,m];            #suma el valor en la uñltima columna a un auxiliar
                for j in range(len(free)):
                    aux=aux-EAb[i,free[j]]*x[free[j]];        #resta las variables libres a esa auxiliar (despeje de var basicas)
            else:
                aux=x[i];                                 #Si no es basica solo pone la variable
            sol.append(aux);                                #agrega lo que esta en aux a la solucion general
        print("\nVariables basicas:")
        for i in list(piv_col):
            basicX.append(x[i]);
        print(tuple(basicX));
        print("\nVariables libres:")
        for i in free:
            freeX.append(x[i]);
        print(tuple(freeX));
        print("\nVariables basicas en termino de las variables libres:");
        for i in range(len(piv_col)):
            print(f"{x[piv_col[i]]}={sol[i]}");

    print(f"\nLa solucion general es:{vector(sol)} con {tuple(freeX)} en los reales");