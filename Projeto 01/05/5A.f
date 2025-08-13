      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END

      
      PROGRAM PERMUTACAO
      INTEGER MATRIX(720,721)
      INTEGER arquivo, linhas, colunas, numeros
      INTEGER FATORIAL
      arquivo = 1

      !Leitura de arquivo
      WRITE(*,*)'Diga a quantidade de números que você permutou: '
      READ(*,*) numeros
      linhas = FATORIAL(numeros)
      colunas = numeros + 1

      OPEN(UNIT=arquivo, FILE='numeros.txt', STATUS='OLD')

      DO i=1,linhas
        READ(arquivo,*) (MATRIX(i,j), j=1, colunas)
      END DO

      CLOSE(arquivo)
      
      WRITE(*,*) MATRIX(1,1)
      WRITE(*,*) MATRIX(linhas,colunas)
      END 
