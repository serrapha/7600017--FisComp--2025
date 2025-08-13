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

      PROGRAM NBOLAS
      REAL values(1000), regiao, formula,pi
      INTEGER dimensions, pontos_dentro, M
      PARAMETER (pi = 3.14159265358979323846)

      WRITE(*,*)'Insira a quantidade de dimensões desejada: '
      READ(*,*) dimensions
      WRITE(*,*) 'Insira M, a quantidade de vezes que vamos simular: '
      READ(*,*) M
     
      pontos_dentro = 0
      DO i = 1, M
        soma = 0
        DO j = 1, dimensions
          values(j) = rand()
          soma = soma + (values(j) * values(j))
        END DO
        IF (SQRT(soma) .LT. 1) THEN
          pontos_dentro = pontos_dentro + 1
        ELSE
        ENDIF
      END DO
      
      regiao = (2.0**REAL(dimensions)) * (REAL(pontos_dentro)/REAL(M))
      formula = SQRT(pi**REAL(dimensions)) / GAMMA(1.0  + (REAL(dimensio
     &ns)/2)) 
      epsilon = ABS(regiao - formula) 

      WRITE(*,*) 'O valor da sua região pelo Metodo de Monte Carlo é:'
      WRITE(*,*) regiao
      WRITE(*,*) 'O valor da sua região pela fórmula é:'
      WRITE(*,*) formula
      WRITE(*,*) 'O erro do seu valor de M é:'
      WRITE(*,*) epsilon
      END PROGRAM
