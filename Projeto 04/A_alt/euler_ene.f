      PROGRAM EULER_ENERGIA

      PARAMETER(PI = 3.1415927)

      WRITE(*,*) 'Diga theta_0'
      READ(*,*) theta
      WRITE(*,*) 'Eleja delta_t'
      READ(*,*) delta_t

      OPEN(UNIT=10, FILE='euler_energia.dat', STATUS='UNKNOWN')

C     Calcular o período
      T = (2*PI)*(1 + (1/4)*(SIN(theta/2))**2 + 
     &(9/64)*(SIN(theta/2))**4)

C     Calcular o índice do período
      i_T = T/delta_t

C     Inicializei o omega explicitamente porque, do contrário, ocorriam
C     problemas relacionados à valores fantasmas. 
      omega = 0

C     Posição
      DO i=1,50*(i_T)
        theta = MOD(theta, PI)
        temp = omega
        omega = omega - SIN(theta)*delta_t
        theta = theta + temp*delta_t  
        energia = (9.8**2)*(1 - COS(theta) + ((omega**2)/2))
        WRITE(10,*) (i*delta_t), energia
      END DO
        
      END PROGRAM 


