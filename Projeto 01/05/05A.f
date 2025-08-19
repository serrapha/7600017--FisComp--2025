      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END FUNCTION
      

      PROGRAM DETERMINANTE
      !Tipos 
      INTEGER PERMUTA(1040, 1041), MATRIZ(10, 10)
      INTEGER FATORIAL
      INTEGER linhas, colunas, p, m, termo
      CHARACTER nome*5, nomee*20

      !Parametros
      p = 3
      m = 4

      !Leitura e Escrita dos valores do arquivo de permutação
      WRITE(*,*)'Diga o número de linhas na sua matriz'
      READ(*,*) N
      linhas = FATORIAL(N)
      colunas = N + 1

      WRITE(*,*)'Diga aonde está sua matriz de referência'
      READ(*,*) nome
      OPEN(UNIT=p, FILE=nome, STATUS='OLD')

      DO i=1, linhas
        READ(p,*) (PERMUTA(i,j), j=1, colunas)
      END DO

      CLOSE(p)
      !Fim da Leitura e Escrita

      !Leitura e Escrita dos valores da matriz
      WRITE(*,*) 'Diga aonde está a matriz a ser calculada'
      READ(*,*) nomee
      OPEN(UNIT=m, FILE=nomee, STATUS='OLD')

      DO i=1, N
        READ(m,*) (MATRIZ(i,j), j=1, N)
      END DO

      CLOSE(m)
      !Fim da Leitura e Escrita

      !Cálculo do determinante
      soma = 0
      DO i=1, linhas
      termo = PERMUTA(i, (N+1))
        DO j=1, N
          termo = termo * (MATRIZ(j, PERMUTA(i,j)))
        END DO
      WRITE(*,*) termo
      soma = soma + termo
      END DO
      WRITE(*,*) soma    
      !Fim do cálculo do determinante

      !Debugging
      !DO i=1, linhas
      !WRITE(*,*) 'Vetor número ', i
      !  DO j=1, colunas
      !    WRITE(*,*) PERMUTA(i,j)
      !  END DO
      !END DO

      !DO i=1,N
      !WRITE(*,*)'Linha número ', i
      !  DO j=1, N
      !    WRITE(*,*) MATRIZ(i,j)
      !  END DO
      !END DO
      END PROGRAM
