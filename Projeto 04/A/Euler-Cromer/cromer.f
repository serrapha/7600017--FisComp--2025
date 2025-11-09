      PROGRAM CROMER

      PARAMETER(PI = 3.1415927)

      WRITE(*,*) 'Diga theta_0'
      READ(*,*) theta
      WRITE(*,*) 'Eleja delta_t'
      READ(*,*) delta_t

      OPEN(UNIT=10, FILE='posicao.dat', STATUS='UNKNOWN')
      OPEN(UNIT=20, FILE='energia.dat', STATUS='UNKNOWN')
      OPEN(UNIT=30, FILE='velocidade.dat', STATUS='UNKNOWN')

C     Calcular o período
      T = (2*PI)*(1 + (1/4)*(SIN(theta/2))**2 + 
     &(9/64)*(SIN(theta/2))**4)

C     Calcular o índice do período
      i_T = T/delta_t
      
C     Posição e Energia
      DO i=1, (i_T)
        energia = (9.8**2)*(1 - COS(theta) + ((omega**2)/2))
        omega = omega - theta*delta_t
        theta = theta + omega*delta_t
        WRITE(10,*) (i*delta_t), theta
        WRITE(20,*) (i*delta_t), energia
        WRITE(30,*) (i*delta_t), omega
      END DO

      CLOSE(10)
      CLOSE(20)
      CLOSE(30)
        
      END PROGRAM 


