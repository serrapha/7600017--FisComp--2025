      PROGRAM APPROX

      I = 1 !Contar os termos da série
      FLOG = 0
      EPS = 1 

      WRITE(*,*)"Valor de x a ser calculado"
      READ(*,*) X

      DO WHILE (EPS .GT. 0.00001)
        TERMO = ((1 - X)**I)/I
        FLOG = FLOG - TERMO
        EPS = ABS(LOG(X) - FLOG)
        I = I + 1
      END DO
      
      WRITE(*,*)'O valor pelo Fortran nativo', LOG(X) 
      WRITE(*,*)'O valor pela série', FLOG 

      END
