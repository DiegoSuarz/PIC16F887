;DESCRIPCION:
;GENERAR UNA LA CON FRECUENCIA DE 440Hz -> EL PERIODO DE LA SE�AL ES DE 2MS 0 2272uS
;TAMBIEN ES DE INTERES SABER CUANTO VALE EL SEMICICLO T/2= 1136uS
		
			INCLUDE		<D:\Archivos\Programacion\Microcontroladores\PIC\ASSEMBLER\MPASM\PIC16F887\LIBRERIAS\MACROS_RETARDO.ASM> ;MACRO DE RETARDO
			INCLUDE		<D:\Archivos\Programacion\Microcontroladores\PIC\ASSEMBLER\MPASM\PIC16F887\LIBRERIAS\PLANTILLA.ASM>	;CONFIGURACION BASICA

			;NOS DEJA EN EL BANCO 1	
					
;---------------------------MACROS-----------------------------------

;---------------------------DEFINE-----------------------------------
	
;ETIQUETAS | NEMONICOS | OPERANDOS 		| COMENTARIOS	
			BCF			TRISE,1
			BCF			STATUS,RP0		;BANCO 0

INICIO:		BSF			PORTE,1			;1135 uS
			SUBT3V		.1,.1,.102
			BCF			PORTE,1
			SUBT3V		.1,.4,.35		;1133 uS
			GOTO		INICIO
			
			

			INCLUDE		<D:\Archivos\Programacion\Microcontroladores\PIC\ASSEMBLER\MPASM\PIC16F887\LIBRERIAS\RETARDOS.asm>
			;SUBT25MS		
			END