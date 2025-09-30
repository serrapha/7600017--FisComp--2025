      REAL*8 FUNCTION F(X)
              IMPLICIT REAL*8(A-H, O-Z)
              F = 0.042 - 0.13*X - 0.6*X**2 + X**3
      END FUNCTION

      REAL*8 FUNCTION FL(X)
              IMPLICIT REAL*8(A-H, O-Z)
              FL = -0.13 -1.2*X + 3*X**2
      END FUNCTION


      PROGRAM RAIZES
      IMPLICIT REAL*8(A-H, O-Z)
      DIMENSION REGIOES(3), TABELA(20, 7)

C     Inicializar com zeros

      DO i = 1, 20
        DO j = 1, 7 
          TABELA(i,j) = 0
        END DO
      END DO

      i = 1
      x = -5
      EPSILON = 10E-6

      WRITE(*,*) 'Diga a raíz que você quer'
      READ(*,*) iRaiz

10    IF ((F(x) .LE. 0) .EQV. (F(x+0.01) .LE. 0)) THEN
        x = x + 0.01
        GOTO 10
      ELSE
        REGIOES(i) = x
        i = i + 1 
        IF (i .LE. 3) THEN
                x = x + 0.01
                GOTO 10
        ELSE
        END IF
      END IF

      !Valores base da lista
      DO i=1,11
        TABELA(i,1) = i
      END DO
      
      DO i=2,7,2
        TABELA(1,i) = REGIOES(iRaiz)
        TABELA(1,i+1) = REGIOES(iRaiz) + 0.01 
      END DO 

      !Bisseccao
      i = 1
      rMINIMO = REGIOES(iRaiz)
      rMAXIMO = REGIOES(iRaiz) + 0.01
20    IF (ABS(rMAXIMO - rMINIMO) .GT. EPSILON) THEN
              rMEDIO = (rMINIMO + rMAXIMO) / 2
              IF ((F(rMINIMO) .LE. 0) .EQV. (F(rMEDIO) .LE. 0)) THEN
                      rMINIMO = rMEDIO
              ELSE
                      rMAXIMO = rMEDIO
              END IF
              i = i + 1
              TABELA(i,2) = rMINIMO
              TABELA(i,3) = rMAXIMO
              GOTO 20
      ELSE
      END IF

      !Newton-Raphson
      i = 1
      rMINIMO = REGIOES(iRaiz)
      rMAXIMO = REGIOES(iRaiz) + 0.01
30    IF (ABS(rMAXIMO - rMINIMO) .GT. EPSILON) THEN
              temp = rMINIMO
              rMINIMO = rMINIMO - ((F(rMINIMO))/(FL(rMINIMO)))
              rMAXIMO = temp 
              i = i + 1
              TABELA(i,4) = rMINIMO
              TABELA(i,5) = rMAXIMO
              GOTO 30
      ELSE
      END IF 

      !Secante
      i = 1
      rMINIMO = REGIOES(iRaiz)
      rMAXIMO = REGIOES(iRaiz) + 0.01
40    IF (ABS(rMAXIMO - rMINIMO) .GT. EPSILON) THEN
              temp = rMINIMO
              rMINIMO = rMINIMO - F(rMINIMO)*((rMINIMO - rMAXIMO)/
     &(F(rMINIMO) - F(rMAXIMO)))
              rMAXIMO = temp 
              i = i + 1
              TABELA(i,6) = rMINIMO
              TABELA(i,7) = rMAXIMO
              GOTO 40
      ELSE
      END IF 


      DO i=1,11
        WRITE(*,'(7G15.8)') (TABELA(i,j), j=1,7)
      END DO
      END PROGRAM 
