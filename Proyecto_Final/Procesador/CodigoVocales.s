			// El registro r6 se usará para almacenar el número de vocales requerido
			MOV		r0,#0		// Puntero principal del caracter que se esta analizando
			MOV		r2,#0 		// Contador para saber inicio de cada palabra.
			MOV		r3,#0		// Contador de vocales
			MOV		r4,#0x00000000 	// Color rojo
			ADD		r4,r4,#0x24	   	// Simbolo dolar de color rojo.
			MOV		r7,#0x00000000 	// Color verde
			MOV		r5,#0			// Registro para almacenar la direccion efectiva de cada store.
			MOV		r8,#0x4000 		// Direccion a partir de la cual se pueden almacenar los valores
			MOV		r6,#3			// Número de vocales requerido para reemplazar (puede cambiarse según se necesite)
			
find_cycle:
			LDR		r1,[r0]		// Cargar la letra de la posicion del puntero.	
			ADD		r5,r0,r8	// Direccion efectiva donde se debe guardar, r0 + 4000 = 4008 por ejemplo.
			STR		r1,[r5]		// Almacena todo caracter leido en la direccion efectiva

			// Compare para saber cuando se finaliza el texto.
			CMP		r1,#0		
			BEQ		fin
			
			// Compares para saber si es un espacio.
			CMP		r1,#32
			BEQ		comparar_n_vocales
			
			// Compares para saber si es una vocal, ASCII en mayuscula y minuscula.
			// A,E,I,O,U,a,e,i,o,u
			CMP		r1,#65		
			BEQ		vowel
			CMP		r1,#69		
			BEQ		vowel
			CMP		r1,#73		
			BEQ		vowel
			CMP		r1,#79		
			BEQ		vowel
			CMP		r1,#85		
			BEQ		vowel
			CMP		r1,#97		
			BEQ		vowel
			CMP		r1,#101		
			BEQ		vowel
			CMP		r1,#105		
			BEQ		vowel
			CMP		r1,#111		
			BEQ		vowel
			CMP		r1,#117		
			BEQ		vowel
			
			ADD		r0,r0,#4 	// Mover puntero a siguiente letra

			B		find_cycle
			
vowel:		
			ADD		r3,r3,#1	// Sumar al contador de vocales
			ADD		r0,r0,#4 	// Mover puntero a siguiente letra
			
			//CMP		r3,r6		// Verificar si el contador de vocales alcanza el número requerido
			//BEQ		set_pointer
			
			B		find_cycle
					
set_pointer:
			MOV		r0,r2 		// Setear el contador al inicio de la palabra que se debe cambiar
			
replace_cycle:
			LDR		r1,[r0]		// Cargar la letra de la posicion del puntero.		
			ADD		r5,r0,r8	// Direccion efectiva donde se debe guardar, r0 + 4000 = 4008 por ejemplo.
			
			// Compare para saber cuando se finaliza el texto.
			CMP		r1,#0
			BEQ		fin
			
			// Compares para saber si es un espacio.
			CMP		r1,#32
			BEQ		space
			
			// Compares para saber si es una vocal, ASCII en mayuscula y minuscula.
			// A,E,I,O,U,a,e,i,o,u
			CMP		r1,#65		
			BEQ		replace
			CMP		r1,#69		
			BEQ		replace
			CMP		r1,#73		
			BEQ		replace
			CMP		r1,#79		
			BEQ		replace
			CMP		r1,#85		
			BEQ		replace
			CMP		r1,#97		
			BEQ		replace
			CMP		r1,#101		
			BEQ		replace
			CMP		r1,#105		
			BEQ		replace
			CMP		r1,#111		
			BEQ		replace
			CMP		r1,#117		
			BEQ		replace
			
			// La direccion efectiva se actualizo arriba de los compare, por eso no se vuelve a actualizar
			ADD		r1,r1,r7	// Agregar color a la letra de palabra reemplazada.
			STR		r1,[r5]		// Guardar en la posicion r5, el valor leido que no corresponde ni a vocal ni a espacio.
			ADD		r0,r0,#4	// Mover puntero a siguiente letra
			
			B		replace_cycle
			
			
replace:		
			STR		r4,[r5]		// Guardar en la posicion r5, el simbolo de dolar.
			ADD		r0,r0,#4	// Mover puntero a siguiente letra
			
			B		replace_cycle
			
comparar_n_vocales:

			CMP		r3,r6		// Verificar si el contador de vocales alcanza el número requerido
			BEQ		set_pointer
			B space

			
space:		
			
			STR		r1,[r5]		// Guardar en la posicion r5, el valor del espacio.
			ADD		r0,r0,#4	// Mover puntero a siguiente letra
			MOV		r2,r0	 	// Actualizar el contador, inicio de la nueva palabra 
			MOV		r3,#0	 	// Reiniciar el contador de vocales
			
			B		find_cycle
			
fin:
