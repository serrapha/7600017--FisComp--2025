      REAL*8 FUNCTION F(X)
              IMPLICIT REAL*8(A-H, O-Z)
              F = EXP(-X) * SIN(X)
      END FUNCTION

      PROGRAM INTEGRAL
      IMPLICIT REAL*8(A-H, O-Z)
      REAL*8 INTEGRAIS(13, 4), DIFERENCAS(13,4)
      
      PARAMETER (PI =  3.14159265358979324) 
      PARAMETER (VAL = 0.49906627863414601)

      DO i=2,13
      !Cálculo de h
      h = (2*PI)/(2**i)

      !Popular a primeira coluna com 2pi vezes h
      INTEGRAIS(i,1) = 2**(i)

      !Limpando a memória
      A = 0
      B = 0
      C = 0

      !Popular a segunda coluna com o trapézio
        DO j=0, (2**(i))-1
          A = A + (h/2)*(F(j*h) + F(h*(j+1)))
      
      !Popular a terceira coluna com a parábola
          B = B + (h/6)*(F(j*h) + 4*F(h*j + h/2) + F(j*h + h))

      !Popular a quarta coluna com Boole
          C = C + (h/90)*(7*F(j*h) + 32*F(j*h + (h/4)) + 12*F(j*h +
     &(h/2)) + 32*F(j*h + (3*h/4)) + 7*F(j*h + h))
        END DO
      
      INTEGRAIS(i,2) = A
      INTEGRAIS(i,3) = B
      INTEGRAIS(i,4) = C
      END DO

      DO i=2,13
        WRITE(*, '(4G15.8)') (INTEGRAIS(i,j), j=1,4)
      END DO
      
      DO i=2,13
        DIFERENCAS(i,1) = INTEGRAIS(i,1)
        DO j=2,4
          DIFERENCAS(i,j) = ABS(INTEGRAIS(i,j) - VAL)
        END DO
      END DO

      DO i=2,13
        WRITE(*, '(4G15.8)') (DIFERENCAS(i,j), j=1,4) 
      END DO
      END PROGRAM
