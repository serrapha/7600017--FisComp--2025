      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END
      
      PROGRAM PERMUTACAO
      !Tipos        
      INTEGER MATRIZ(1040, 1041), NOVA_MATRIZ(2080, 2082)
      INTEGER FATORIAL
      INTEGER arquivo, linhas, colunas, p
      CHARACTER nome*5

      !Parametros
      arquivo = 3

      !Leitura e Escrita dos valores do arquivo numa matriz
      WRITE(*,*)'Diga a quantidade de números que você permutou: '
      READ(*,*) N
      linhas = FATORIAL(N)
      colunas = N + 1

      WRITE(*,*)'Diga aonde estão seus arquivos'
      READ(*,*) nome
      OPEN(UNIT=arquivo, FILE=nome, STATUS='OLD')
      
      DO i=1, linhas
        READ(arquivo,*) (MATRIZ(i,j), j=1, colunas)
      END DO
      
      CLOSE(arquivo) 
      !Fim da Leitura e Escrita

      !Uma matriz com (N+1) cópias da matriz original
      nova_linhas = FATORIAL(N + 1)
      nova_colunas = N + 2
      DO i=1, linhas
        DO j = 0, N
          DO k = 1, N+1
            NOVA_MATRIZ((colunas*i) - j, k) = MATRIZ(i, k)
          END DO
        END DO
      END DO
      !Fim das cópias

      !Criar permutações
      DO i=1, nova_linhas
        i_sub_matriz = MOD(i, (N+1))
        p = NOVA_MATRIZ(i, (N+1))
        IF (i_sub_matriz .EQ. 0) THEN
                NOVA_MATRIZ(i, (N+1)) = N + 1
                NOVA_MATRIZ(i, (N+2)) = p

        ELSE
          DO j = (N+1), i_sub_matriz, -1
            NOVA_MATRIZ(i, j+1) = NOVA_MATRIZ(i, j)
            NOVA_MATRIZ(i,j) = (N + 1) 
          END DO
          NOVA_MATRIZ(i, (N+2)) = p * (-1) ** (N + 1 - i_sub_matriz) 
        END IF
      END DO 
      !Fim da criação

      !Escrevendo num arquivo
      OPEN(UNIT=20, FILE='neu.txt', STATUS='NEW')

      DO i =1, nova_linhas
        DO j = 1, N + 1
          WRITE(20, '(I2, 1X)', ADVANCE='NO') NOVA_MATRIZ(i, j) 
        END DO
        WRITE(20, '(I3)') NOVA_MATRIZ(i, nova_colunas)
      END DO
      
      CLOSE(20) 
      !Fim da escritura

      !Debugging
      DO i = 1, linhas
      WRITE(*,*) 'Vetor número ', i
        DO j = 1, colunas
          WRITE(*,*) MATRIZ(i,j)
        END DO
      END DO

      DO i=1, nova_linhas
      WRITE(*,*) 'Vetor número ', i
        DO j=1, nova_colunas
          WRITE(*,*) NOVA_MATRIZ(i,j)
        END DO
      END DO 
      END PROGRAM
