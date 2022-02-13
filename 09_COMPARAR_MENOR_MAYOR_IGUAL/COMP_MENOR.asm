;DESCRIPCION:
;LEA AL PB Y PC
;SI PB>PC; EL PD DEBE SACAR 0X12 Y EL PA DEBE SACAR 0XCC
;SI PB<PC, EL PD DEBE SACAR 0X69 Y EL PA DEBE SACAR 0X7B
;SI PB=PC, EL PD DEBE SACAR 0XE1 Y EL PA DEBA SACAR 0XDD

			INCLUDE		<D:\Archivos\Programacion\Microcontroladores\PIC\ASSEMBLER\MPASM\PIC16F887\00_PLANTILLA\PLANTILLA.ASM>
			;NOS DEJA EN EL BANCO 1	
			
;ETIQUETAS | NEMONICOS | OPERANDOS 		| COMENTARIOS	
			MOVLW		0XFF
			MOVWF		TRISB			;PUERTO B ENTRADA
			MOVWF		TRISC			;PUERTO C ENTRADA
			CLRF		TRISA			;PUERTO A SALIDA
			CLRF		TRISD			;PUERTO D SALIDA
			BCF			STATUS,RP0		;BANCO 1		
			
;LOOP
;			MOVF		PORTC,W			;LEO PUERTO B -> W
;			SUBWF		PORTB,W			;PORTB - W   ->	W
;			BTFSC		STATUS,Z		;Z==0?, EL RESULTADO NO ES CERO?, PB/=PC?
;			GOTO		IGUAL
;			BTFSS		STATUS,C		;PB>PC? , EL RESULTADO ES NEGATIVO?
;			GOTO		PB_MAYOR		
;			MOVLW		0X69
;			MOVWF		PORTD
;			MOVLW		0X7B
;			MOVWF		PORTA
;			GOTO		LOOP
;
;
;IGUAL		MOVLW		0XE1
;			MOVWF		PORTD
;			MOVLW		0XDD
;			MOVWF		PORTA
;			GOTO		LOOP				
;	
;
;PB_MAYOR	
;			MOVLW		0X12
;			MOVWF		PORTD
;			MOVLW		0XCC
;			MOVWF		PORTA
;			GOTO		LOOP				
;					
;			END

;------------------------------------------------------------------------
LOOP:		MOVF		PORTC,W
			SUBWF		PORTB,W
			BTFSS		STATUS,Z			;PB==PC?
			GOTO		DISTINTOS			
			MOVLW		0XE1
			MOVWF		PORTD
			MOVLW		0XDD
			MOVWF		PORTA
			GOTO		LOOP
			
DISTINTOS:	BTFSC		STATUS,C			;PB<PC?
			GOTO		PB_MAYOR
			MOVLW		0X69
			MOVWF		PORTD
			MOVLW		0X7B
			MOVWF		PORTA
			GOTO		LOOP

PB_MAYOR:	MOVLW		0X12
			MOVWF		PORTD
			MOVLW		0XCC
			MOVWF		PORTA
			GOTO		LOOP
			END