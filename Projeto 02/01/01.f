      PROGRAM LCG
      INTEGER NUM_RAND(1600, 2)

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
      END 
