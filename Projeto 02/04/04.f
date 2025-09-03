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
      REAL ABSOLUTES(1600, 7), CIRCULOS(1600,7), ENTROPIA(1,7)
      COMPLEX IP(1600, 8)
      COMPLEX passo, media, WALK

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

      !Tomar uma lista de valores absolutos/passo
      DO i = 1, M
        DO j = 1, 7
          ABSOLUTES(i, j) = CABS(IP(i, j+1))
        END DO
      END DO

      !Tomar uma lista de qual círculo contem cada andarilho
      DO i = 1, M
        DO j = 1,7
          CIRCULOS(i,j) = INT(ABSOLUTES(i,j)/20)+1
        END DO
      END DO

      !Cálculo de entropia 
      DO i = 1,7
      vez = 0
        DO j = 1, 100
        counter = 0
          DO k = 1, M
            IF (j .EQ. CIRCULOS(k,i)) THEN
                   counter = counter + 1
            ELSE
            END IF
          END DO
        P = counter/M
        IF (P .GT. 0) THEN
          entrop = P * LOG(P)
        ELSE
          entrop = 0
        END IF
        vez = vez + entrop
        END DO
      ENTROPIA(1,i) = -vez
      END DO
      
      !Debugging
      DO i = 1,M
      WRITE(*,*) 'Andarilho número', i
        DO j = 1,7
          WRITE(*,*)ABSOLUTES(i,j)
          WRITE(*,*)CIRCULOS(i,j)
        END DO
      END DO

      DO i = 1, 7
        WRITE(*,*)ENTROPIA(1,i)
      END DO
      END PROGRAM

