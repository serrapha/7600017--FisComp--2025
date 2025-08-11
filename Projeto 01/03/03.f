      PROGRAM ORDEM

      DIMENSION A(100000)

      !Arquivo de entrada
      OPEN(UNIT=1, FILE='tarefa-3-entrada-1.in', status='old')

      !Leitura
      N = 0
10    READ(1,*,END=13) temp
        N = N + 1
        GOTO 10
13    REWIND(1)
      WRITE(*,*) 'N é igual a: ', N
      
      !Criação do vetor
      i = 0
19    READ(1,*,END=23) tem
        i = i+1
        A(i) = tem
        GOTO 19
23    REWIND(1)
       
      !Ordenação 
      DO j = 1, N
        DO k = (j+1), N
          IF (A(j) .GT. A(k)) THEN
            sub = A(j)
            A(j) = A(k)
            A(k) = sub
          END IF
        END DO
      END DO
      
      CLOSE(1)  

      !Recebimento de M
      WRITE(*,*) 'Digite uma quantidade de valores menor que N' 
      READ(*,*)M
     
      !Display dos resultados
      WRITE(*,*) A(1:M) 

      END
