      PROGRAM ANDARILHOS
      INTEGER IP(1000, 2), MN(1000,2)

      WRITE(*,*) 'Quantos andarilhos?'
      READ(*,*) M
      WRITE(*,*) 'Quantidade de passos?'
      READ(*,*) N

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
          IF (r .GT. 0.5) THEN
                  k = k + 1
          ELSE
                  k = k - 1
          END IF
        END DO
        IP(i, 2) = k
      END DO
      !Fim cálculo

      !Calculor o valor máximo e mínimo
      DO i = 1, M
        IF (MAXIMA .LT. IP(i,2)) THEN
                MAXIMA = IP(i,2)
        ELSE
        END IF
      END DO

      DO i = 1, M
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

      !Debugging
      WRITE(*,*) 'O maximo é: ',MAXIMA
      WRITE(*,*) 'O mínimo é: ',MINIMA
      !Fim Debugging
      END PROGRAM
