      PROGRAM EULER

      PARAMETER(PI = 3.1415927)

      WRITE(*,*) 'Diga theta_0'
      READ(*,*) theta
      WRITE(*,*) 'Eleja delta_t'
      READ(*,*) delta_t

      OPEN(UNIT=10, FILE='euler_posicao.dat', STATUS='UNKNOWN')
      OPEN(UNIT=20, FILE='energia.dat', STATUS='UNKNOWN')

C     Calcular o período
      T = (2*PI)*(1 + (1/4)*(SIN(theta/2))**2 + 
     &(9/64)*(SIN(theta/2))**4)

C     Calcular o índice do período
      i_T = T/delta_t

C     Posição
      DO i=1, 100*(i_T)
        temp = theta
        theta = theta + omega*delta_t
        omega = omega - temp*delta_t
        energia = (9.8**2)*(1 - ABS(COS(theta)) + ((omega**2)
     */2))
        WRITE(10,*) (i*delta_t), theta
        WRITE(20,*) (i*delta_t), energia
      END DO
        
C     WRITE(*,*) T
      END PROGRAM 

