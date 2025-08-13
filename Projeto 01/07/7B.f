      REAL FUNCTION GAMMA(d)
              IF ((d - INT(d)) .NE. 0) THEN
                      GAMMA = GAMMA_HALF_INT(d)
              ELSE
                      gamma = GAMMA_INT(d)
              END IF
              RETURN
      END

      REAL FUNCTION GAMMA_INT(d)
              REAL d, pi
              PARAMETER (pi = 3.14159265358979323846)

              n = d - 1
              GAMMA_INT = 1
              DO i = 1, n
                GAMMA_INT = GAMMA_INT * i
              END DO
      END
                
      REAL FUNCTION GAMMA_HALF_INT(d)
              REAL d, pi
              PARAMETER (pi = 3.14159265358979323846)
              
              n = INT(d) / 2
              
              IF (n .EQ. 0) THEN
                GAMMA_HALF_INT = SQRT(pi) / 2.0 
              ELSE
                GAMMA_HALF_INT = 2.0
                DO i = 1, n
                  GAMMA_HALF_INT = GAMMA_HALF_INT * (2.0 * i - 1.0)
                END DO
                GAMMA_HALF_INT = GAMMA_HALF_INT * SQRT(pi) / (2.0**n)
              ENDIF
              RETURN
      END

      REAL FUNCTION VOLUME(raio, d)
              REAL raio
              INTEGER d
              PARAMETER (pi = 3.14159265358979323846)

              VOLUME = (raio ** REAL(d)) * (SQRT(pi**REAL(d))/GAMMA(1.0
     & + (REAL(d)/2)))

      END

      PROGRAM VOLUMES
      REAL raios(3), pi
      INTEGER arquivo_1, arquivo_2, arquivo_3, dimensions
      PARAMETER (pi = 3.14159265358979323846)
      raios(1) = 0.9
      raios(2) = 1.0
      raios(3) = 1.1
      arquivo_1 = 1
      arquivo_2 = 2
      arquivo_3 = 3
      OPEN(UNIT=arquivo_1, FILE='dados1.dat', STATUS='UNKNOWN')
      OPEN(UNIT=arquivo_2, FILE='dados2.dat', STATUS='UNKNOWN')
      OPEN(UNIT=arquivo_3, FILE='dados3.dat', STATUS='UNKNOWN')
      
      DO i = 1,3
        DO j = 1, 25
          x = REAL(j)
          WRITE(i, *) x, VOLUME(raios(i), j)
        END DO
      END DO
           
      CLOSE(UNIT=1)
      CLOSE(UNIT=2)
      CLOSE(UNIT=3)  
      END   

