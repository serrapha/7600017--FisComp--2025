      INTEGER FUNCTION FATORIAL(m)
              FATORIAL = 1
              DO i = 1, m
                FATORIAL = FATORIAL * i
              END DO
      END FUNCTION

      REAL FUNCTION DETERMINANTE(N, MATRIZ, PERMUTA, linhas, colunas)
              INTEGER N, linhas, colunas
              INTEGER PERMUTA(1040, 1041), MATRIZ(10,10)
              INTEGER i,j,termo

              DETERMINANTE = 0

              DO i=1,linhas
                termo = PERMUTA(i, (N+1))
                DO j=1,N
                  termo = termo * (MATRIZ(j, PERMUTA(i,j)))
                END DO
                DETERMINANTE = DETERMINANTE + termo
              END DO
      END FUNCTION


      PROGRAM CRAMER
      !Tipos 
      INTEGER PERMUTA(1040, 1041), MATRIZ(10, 10), X(1000,1), Y(1000,1)
      INTEGER MATRIZ_A(10,10)
      INTEGER FATORIAL
      INTEGER linhas, colunas, p, m, z, termo
      CHARACTER nome*5, nomee*20, nomeee*80

      !Parametros
      p = 3
      m = 4
      z = 7
     

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
      WRITE(*,*) 'Diga aonde está a matriz A que será calculada'
      READ(*,*) nomee
      OPEN(UNIT=m, FILE=nomee, STATUS='OLD')

      DO i=1, N
        READ(m,*) (MATRIZ(i,j), j=1, N)
      END DO

      CLOSE(m)
      !Fim da Leitura e Escrita

      !Leitura e Escrita dos valores de Y
      WRITE(*,*) 'Diga aonde está Y'
      READ(*,*) nomeee
      OPEN(UNIT=z, FILE=nomeee, STATUS='OLD')

      DO i=1, N
        READ(z,*) (Y(i,j), j=1, 1)
      END DO

      CLOSE(z) 
      !Fim de Y

      !Loop para escrever X
      DO j = 1,N !Pra cada coluna
      MATRIZ_A = MATRIZ
        DO i=1, N
          MATRIZ_A(i,j) = Y(i, 1)
        END DO
      X(j,1) = DETERMINANTE(N, MATRIZ_A, PERMUTA,linhas,colunas)/DETERM
     &INANTE(N, MATRIZ, PERMUTA,linhas,colunas)
      END DO

      DO i=1,N
        WRITE(*,*)X(i,1)
      END DO
     
      END PROGRAM
