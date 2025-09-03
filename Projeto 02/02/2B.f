      REAL FUNCTION N_MEDIA(soma, N, rmedia, iord, NUM_RAND)
              INTEGER NUM_RAND(1600,2)
              soma = 0
              DO i = 1, N
                soma = soma + ((NUM_RAND(i,2) - rmedia))**iord
              END DO
              N_MEDIA = soma/N
      END FUNCTION      

      PROGRAM ANDARILHOS
      INTEGER IP(1600, 2), MN(1000,2)
      INTEGER arquivo
      REAL N_MEDIA

      arquivo = 1   

      OPEN(UNIT=arquivo, FILE='dados.dat', STATUS='UNKNOWN')

      WRITE(*,*) 'Quantos andarilhos?'
      READ(*,*) M
      WRITE(*,*) 'Quantidade de passos?'
      READ(*,*) N
      WRITE(*,*) 'Probabilidade'
      READ(*,*) prob

      !Organização da matriz de passos
      DO i = 1, M
        IP(i,1) = i
      END DO
      !Fim da Organização

      !Cálculo dos passos
      DO i = 1, M
        k = 0
        DO j = 1, N
          r = rand()
          IF (r .GT. prob) THEN
                  k = k + 1
          ELSE
                  k = k - 1
          END IF
        END DO
        IP(i, 2) = k
      END DO
      !Fim cálculo

      !Calculor o valor máximo e mínimo
      MAXIMA = IP(1,2)
      DO i = 1, M
        IF (MAXIMA .LT. IP(i,2)) THEN
                MAXIMA = IP(i,2)
        ELSE
        END IF
      END DO

      MINIMA = IP(1,2)
      DO i = 1, a
        IF (MINIMA .GT. IP(i,2)) THEN
                MINIMA = IP(i,2)
        ELSE
        END IF
      END DO
      !Fim cálculo
      
      !Criação da função N(x)
      DO i = MINIMA, MAXIMA
        k = 0
        DO j = 1, M
          IF (i .EQ. IP(j,2)) THEN 
                  k = k + 1
          ELSE
          END IF
        END DO
        MN(i+1-MINIMA,1) = i
        MN(i+1-MINIMA,2) = k
      END DO
      !Fim da criação
        
      WRITE(*,*) 'O valor mínimo é: ', MINIMA
      WRITE(*,*) 'O valor máximo é: ', MAXIMA
      rmedia = N_MEDIA(soma, M, 0.0, 1, IP)
      WRITE(*,*) 'A média é: ', N_MEDIA(soma, M, 0.0, 1, IP)
      WRITE(*,*) 'A variância é: ', N_MEDIA(soma, M, rmedia, 2, IP)

      DO i=1,M
        WRITE(arquivo,*)IP(i,1), IP(i,2)
      END DO
      CLOSE(UNIT=arquivo)
      !Fim Debugging
      END PROGRAM
