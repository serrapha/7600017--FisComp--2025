      REAL*8 FUNCTION F(X)
              IMPLICIT REAL*8(A-H, O-Z)
              F = EXP((2*X)**2) * TANH(2*X)
      END FUNCTION

      PROGRAM DERIVADA
      IMPLICIT REAL*8(A-H, O-Z)
      REAL*8 DERIVADAS(12, 7)

      X = 0.5

      DO i=1, 12
      !Popular a primeira coluna com h
      DERIVADAS(i,1) = (5.0)**(-i)

      !Popular a segunda coluna com a derivada 2f
      DERIVADAS(i,2) = (F(X+DERIVADAS(i,1)) - F(X))/DERIVADAS(i,1)

      !Popular a terceira coluna com a derivada 2t
      DERIVADAS(i,3) = (F(X) - F(X-DERIVADAS(i,1)))/DERIVADAS(i,1)

      !Quarta coluna, 3s
      DERIVADAS(i,4) = (F(X + DERIVADAS(i,1)) - F(X - DERIVADAS(i,1)))/
     &(2*DERIVADAS(i,1))

      !Quinta coluna, 5s
      DERIVADAS(i,5) = (F(X-2*DERIVADAS(i,1))-8*F(X-DERIVADAS(i,1)) +
     & 8*F(X+DERIVADAS(i,1))-F(X+2*DERIVADAS(i,1)))/(12*DERIVADAS(i,1))

      !Sexta coluna, 3s''
      DERIVADAS(i,6) = (F(X+DERIVADAS(i,1))-2*F(X)+F(X-DERIVADAS(i,1)))
     &/DERIVADAS(i,1)**2 

      !Sétima coluna, 5s''
      DERIVADAS(i,7) = (-F(X-2*DERIVADAS(i,1)) + 16*F(X-DERIVADAS(i,1)) 
     &-30*F(X)+16*F(X+DERIVADAS(i,1)) - F(X+2*DERIVADAS(i,1)))/(12
     &*((DERIVADAS(i,1))**2)) 
      END DO
        
      DO i = 1, 12
        WRITE(*, '(7G15.8)') (DERIVADAS(i,j), j = 1, 7)
      END DO
      END PROGRAM
