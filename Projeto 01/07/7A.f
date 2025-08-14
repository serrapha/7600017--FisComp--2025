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

      PROGRAM VOLUMES
      REAL raio, pi
      INTEGER ARQUIVO, dimensions
      PARAMETER (pi = 3.14159265358979323846)
      arquivo = 10
      OPEN(UNIT=arquivo, FILE='saida.txt', STATUS='NEW')

      WRITE(*,*) 'Insira o raio que você deseja calcular:'
      READ(*,*) raio
      WRITE(*,*) 'Insira a quantidade de dimensões:'
      READ(*,*) dimensions

      DO i = 0, dimensions
        volume = (raio ** REAL(i)) * (SQRT(pi**REAL(i))/GAMMA(1.0
     & + (REAL(i)/2)))
        WRITE(arquivo, *) volume
      END DO

      CLOSE(UNIT=arquivo) 
      END   
