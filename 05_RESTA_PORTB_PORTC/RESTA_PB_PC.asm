;LEA EL PUERTO B Y EL PUERTO C, RESTAR LOS CONTENIDOS Y EL RESULTADO
;SALGA POR EL PUERTO D 

			INCLUDE		<D:\Archivos\Programacion\Microcontroladores\PIC\ASSEMBLER\MPASM\PIC16F887\00_PLANTILLA\PLANTILLA.ASM>
			;NOS DEJA EN EL BANCO 1	
			
;ETIQUETAS | NEMONICOS | OPERANDOS 		| COMENTARIOS	
			MOVLW		0XFF
			MOVWF		TRISB			;PUERTO B COMO ENTRADA
			MOVWF		TRISC			;PUERTO C COMO ENTRADA
			BCF			STATUS,RP0		;BANCO 0
LOOP:
			MOVF		PORTC,W
			SUBWF		PORTB,W
			BTFSS		STATUS,C		;EL RESULTADO ES POSITIVO?
			SUBLW		B'000000000'	;NO,SACAR EL COMPLEMENTO A2 PARA OBTENER LA MAGNITUD 
			MOVWF		PORTD			;SI, MOVER EL RESULTADO AL PUERTO D		
			END