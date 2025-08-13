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

      OPEN(UNIT=arquivo, FILE='numeros.txt', STATUS='OLD')

      DO i=1,linhas
        READ(arquivo,*) (MATRIX(i,j), j=1, colunas)
      END DO

      CLOSE(arquivo)
      !Fim da Leitura e Escrita
      
      !Criação de nova matriz
      new_linhas = FATORIAL(numeros + 1)
      new_colunas = numeros + 2
      DO i=1,linhas
        DO j=1,colunas
          IF (j .EQ. colunas) THEN
                  NEW_MATRIX(i,j) = numeros + 1
          ELSE
                  k = MATRIX(i,j)
                  NEW_MATRIX(i,j) = numeros + 1
                  NEW_MATRIX(i, colunas) = k
          END IF
          NEW_MATRIX(i, new_colunas) = MATRIX(i,colunas) * (-1)**(numero
     &s + 1 - j)
        END DO
      END DO
      !Fim da criação

      !Debugging
      DO i=1, linhas
        DO j=1, colunas
          WRITE(*,*)MATRIX(i,j)
        END DO
      END DO

      WRITE(*,*) 'Divisão' 

      DO i=1, new_linhas
        DO j=1, new_colunas
          WRITE(*,*)NEW_MATRIX(i,j)
        END DO
      END DO
      END 
