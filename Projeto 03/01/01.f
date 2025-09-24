      REAL*8 FUNCTION F(X)
              IMPLICIT REAL*8(A-H, O-Z)
              F = EXP((2*X)**2) * TANH(2*X)
      END FUNCTION

      PROGRAM DERIVADA
      IMPLICIT REAL*8(A-H, O-Z)
      REAL*8 DERIVADAS(12, 7)
      REAL*8 DIFERENCAS(12, 7)

      X = 0.5
      F1 = 10.55073223047069 
      F2 = 60.99565962023752

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

      DO i=1,12
        DIFERENCAS(i,1) = DERIVADAS(i,1)
        DO j = 2, 5
          DIFERENCAS(i,j) = ABS(DERIVADAS(i,j) - F1)
        END DO
        DO j = 6,7
          DIFERENCAS(i,j) = ABS(DERIVADAS(i,j) - F2)
        END DO 
      END DO

      OPEN(UNIT=10, FILE='dados1.dat', STATUS='UNKNOWN')
      OPEN(UNIT=20, FILE='dados2.dat', STATUS='UNKNOWN')
      OPEN(UNIT=30, FILE='dados3.dat', STATUS='UNKNOWN')
      OPEN(UNIT=40, FILE='dados4.dat', STATUS='UNKNOWN')
      OPEN(UNIT=50, FILE='dados5.dat', STATUS='UNKNOWN')
      OPEN(UNIT=60, FILE='dados6.dat', STATUS='UNKNOWN')

      DO i=10,60,10
        DO j=1,12
          WRITE(i,*) DIFERENCAS(j,1), DIFERENCAS(j, (i/10)+1)
        END DO 
      END DO

      DO i=10,60,10
        CLOSE(UNIT=(i/10))
      END DO

      END PROGRAM
