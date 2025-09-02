      REAL FUNCTION N_MEDIA(N, rmedia, iord, NUM_RAND)
              COMPLEX NUM_RAND(1600,8)
              soma = 0
              DO i = 1, N
                soma = soma + ((NUM_RAND(i,8) - rmedia))**iord
              END DO
              N_MEDIA = soma/N
      END FUNCTION

      COMPLEX FUNCTION WALK(inicio)
        COMPLEX inicio
        r = rand()
        IF (r .LT. 0.25) THEN
                WALK = inicio + (1,0)
        ELSE IF (r .LT. 0.5) THEN
                WALK = inicio + (0,1)
        ELSE IF (r. LT. 0.75) THEN
                WALK = inicio + (-1,0)
        ELSE
                WALK = inicio + (0, -1)
        END IF
      END FUNCTION

      PROGRAM ANDARILHOS_2D
      INTEGER arquivo
      REAL N_MEDIA
      COMPLEX IP(1600, 8)
      COMPLEX passo, WALK
      PARAMETER (N = 1E6) 

      arquivo = 1
      
      OPEN(UNIT=arquivo, FILE='dados.txt', STATUS='UNKNOWN')

      WRITE(*,*) 'Quantos andarilhos?'
      READ(*,*) M

      DO i = 1, M
        IP(i,1) = i
      END DO

      DO i = 1, M
        IP(i,2) = WALK((0,0))
          DO j = 0, 5
          passo = IP(i,2+j) 
            DO k = 1, (9*10**j)
              passo = WALK(passo)
            END DO
          IP(i,3+j) = passo
          END DO
      END DO

      !Debugging
      DO i = 1, M
        WRITE(*,*)'Andarilho número: ', IP(i,1)
        DO j = 1, 7
          WRITE(*,*) IP(i, j+1)
        END DO
        WRITE(arquivo,*)IP(i,1), IP(i,2), IP(i,3), IP(i,4), IP(i,5),  IP
     &(i,6),IP(i,7), IP(i,8)
      END DO

      CLOSE(UNIT=arquivo)
      END PROGRAM
