      PROGRAM APPROX
      IMPLICIT REAL*8(A-H, O-Z)

      I = 1 !Contar os termos da série
      FLOG = 0
      EPS = 1 

      WRITE(*,*)"Valor de x a ser calculado"
      READ(*,*) X

      WRITE(*,*)"Escolha o valor de Epsilon"
      READ(*,*) EPSILON

      DO WHILE (EPS .GE. EPSILON)
        TERMO = ((1 - X)**I)/I
        FLOG = FLOG - TERMO
        EPS = ABS(DLOG(X) - FLOG)
        I = I + 1
      END DO
      
      WRITE(*,*)'O valor pelo Fortran nativo', DLOG(X)
      WRITE(*,*)'O valor pela série', FLOG
      WRITE(*,*)'O valor de epsilon', EPS 

      END

