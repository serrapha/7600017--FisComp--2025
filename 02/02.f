      PROGRAM TORO

      PI = 3.14159

      WRITE(*,*)"Insira o raio interno"        
      READ(*,*) R1
      WRITE(*,*)"Insira o raio externo"
      READ(*,*) R2

      AREA = 4 * PI * PI * R1 * R2
      VOL = 2 * PI * PI * R2 * R1 * R1

      WRITE(*,*)"A ÁREA É: ", AREA
      WRITE(*,*)"O VOLUME É: ", VOL 

      END
