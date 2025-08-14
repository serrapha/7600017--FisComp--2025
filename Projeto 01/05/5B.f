      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END
      
      PROGRAM PERMUTACAO
      INTEGER MATRIX(720,721), NEW_MATRIX(720,721), TESTE(4,4)
      INTEGER FATORIAL
      INTEGER arquivo, linhas, colunas, numeros, new_linhas, new_colunas
      INTEGER soma, termo
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
       
      !Debuggin
      DO i=1, linhas
        WRITE(*,*) 'Vetor', i
        DO j=1, colunas
          WRITE(*,*)MATRIX(i,j)
        END DO
      END DO

      !Matriz de teste
      DO i = 1, 4
        DO j=1, 4
          READ(*,*) K
          teste(i,j) = K
        END DO
      END DO

      !Fórmula de Leibniz
      soma = 0
      DO i = 1, linhas
        termo = MATRIX(i, numeros+1)
        DO j = 1, numeros
          termo = termo * TESTE(j, MATRIX(i,j))
        END DO
        soma = soma + termo
      END DO
      WRITE(*,*) soma
      END 

