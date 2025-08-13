      PROGRAM NBOLAS

      REAL values(1000)  
      INTEGER dimensions, pontos_dentro, M

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

      WRITE(*,*) 'O valor da sua região é: '
      WRITE(*,*) regiao

      END PROGRAM
