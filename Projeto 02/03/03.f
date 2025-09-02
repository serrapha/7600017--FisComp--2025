      REAL FUNCTION N_MEDIA(N, rmedia, iord, NUM_RAND)
              INTEGER NUM_RAND(1600,8)
              soma = 0
              DO i = 1, N
                soma = soma + ((NUM_RAND(i,8) - rmedia))**iord
              END DO
              N_MEDIA = soma/N
      END FUNCTION

      REAL FUNCTION WALK(inicio)
        r = rand()
        IF (r .GT. 0.5) THEN
                WALK = inicio + 1
        ELSE
                WALK = inicio - 1
        END IF
      END FUNCTION

      PROGRAM ANDARILHOS_2D
      INTEGER IP(1600, 8)
      INTEGER arquivo, passo
      REAL N_MEDIA
      PARAMETER (N = 1E6) 

      arquivo = 1
      
      OPEN(UNIT=arquivo, FILE='dados.dat', STATUS='UNKNOWN')

      WRITE(*,*) 'Quantos andarilhos?'
      READ(*,*) M

      DO i = 1, M
        IP(i,1) = i
      END DO

      DO i = 1, M
        IP(i,2) = WALK(0)
          DO j = 0, 5
          passo = IP(i,2+j) 
            DO k = 1, (9*10**j)
              passo = WALK(passo)
            END DO
          IP(i,3+j) = passo
          END DO
      END DO

      CLOSE(UNIT=arquivo)

      !Debugging
      DO i = 1, M
        WRITE(*,*)'Andarilho número: ', IP(i,1)
        DO j = 1, 7
          WRITE(*,*) IP(i, j+1)
        END DO
      END DO
      
      rmedia = N_MEDIA(M, 0.0, 1, IP)
      WRITE(*,*) 'A média é: ', rmedia
      WRITE(*,*) 'A variância é: ', N_MEDIA(M, rmedia, 2, IP)
      !End
      END PROGRAM
