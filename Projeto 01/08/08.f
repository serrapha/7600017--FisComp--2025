      FUNCTION FACT (I)
              INTEGER I, J 
              REAL RES
              J = I
              RES = 1.0
              DO WHILE (J .GT. 1)
                RES = RES * J
                J = J - 1
              END DO
              FACT = RES
              RETURN
      END FUNCTION

      FUNCTION IGAM (M)
              INTEGER M 
              REAL PI, IGAM
              PI = 3.14159
              IF (MOD(M,2) .EQ. 0) THEN
              iGAM = FACT(M/2)
              ELSE
              iGAM = sqrt(pi) * FACT(M) / (2**M * FACT((M-1)/2))
              END IF
              RETURN
              END FUNCTION


      PROGRAM ESFERA
      INTEGER N
      REAL iGAM
      WRITE(*,*) 'Dimensão N a ser calculada'
      READ(*,*) N
      WRITE(*,*) iGAM(N)
      END
