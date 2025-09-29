      REAL*8 FUNCTION F(X)
              IMPLICIT REAL*8(A-H, O-Z)
              F = 0.042 - 0.13*X - 0.6*X**2 + X**3
      END FUNCTION


      PROGRAM RAIZES
      IMPLICIT REAL*8(A-H, O-Z)
      DIMENSION REGIOES(3)

      i = 1
      x = -5

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
      
      WRITE(*,*)REGIOES 

      END PROGRAM 
