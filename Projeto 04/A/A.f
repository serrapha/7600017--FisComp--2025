      PROGRAM EULER

      PARAMETER(PI = 3.1415927)
      OPEN(UNIT=10, FILE='pendulo.dat', STATUS='UNKNOWN') 
              
      WRITE(*,*) 'Diga theta_0'
      READ(*,*) theta
      WRITE(*,*) 'Eleja delta_t'
      READ(*,*) delta_t


C     Calcular o período
      T = (2*PI)*(1 + (1/4)*(SIN(theta/2))**2 + 
     &(9/64)*(SIN(theta/2))**4)

C     Calcular o índice do período
      i_T = T/delta_t

      DO i=1, i_T
        omega = omega - theta*delta_t
        theta = theta + omega*delta_t
        WRITE(10,*) (i*delta_t), theta
      END DO


      
        
C     WRITE(*,*) T
      END PROGRAM 
