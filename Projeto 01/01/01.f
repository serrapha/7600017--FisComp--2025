      PROGRAM JUROS
     
      WRITE(*,*) 'Valor a ser recebido' 
      READ(*,*) Q
      WRITE(*,*) 'Quantidade de parcelas'
      READ(*,*) C
      WRITE(*,*) 'Juros'
      READ(*,*) AJM 

      V = (Q/C)*AJM 

      WRITE(*,*) V

      END
