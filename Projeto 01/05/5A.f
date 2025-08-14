      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END
      
      PROGRAM PERMUTACAO
      INTEGER MATRIX(720,721), NEW_MATRIX(720,721)
      INTEGER FATORIAL
      INTEGER arquivo, linhas, colunas, numeros, new_linhas, new_colunas
      arquivo = 1

      !Leitura e Escrita dos valores do arquivo externo numa matriz
      WRITE(*,*)'Diga a quantidade de números que você permutou: '
      READ(*,*) numeros
      linhas = FATORIAL(numeros)
      colunas = numeros + 1

      OPEN(UNIT=arquivo, FILE='4.txt', STATUS='OLD')

      DO i=1,linhas
        READ(arquivo,*) (MATRIX(i,j), j=1, colunas)
      END DO

      CLOSE(arquivo)
      !Fim da Leitura e Escrita
      
      !Criação de nova matriz
      new_linhas = FATORIAL(numeros + 1)
      new_colunas = numeros + 2
      !Para cada linha, eu crio N cópias na Matriz de Saída
      DO i=1, linhas
        DO j = 0, numeros
          DO k = 1, numeros+1
            NEW_MATRIX((4*i) - j, k) = MATRIX(i, k)
          END DO
        END DO
      END DO

      !Começar a substituir
      DO i=1, new_linhas, numeros+1
        DO j=0, numeros
          IF (j+1 .EQ. colunas) THEN
                  NEW_MATRIX(i+j, j+1) = numeros+1
          ELSE
          k = NEW_MATRIX(i+j, j+1)
          NEW_MATRIX(i+j, j+1) = numeros+1
          NEW_MATRIX(i+j, colunas) = k
          END IF
        END DO
      END DO

      !Checando a paridade de cada vetor
      DO i=1, new_linhas
        M = 0
        DO j=1,colunas
          DO k=j + 1, colunas
            IF(NEW_MATRIX(i,j) .GT. NEW_MATRIX(i,k)) THEN
                    M = M + 1
            ELSE
            END IF
          END DO
        END DO 
      IF (MOD(M,2) .EQ. 0) THEN
        NEW_MATRIX(i, new_colunas) = 1
      ELSE
        NEW_MATRIX(i, new_colunas) = -1
      END IF
      END DO

      !Fim da criação

      !Escrevendo num arquivo
      DO i=1, linhas
        WRITE(*,*) 'Vetor', i
        DO j=1, colunas
          WRITE(*,*)MATRIX(i,j)
        END DO
      END DO

      WRITE(*,*) 'Divisão' 

      DO i=1, new_linhas
        WRITE(*,*) 'Vetor ', i
        DO j=1, new_colunas
          WRITE(*,*)NEW_MATRIX(i,j)
        END DO
      END DO

      !Escrevendo em um arquivo
      OPEN(UNIT=20, FILE='5.txt', STATUS='REPLACE')

      DO i = 1, new_linhas
        DO j = 1, numeros + 1
          WRITE(20, '(I2, 1X)', ADVANCE='NO') NEW_MATRIX(i, j)
        END DO
        WRITE(20, '(I3)') NEW_MATRIX(i, new_colunas)
      END DO

      CLOSE(20)

      END 
