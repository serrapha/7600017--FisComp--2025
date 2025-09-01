      REAL FUNCTION N_MEDIA(soma, N, rmedia, iord, NUM_RAND)
              INTEGER NUM_RAND(1600,2)
              soma = 0
              DO i = 1, N
                soma = soma + ((NUM_RAND(i,2) - rmedia))**iord
              END DO 
              N_MEDIA = soma/N 
      END FUNCTION
      
      PROGRAM LCG
      INTEGER NUM_RAND(1600, 2)
      REAL N_MEDIA

      WRITE(*,*) 'Digite A'
      READ(*,*) iA
      WRITE(*,*) 'Digite B'
      READ(*,*) iB
      WRITE(*,*) 'Digite M'
      READ(*,*) M
      WRITE(*,*) 'Digite a quantidade de repetições N'
      READ(*,*) N 
      WRITE(*,*) 'Digite a seed' 
      READ(*,*)iseed

      NUM_RAND(1, 1) = 1
      NUM_RAND(1, 2) = iseed

      DO i=2,N
        NUM_RAND(i, 1) = i
        NUM_RAND(i, 2) = MOD((iA*(NUM_RAND((i-1), 2)) + iB),M)
      END DO

      DO i=1,N
        WRITE(*,*) NUM_RAND(i,1), NUM_RAND(i,2) 
      END DO

      !Média
      soma = 0
      DO i=1,N
        soma = soma + NUM_RAND(i,2) 
      END DO 
      rmedia = soma / N
      WRITE(*,*) 'A média é: ', rmedia

      !VariÂncia
      WRITE(*,*)'A variância é: ', N_MEDIA(soma, N, rmedia, 2, NUM_RA
     &ND)
      !Assimetria
      WRITE(*,*)'A assimetria é: ', N_MEDIA(soma, N, rmedia, 3, NUM_RA
     &ND)
      !Curtose
      WRITE(*,*)'A curtose é: ', N_MEDIA(soma, N, rmedia, 4, NUM_RA
     &ND) 
      END 
