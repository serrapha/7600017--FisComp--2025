      PROGRAM CROMER_POS

      PARAMETER(PI = 3.1415927)

      WRITE(*,*) 'Diga theta_0'
      READ(*,*) theta
      WRITE(*,*) 'Eleja delta_t'
      READ(*,*) delta_t

      OPEN(UNIT=10, FILE='cromer_posicao.dat', STATUS='UNKNOWN')

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
        omega = omega - SIN(theta)*delta_t
        theta = theta + omega*delta_t  
        WRITE(10,*) (i*delta_t), theta
      END DO
        
      END PROGRAM 


