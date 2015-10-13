
_Init:

;GC V2.c,116 :: 		void Init()
;GC V2.c,119 :: 		OSCCON=0b01100000;
	MOVLW       96
	MOVWF       OSCCON+0 
;GC V2.c,120 :: 		OSCTUNE.PLLEN=1;
	BSF         OSCTUNE+0, 6 
;GC V2.c,122 :: 		ANCON0=0;
	CLRF        ANCON0+0 
;GC V2.c,123 :: 		ANCON1=0;
	CLRF        ANCON1+0 
;GC V2.c,125 :: 		porta=0;
	CLRF        PORTA+0 
;GC V2.c,126 :: 		portb=0;
	CLRF        PORTB+0 
;GC V2.c,127 :: 		portc=0;
	CLRF        PORTC+0 
;GC V2.c,128 :: 		portd=0;
	CLRF        PORTD+0 
;GC V2.c,129 :: 		porte=0;
	CLRF        PORTE+0 
;GC V2.c,130 :: 		trisa=0b11010111;
	MOVLW       215
	MOVWF       TRISA+0 
;GC V2.c,131 :: 		trisb=0b11000000;
	MOVLW       192
	MOVWF       TRISB+0 
;GC V2.c,132 :: 		trisc=0b10111101;
	MOVLW       189
	MOVWF       TRISC+0 
;GC V2.c,133 :: 		trisd=0b01110000;
	MOVLW       112
	MOVWF       TRISD+0 
;GC V2.c,134 :: 		trise=0b1111;
	MOVLW       15
	MOVWF       TRISE+0 
;GC V2.c,137 :: 		T0CON=0b10000001; //prescaler 4
	MOVLW       129
	MOVWF       T0CON+0 
;GC V2.c,138 :: 		TMR0H=0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;GC V2.c,139 :: 		TMR0L=0xBF;
	MOVLW       191
	MOVWF       TMR0L+0 
;GC V2.c,140 :: 		INTCON.b7=1;
	BSF         INTCON+0, 7 
;GC V2.c,141 :: 		INTCON.T0IE=1;
	BSF         INTCON+0, 5 
;GC V2.c,144 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;GC V2.c,146 :: 		LCD_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GC V2.c,147 :: 		delay_ms(500);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Init0:
	DECFSZ      R13, 1, 1
	BRA         L_Init0
	DECFSZ      R12, 1, 1
	BRA         L_Init0
	DECFSZ      R11, 1, 1
	BRA         L_Init0
	NOP
;GC V2.c,148 :: 		LCDBL=1;
	BSF         PORTA+0, 5 
;GC V2.c,151 :: 		UART1_Init(9600);
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GC V2.c,153 :: 		RC1IF_bit=0;
	BCF         RC1IF_bit+0, 5 
;GC V2.c,154 :: 		RC1IE_bit=1;
	BSF         RC1IE_bit+0, 5 
;GC V2.c,155 :: 		RC1IP_bit=1;
	BSF         RC1IP_bit+0, 5 
;GC V2.c,156 :: 		PEIE_bit=1;
	BSF         PEIE_bit+0, 6 
;GC V2.c,157 :: 		UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
	MOVLW       _UART1_Read+0
	MOVWF       FARG_UART_Set_Active_read_ptr+0 
	MOVLW       hi_addr(_UART1_Read+0)
	MOVWF       FARG_UART_Set_Active_read_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+3 
	MOVLW       _UART1_Write+0
	MOVWF       FARG_UART_Set_Active_write_ptr+0 
	MOVLW       hi_addr(_UART1_Write+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+1 
	MOVLW       FARG_UART1_Write_data_+0
	MOVWF       FARG_UART_Set_Active_write_ptr+2 
	MOVLW       hi_addr(FARG_UART1_Write_data_+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+3 
	MOVLW       _UART1_Data_Ready+0
	MOVWF       FARG_UART_Set_Active_ready_ptr+0 
	MOVLW       hi_addr(_UART1_Data_Ready+0)
	MOVWF       FARG_UART_Set_Active_ready_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+3 
	MOVLW       _UART1_Tx_Idle+0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+0 
	MOVLW       hi_addr(_UART1_Tx_Idle+0)
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+3 
	CALL        _UART_Set_Active+0, 0
;GC V2.c,160 :: 		SignalingSystem_Init(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_Init+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_Init+1 
	CALL        _SignalingSystem_Init+0, 0
;GC V2.c,163 :: 		DoorStatus=DOORSTATUS_Close;
	MOVLW       2
	MOVWF       _DoorStatus+0 
;GC V2.c,166 :: 		LoadConfig();
	CALL        _LoadConfig+0, 0
;GC V2.c,169 :: 		RS485Slave_Init(NetworkAddress);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_RS485Slave_Init_slave_address+0 
	CALL        _RS485Slave_Init+0, 0
;GC V2.c,170 :: 		}
L_end_Init:
	RETURN      0
; end of _Init

_interrupt:

;GC V2.c,184 :: 		void interrupt()
;GC V2.c,186 :: 		if((TMR0IF_bit)&&(TMR0IE_bit))
	BTFSS       TMR0IF_bit+0, 2 
	GOTO        L_interrupt3
	BTFSS       TMR0IE_bit+0, 5 
	GOTO        L_interrupt3
L__interrupt184:
;GC V2.c,188 :: 		Flag20ms=1;
	MOVLW       1
	MOVWF       _Flag20ms+0 
;GC V2.c,189 :: 		Counterms500=Counterms500+1;
	INCF        _Counterms500+0, 1 
;GC V2.c,190 :: 		if(Counterms500>=25)
	MOVLW       25
	SUBWF       _Counterms500+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt4
;GC V2.c,191 :: 		{Flag500ms=1;Counterms500=0;}
	MOVLW       1
	MOVWF       _Flag500ms+0 
	CLRF        _Counterms500+0 
L_interrupt4:
;GC V2.c,192 :: 		TMR0H=0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;GC V2.c,193 :: 		TMR0L=0xBF;
	MOVLW       191
	MOVWF       TMR0L+0 
;GC V2.c,194 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, 2 
;GC V2.c,195 :: 		}
L_interrupt3:
;GC V2.c,197 :: 		if((RC1IE_bit)&&(RC1IF_bit))
	BTFSS       RC1IE_bit+0, 5 
	GOTO        L_interrupt7
	BTFSS       RC1IF_bit+0, 5 
	GOTO        L_interrupt7
L__interrupt183:
;GC V2.c,199 :: 		RS485Slave_Receive(NetBuffer);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Receive_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Receive_data_buffer+1 
	CALL        _RS485Slave_Receive+0, 0
;GC V2.c,200 :: 		RC1IF_bit=0;
	BCF         RC1IF_bit+0, 5 
;GC V2.c,201 :: 		}
L_interrupt7:
;GC V2.c,202 :: 		}
L_end_interrupt:
L__interrupt200:
	RETFIE      1
; end of _interrupt

_main:

;GC V2.c,215 :: 		void main() {
;GC V2.c,219 :: 		Init();
	CALL        _Init+0, 0
;GC V2.c,221 :: 		LCD_out(1,1,"     Start!     ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr2_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr2_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr2_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr2_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr2_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr2_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,222 :: 		LCD_out(2,1,"                ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr3_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr3_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr3_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr3_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr3_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr3_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,225 :: 		while(1)
L_main8:
;GC V2.c,228 :: 		if(Flag20ms)
	MOVF        _Flag20ms+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;GC V2.c,230 :: 		KeysSystem_EPOCH();
	CALL        _KeysSystem_EPOCH+0, 0
;GC V2.c,232 :: 		if(BuzzerCounter>0)
	MOVF        _BuzzerCounter+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;GC V2.c,233 :: 		{BuzzerCounter=BuzzerCounter-1;Buzzer=1;}
	DECF        _BuzzerCounter+0, 1 
	BSF         PORTA+0, 3 
	GOTO        L_main12
L_main11:
;GC V2.c,235 :: 		Buzzer=0;
	BCF         PORTA+0, 3 
L_main12:
;GC V2.c,237 :: 		Flag20ms=0;
	CLRF        _Flag20ms+0 
;GC V2.c,238 :: 		}
L_main10:
;GC V2.c,240 :: 		if(Flag500ms)
	MOVF        _Flag500ms+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
;GC V2.c,242 :: 		if(LCDBLCounter>0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _LCDBLCounter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main202
	MOVF        _LCDBLCounter+0, 0 
	SUBLW       0
L__main202:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;GC V2.c,243 :: 		LCDBLCounter=LCDBLCounter-1;
	MOVLW       1
	SUBWF       _LCDBLCounter+0, 1 
	MOVLW       0
	SUBWFB      _LCDBLCounter+1, 1 
	GOTO        L_main15
L_main14:
;GC V2.c,245 :: 		LCDBL=0;
	BCF         PORTA+0, 5 
L_main15:
;GC V2.c,246 :: 		LCDFlashState=!LCDFlashState;
	MOVF        _LCDFlashState+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       _LCDFlashState+0 
;GC V2.c,247 :: 		FlashLCD();
	CALL        _FlashLCD+0, 0
;GC V2.c,248 :: 		ms500=ms500+1;
	MOVLW       1
	ADDWF       _ms500+0, 1 
	MOVLW       0
	ADDWFC      _ms500+1, 1 
	ADDWFC      _ms500+2, 1 
	ADDWFC      _ms500+3, 1 
;GC V2.c,249 :: 		SignalingSystem_SystemEPOCH(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_SystemEPOCH+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_SystemEPOCH+1 
	CALL        _SignalingSystem_SystemEPOCH+0, 0
;GC V2.c,250 :: 		SignalingSystem_Task(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_Task+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_Task+1 
	CALL        _SignalingSystem_Task+0, 0
;GC V2.c,251 :: 		Flag500ms=0;
	CLRF        _Flag500ms+0 
;GC V2.c,252 :: 		}
L_main13:
;GC V2.c,255 :: 		Keys=KeysSystem_Task();
	CALL        _KeysSystem_Task+0, 0
	MOVF        R0, 0 
	MOVWF       _Keys+0 
;GC V2.c,256 :: 		if(Keys!=0) {LCDBLCounter=360;BuzzerCounter=3;}
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVLW       104
	MOVWF       _LCDBLCounter+0 
	MOVLW       1
	MOVWF       _LCDBLCounter+1 
	MOVLW       3
	MOVWF       _BuzzerCounter+0 
L_main16:
;GC V2.c,260 :: 		if(DisplayMode==0)
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;GC V2.c,261 :: 		MenuHandler();
	CALL        _MenuHandler+0, 0
L_main17:
;GC V2.c,264 :: 		DoorSimulator();
	CALL        _DoorSimulator+0, 0
;GC V2.c,265 :: 		NetworkTask();
	CALL        _NetworkTask+0, 0
;GC V2.c,266 :: 		DoorManager();
	CALL        _DoorManager+0, 0
;GC V2.c,268 :: 		if(LCDBLCounter>0)LCDBL=1;
	MOVLW       0
	MOVWF       R0 
	MOVF        _LCDBLCounter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main203
	MOVF        _LCDBLCounter+0, 0 
	SUBLW       0
L__main203:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
	BSF         PORTA+0, 5 
L_main18:
;GC V2.c,269 :: 		}
	GOTO        L_main8
;GC V2.c,270 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ShowLCTime:

;GC V2.c,286 :: 		void ShowLCTime()
;GC V2.c,293 :: 		tm=(ms500-LCTime)/2;
	MOVF        _ms500+0, 0 
	MOVWF       R5 
	MOVF        _ms500+1, 0 
	MOVWF       R6 
	MOVF        _ms500+2, 0 
	MOVWF       R7 
	MOVF        _ms500+3, 0 
	MOVWF       R8 
	MOVF        _LCTime+0, 0 
	SUBWF       R5, 1 
	MOVF        _LCTime+1, 0 
	SUBWFB      R6, 1 
	MOVF        _LCTime+2, 0 
	SUBWFB      R7, 1 
	MOVF        _LCTime+3, 0 
	SUBWFB      R8, 1 
	MOVF        R5, 0 
	MOVWF       R1 
	MOVF        R6, 0 
	MOVWF       R2 
	MOVF        R7, 0 
	MOVWF       R3 
	MOVF        R8, 0 
	MOVWF       R4 
	RRCF        R4, 1 
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	BCF         R4, 7 
	MOVF        R1, 0 
	MOVWF       ShowLCTime_tm_L0+0 
	MOVF        R2, 0 
	MOVWF       ShowLCTime_tm_L0+1 
	MOVF        R3, 0 
	MOVWF       ShowLCTime_tm_L0+2 
	MOVF        R4, 0 
	MOVWF       ShowLCTime_tm_L0+3 
;GC V2.c,294 :: 		if(tm!=PrevLCTime)
	MOVF        R4, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime205
	MOVF        R3, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime205
	MOVF        R2, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime205
	MOVF        R1, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+0, 0 
L__ShowLCTime205:
	BTFSC       STATUS+0, 2 
	GOTO        L_ShowLCTime19
;GC V2.c,296 :: 		PrevLCTime=tm;
	MOVF        ShowLCTime_tm_L0+0, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+0 
	MOVF        ShowLCTime_tm_L0+1, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+1 
	MOVF        ShowLCTime_tm_L0+2, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+2 
	MOVF        ShowLCTime_tm_L0+3, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+3 
;GC V2.c,297 :: 		seconds=(tm%60);
	MOVLW       60
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        ShowLCTime_tm_L0+0, 0 
	MOVWF       R0 
	MOVF        ShowLCTime_tm_L0+1, 0 
	MOVWF       R1 
	MOVF        ShowLCTime_tm_L0+2, 0 
	MOVWF       R2 
	MOVF        ShowLCTime_tm_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       ShowLCTime_seconds_L0+0 
;GC V2.c,298 :: 		tm=tm/60;
	MOVLW       60
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        ShowLCTime_tm_L0+0, 0 
	MOVWF       R0 
	MOVF        ShowLCTime_tm_L0+1, 0 
	MOVWF       R1 
	MOVF        ShowLCTime_tm_L0+2, 0 
	MOVWF       R2 
	MOVF        ShowLCTime_tm_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       ShowLCTime_tm_L0+0 
	MOVF        R1, 0 
	MOVWF       ShowLCTime_tm_L0+1 
	MOVF        R2, 0 
	MOVWF       ShowLCTime_tm_L0+2 
	MOVF        R3, 0 
	MOVWF       ShowLCTime_tm_L0+3 
;GC V2.c,299 :: 		minutes=(tm%60);
	MOVLW       60
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       ShowLCTime_minutes_L0+0 
;GC V2.c,300 :: 		hours=tm/60;
	MOVLW       60
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        ShowLCTime_tm_L0+0, 0 
	MOVWF       R0 
	MOVF        ShowLCTime_tm_L0+1, 0 
	MOVWF       R1 
	MOVF        ShowLCTime_tm_L0+2, 0 
	MOVWF       R2 
	MOVF        ShowLCTime_tm_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
;GC V2.c,302 :: 		wordtostr(hours,txt+2);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       ShowLCTime_txt_L0+2
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+2)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;GC V2.c,303 :: 		bytetostr(minutes,txt+8);
	MOVF        ShowLCTime_minutes_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       ShowLCTime_txt_L0+8
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+8)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,304 :: 		bytetostr(seconds,txt+12);
	MOVF        ShowLCTime_seconds_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       ShowLCTime_txt_L0+12
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+12)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,305 :: 		memcpy(txt,"LC:",3);
	MOVLW       ShowLCTime_txt_L0+0
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+0)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       76
	MOVWF       ?lstr4_GC_32V2+0 
	MOVLW       67
	MOVWF       ?lstr4_GC_32V2+1 
	MOVLW       58
	MOVWF       ?lstr4_GC_32V2+2 
	CLRF        ?lstr4_GC_32V2+3 
	MOVLW       ?lstr4_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr4_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       3
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;GC V2.c,306 :: 		memcpy(txt+7,"H ",2);
	MOVLW       ShowLCTime_txt_L0+7
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+7)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       72
	MOVWF       ?lstr5_GC_32V2+0 
	MOVLW       32
	MOVWF       ?lstr5_GC_32V2+1 
	CLRF        ?lstr5_GC_32V2+2 
	MOVLW       ?lstr5_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr5_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       2
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;GC V2.c,307 :: 		memcpy(txt+11,"M ",2);
	MOVLW       ShowLCTime_txt_L0+11
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+11)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       77
	MOVWF       ?lstr6_GC_32V2+0 
	MOVLW       32
	MOVWF       ?lstr6_GC_32V2+1 
	CLRF        ?lstr6_GC_32V2+2 
	MOVLW       ?lstr6_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr6_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       2
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;GC V2.c,308 :: 		memcpy(txt+15,"S ",2);
	MOVLW       ShowLCTime_txt_L0+15
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+15)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       83
	MOVWF       ?lstr7_GC_32V2+0 
	MOVLW       32
	MOVWF       ?lstr7_GC_32V2+1 
	CLRF        ?lstr7_GC_32V2+2 
	MOVLW       ?lstr7_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr7_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       2
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;GC V2.c,309 :: 		txt[16]=0;
	CLRF        ShowLCTime_txt_L0+16 
;GC V2.c,311 :: 		LCD_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ShowLCTime_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,312 :: 		}
L_ShowLCTime19:
;GC V2.c,318 :: 		}
L_end_ShowLCTime:
	RETURN      0
; end of _ShowLCTime

_MenuHandler:

;GC V2.c,338 :: 		void MenuHandler()
;GC V2.c,340 :: 		switch(MenuState)
	GOTO        L_MenuHandler20
;GC V2.c,342 :: 		case 0:
L_MenuHandler22:
;GC V2.c,343 :: 		if(Keys & CENTER) {MenuState=1;MenuCounter=0;}
	BTFSS       _Keys+0, 1 
	GOTO        L_MenuHandler23
	MOVLW       1
	MOVWF       _MenuState+0 
	CLRF        _MenuCounter+0 
L_MenuHandler23:
;GC V2.c,344 :: 		ShowLCTime();
	CALL        _ShowLCTime+0, 0
;GC V2.c,345 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,347 :: 		case 1:
L_MenuHandler24:
;GC V2.c,348 :: 		Menu1();
	CALL        _Menu1+0, 0
;GC V2.c,349 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,351 :: 		case 2:
L_MenuHandler25:
;GC V2.c,352 :: 		Menu2();
	CALL        _Menu2+0, 0
;GC V2.c,353 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,355 :: 		case 3:
L_MenuHandler26:
;GC V2.c,356 :: 		Menu3();
	CALL        _Menu3+0, 0
;GC V2.c,357 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,358 :: 		}
L_MenuHandler20:
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_MenuHandler22
	MOVF        _MenuState+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_MenuHandler24
	MOVF        _MenuState+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_MenuHandler25
	MOVF        _MenuState+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_MenuHandler26
L_MenuHandler21:
;GC V2.c,359 :: 		}
L_end_MenuHandler:
	RETURN      0
; end of _MenuHandler

_UpdateMenuText:

;GC V2.c,370 :: 		void UpdateMenuText()
;GC V2.c,374 :: 		memcpy(txt,"                ",10);
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       ?ICS?lstr8_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr8_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr8_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr8_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr8_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr8_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr8_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       10
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
;GC V2.c,375 :: 		LCD_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GC V2.c,376 :: 		switch(MenuCounter)
	GOTO        L_UpdateMenuText27
;GC V2.c,378 :: 		case 0:
L_UpdateMenuText29:
;GC V2.c,379 :: 		lcd_out(1,1,"1 Openning Time ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr9_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr9_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr9_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr9_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr9_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr9_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,380 :: 		charValueToStr(OpenningTime,txt);
	MOVF        _OpenningTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,381 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,382 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,384 :: 		case 1:
L_UpdateMenuText30:
;GC V2.c,385 :: 		lcd_out(1,1,"2 Closing Time  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr10_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr10_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr10_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr10_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr10_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr10_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,386 :: 		charValueToStr(ClosingTime,txt);
	MOVF        _ClosingTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,387 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,388 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,390 :: 		case 2:
L_UpdateMenuText31:
;GC V2.c,391 :: 		lcd_out(1,1,"3 Invalid Time  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr11_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr11_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr11_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr11_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr11_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr11_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,392 :: 		charValueToStr(InvalidTime,txt);
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,393 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,394 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,396 :: 		case 3:
L_UpdateMenuText32:
;GC V2.c,397 :: 		lcd_out(1,1,"4 Autoclose Time");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr12_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr12_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr12_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr12_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr12_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr12_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,398 :: 		charValueToStr(AutocloseTime,txt);
	MOVF        _AutocloseTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,399 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,400 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,402 :: 		case 4:
L_UpdateMenuText33:
;GC V2.c,403 :: 		lcd_out(1,1,"5 Net Address   ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr13_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr13_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr13_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr13_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr13_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr13_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,404 :: 		byteToStr(NetworkAddress,txt);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,405 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,406 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,408 :: 		case 5:
L_UpdateMenuText34:
;GC V2.c,409 :: 		lcd_out(1,1,"6 Working Mode  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr14_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr14_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr14_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr14_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr14_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr14_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,410 :: 		if(WorkingMode==0)
	MOVF        _WorkingMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UpdateMenuText35
;GC V2.c,411 :: 		lcd_out(2,1,"   Start/Stop   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr15_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr15_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr15_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr15_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr15_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr15_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_UpdateMenuText36
L_UpdateMenuText35:
;GC V2.c,413 :: 		lcd_out(2,1,"   Open/Close   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr16_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr16_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr16_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr16_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr16_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr16_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_UpdateMenuText36:
;GC V2.c,414 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,416 :: 		case 6:
L_UpdateMenuText37:
;GC V2.c,417 :: 		lcd_out(1,1,"7 IR in Mode   ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr17_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr17_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr17_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr17_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr17_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       16
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr17_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,418 :: 		if(IRMode==0)
	MOVF        _IRMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UpdateMenuText38
;GC V2.c,419 :: 		lcd_out(2,1,"       NC       ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr18_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr18_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr18_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr18_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr18_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr18_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_UpdateMenuText39
L_UpdateMenuText38:
;GC V2.c,421 :: 		lcd_out(2,1,"       NO       ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr19_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr19_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr19_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr19_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr19_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr19_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_UpdateMenuText39:
;GC V2.c,422 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,424 :: 		case 7:
L_UpdateMenuText40:
;GC V2.c,425 :: 		lcd_out(1,1,"8 Save Changes  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr20_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr20_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr20_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr20_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr20_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr20_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,426 :: 		lcd_out(2,1,_Blank);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        __Blank+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        __Blank+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,427 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,429 :: 		case 8:
L_UpdateMenuText41:
;GC V2.c,430 :: 		lcd_out(1,1,"9 Discard & Exit");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr21_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr21_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr21_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr21_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr21_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr21_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,431 :: 		lcd_out(2,1,_Blank);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        __Blank+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        __Blank+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,432 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,434 :: 		}
L_UpdateMenuText27:
	MOVF        _MenuCounter+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText29
	MOVF        _MenuCounter+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText30
	MOVF        _MenuCounter+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText31
	MOVF        _MenuCounter+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText32
	MOVF        _MenuCounter+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText33
	MOVF        _MenuCounter+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText34
	MOVF        _MenuCounter+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText37
	MOVF        _MenuCounter+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText40
	MOVF        _MenuCounter+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_UpdateMenuText41
L_UpdateMenuText28:
;GC V2.c,435 :: 		}
L_end_UpdateMenuText:
	RETURN      0
; end of _UpdateMenuText

_Menu1:

;GC V2.c,449 :: 		void Menu1()
;GC V2.c,451 :: 		UpdateMenuText();
	CALL        _UpdateMenuText+0, 0
;GC V2.c,452 :: 		MenuState=2;
	MOVLW       2
	MOVWF       _MenuState+0 
;GC V2.c,453 :: 		}
L_end_Menu1:
	RETURN      0
; end of _Menu1

_Menu2:

;GC V2.c,463 :: 		void Menu2()
;GC V2.c,467 :: 		LCDFlashFlag=0;
	CLRF        _LCDFlashFlag+0 
;GC V2.c,468 :: 		if(Keys & DOWN)
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu242
;GC V2.c,470 :: 		if(MenuCounter>0)
	MOVF        _MenuCounter+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu243
;GC V2.c,471 :: 		MenuCounter=MenuCounter-1;
	DECF        _MenuCounter+0, 1 
	GOTO        L_Menu244
L_Menu243:
;GC V2.c,473 :: 		MenuCounter=MenuLevel;
	MOVLW       8
	MOVWF       _MenuCounter+0 
L_Menu244:
;GC V2.c,474 :: 		MenuState=1;
	MOVLW       1
	MOVWF       _MenuState+0 
;GC V2.c,475 :: 		}
L_Menu242:
;GC V2.c,477 :: 		if(Keys & UP)
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu245
;GC V2.c,479 :: 		if(MenuCounter<MenuLevel)
	MOVLW       8
	SUBWF       _MenuCounter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu246
;GC V2.c,480 :: 		MenuCounter=MenuCounter+1;
	INCF        _MenuCounter+0, 1 
	GOTO        L_Menu247
L_Menu246:
;GC V2.c,482 :: 		MenuCounter=0;
	CLRF        _MenuCounter+0 
L_Menu247:
;GC V2.c,483 :: 		MenuState=1;
	MOVLW       1
	MOVWF       _MenuState+0 
;GC V2.c,484 :: 		}
L_Menu245:
;GC V2.c,486 :: 		if(Keys & CENTER)
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu248
;GC V2.c,487 :: 		MenuState=3;
	MOVLW       3
	MOVWF       _MenuState+0 
L_Menu248:
;GC V2.c,488 :: 		}
L_end_Menu2:
	RETURN      0
; end of _Menu2

_Menu3:

;GC V2.c,497 :: 		void Menu3()
;GC V2.c,499 :: 		LCDFlashFlag=1;
	MOVLW       1
	MOVWF       _LCDFlashFlag+0 
;GC V2.c,500 :: 		switch(MenuCounter)
	GOTO        L_Menu349
;GC V2.c,502 :: 		case 0:
L_Menu351:
;GC V2.c,503 :: 		if(Keys & UP)     if(OpenningTime<255)  {OpenningTime=OpenningTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu352
	MOVLW       255
	SUBWF       _OpenningTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu353
	INCF        _OpenningTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu353:
L_Menu352:
;GC V2.c,504 :: 		if(Keys & DOWN)   if(OpenningTime>0)    {OpenningTime=OpenningTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu354
	MOVF        _OpenningTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu355
	DECF        _OpenningTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu355:
L_Menu354:
;GC V2.c,505 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu356
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu356:
;GC V2.c,506 :: 		break;
	GOTO        L_Menu350
;GC V2.c,508 :: 		case 1:
L_Menu357:
;GC V2.c,509 :: 		if(Keys & UP)     if(ClosingTime<255)  {ClosingTime=ClosingTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu358
	MOVLW       255
	SUBWF       _ClosingTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu359
	INCF        _ClosingTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu359:
L_Menu358:
;GC V2.c,510 :: 		if(Keys & DOWN)   if(ClosingTime>0)    {ClosingTime=ClosingTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu360
	MOVF        _ClosingTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu361
	DECF        _ClosingTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu361:
L_Menu360:
;GC V2.c,511 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu362
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu362:
;GC V2.c,512 :: 		break;
	GOTO        L_Menu350
;GC V2.c,514 :: 		case 2:
L_Menu363:
;GC V2.c,515 :: 		if(Keys & UP)     if(InvalidTime<255)  {InvalidTime=InvalidTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu364
	MOVLW       255
	SUBWF       _InvalidTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu365
	INCF        _InvalidTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu365:
L_Menu364:
;GC V2.c,516 :: 		if(Keys & DOWN)   if(InvalidTime>0)    {InvalidTime=InvalidTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu366
	MOVF        _InvalidTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu367
	DECF        _InvalidTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu367:
L_Menu366:
;GC V2.c,517 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu368
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu368:
;GC V2.c,518 :: 		break;
	GOTO        L_Menu350
;GC V2.c,520 :: 		case 3:
L_Menu369:
;GC V2.c,521 :: 		if(Keys & UP)     if(AutocloseTime<255)  {AutocloseTime=AutocloseTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu370
	MOVLW       255
	SUBWF       _AutocloseTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu371
	INCF        _AutocloseTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu371:
L_Menu370:
;GC V2.c,522 :: 		if(Keys & DOWN)   if(AutocloseTime>0)    {AutocloseTime=AutocloseTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu372
	MOVF        _AutocloseTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu373
	DECF        _AutocloseTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu373:
L_Menu372:
;GC V2.c,523 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu374
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu374:
;GC V2.c,524 :: 		break;
	GOTO        L_Menu350
;GC V2.c,526 :: 		case 4:
L_Menu375:
;GC V2.c,527 :: 		if(Keys & UP)     if(NetworkAddress<255)  {NetworkAddress=NetworkAddress+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu376
	MOVLW       255
	SUBWF       _NetworkAddress+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu377
	INCF        _NetworkAddress+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu377:
L_Menu376:
;GC V2.c,528 :: 		if(Keys & DOWN)   if(NetworkAddress>0)    {NetworkAddress=NetworkAddress-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu378
	MOVF        _NetworkAddress+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu379
	DECF        _NetworkAddress+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu379:
L_Menu378:
;GC V2.c,529 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu380
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu380:
;GC V2.c,530 :: 		break;
	GOTO        L_Menu350
;GC V2.c,532 :: 		case 5:
L_Menu381:
;GC V2.c,533 :: 		if(Keys & UP)     if(WorkingMode<1)  {WorkingMode=WorkingMode+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu382
	MOVLW       1
	SUBWF       _WorkingMode+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu383
	INCF        _WorkingMode+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu383:
L_Menu382:
;GC V2.c,534 :: 		if(Keys & DOWN)   if(WorkingMode>0)    {WorkingMode=WorkingMode-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu384
	MOVF        _WorkingMode+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu385
	DECF        _WorkingMode+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu385:
L_Menu384:
;GC V2.c,535 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu386
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu386:
;GC V2.c,536 :: 		break;
	GOTO        L_Menu350
;GC V2.c,538 :: 		case 6:
L_Menu387:
;GC V2.c,539 :: 		if(Keys & UP)     if(IRMode<1)  {IRMode=IRMode+1;UpdateMenuText();}
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu388
	MOVLW       1
	SUBWF       _IRMode+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu389
	INCF        _IRMode+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu389:
L_Menu388:
;GC V2.c,540 :: 		if(Keys & DOWN)   if(IRMode>0)    {IRMode=IRMode-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu390
	MOVF        _IRMode+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu391
	DECF        _IRMode+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu391:
L_Menu390:
;GC V2.c,541 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu392
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu392:
;GC V2.c,542 :: 		break;
	GOTO        L_Menu350
;GC V2.c,544 :: 		case 7:
L_Menu393:
;GC V2.c,545 :: 		if(Keys & CENTER) MenuState=0;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu394
	CLRF        _MenuState+0 
L_Menu394:
;GC V2.c,546 :: 		{LCDFlashFlag=0;SaveConfig();MenuState=0;BuzzerCounter=20;}
	CLRF        _LCDFlashFlag+0 
	CALL        _SaveConfig+0, 0
	CLRF        _MenuState+0 
	MOVLW       20
	MOVWF       _BuzzerCounter+0 
;GC V2.c,547 :: 		break;
	GOTO        L_Menu350
;GC V2.c,549 :: 		case 8:
L_Menu395:
;GC V2.c,550 :: 		if(Keys & CENTER) MenuState=0;
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu396
	CLRF        _MenuState+0 
L_Menu396:
;GC V2.c,551 :: 		{LCDFlashFlag=0;LoadConfig();MenuState=0;}
	CLRF        _LCDFlashFlag+0 
	CALL        _LoadConfig+0, 0
	CLRF        _MenuState+0 
;GC V2.c,552 :: 		break;
	GOTO        L_Menu350
;GC V2.c,553 :: 		}
L_Menu349:
	MOVF        _MenuCounter+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu351
	MOVF        _MenuCounter+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu357
	MOVF        _MenuCounter+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu363
	MOVF        _MenuCounter+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu369
	MOVF        _MenuCounter+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu375
	MOVF        _MenuCounter+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu381
	MOVF        _MenuCounter+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu387
	MOVF        _MenuCounter+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu393
	MOVF        _MenuCounter+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu395
L_Menu350:
;GC V2.c,557 :: 		}
L_end_Menu3:
	RETURN      0
; end of _Menu3

_charValueToStr:

;GC V2.c,572 :: 		void charValueToStr(char val, char * string)
;GC V2.c,574 :: 		bytetostr(val>>1,string);
	MOVF        FARG_charValueToStr_val+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	RRCF        FARG_ByteToStr_input+0, 1 
	BCF         FARG_ByteToStr_input+0, 7 
	MOVF        FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_ByteToStr_output+0 
	MOVF        FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,575 :: 		if((val%2)==1)
	MOVLW       1
	ANDWF       FARG_charValueToStr_val+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_charValueToStr97
;GC V2.c,576 :: 		memcpy(string+3,".5s",4);
	MOVLW       3
	ADDWF       FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       0
	ADDWFC      FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       46
	MOVWF       ?lstr22_GC_32V2+0 
	MOVLW       53
	MOVWF       ?lstr22_GC_32V2+1 
	MOVLW       115
	MOVWF       ?lstr22_GC_32V2+2 
	CLRF        ?lstr22_GC_32V2+3 
	MOVLW       ?lstr22_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr22_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       4
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
	GOTO        L_charValueToStr98
L_charValueToStr97:
;GC V2.c,578 :: 		memcpy(string+3,".0s",4);
	MOVLW       3
	ADDWF       FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       0
	ADDWFC      FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       46
	MOVWF       ?lstr23_GC_32V2+0 
	MOVLW       48
	MOVWF       ?lstr23_GC_32V2+1 
	MOVLW       115
	MOVWF       ?lstr23_GC_32V2+2 
	CLRF        ?lstr23_GC_32V2+3 
	MOVLW       ?lstr23_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr23_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       4
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
L_charValueToStr98:
;GC V2.c,579 :: 		}
L_end_charValueToStr:
	RETURN      0
; end of _charValueToStr

_Sim0:

;GC V2.c,602 :: 		void Sim0() // Close
;GC V2.c,605 :: 		if(DoorActFlag)
	MOVF        _DoorActFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim099
;GC V2.c,607 :: 		SignalingSystem_AddSignal(&SigSys,OpenningTime,50); // OpenTime
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _OpenningTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,608 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,609 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim0102
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim0102
L__Sim0185:
;GC V2.c,611 :: 		LCD_out(2,1,"    Openning    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr24_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr24_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr24_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr24_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr24_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr24_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,612 :: 		}
L_Sim0102:
;GC V2.c,613 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,614 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,615 :: 		}
L_Sim099:
;GC V2.c,616 :: 		}
L_end_Sim0:
	RETURN      0
; end of _Sim0

_Sim1:

;GC V2.c,631 :: 		void Sim1() // Openning
;GC V2.c,633 :: 		if(SignalingSystem_CheckSignal(&SigSys,50))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim1103
;GC V2.c,635 :: 		DoorStatus=DOORSTATUS_Open;
	MOVLW       1
	MOVWF       _DoorStatus+0 
;GC V2.c,636 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim1106
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim1106
L__Sim1186:
;GC V2.c,638 :: 		LCD_out(2,1,"     Opened     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr25_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr25_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr25_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr25_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr25_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr25_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,639 :: 		}
L_Sim1106:
;GC V2.c,640 :: 		SimStatus=2;
	MOVLW       2
	MOVWF       _SimStatus+0 
;GC V2.c,641 :: 		SignalingSystem_AddSignal(&SigSys,AutocloseTime-InvalidTime,51);//AutoClose - Invalid
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _InvalidTime+0, 0 
	SUBWF       _AutocloseTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	SUBWFB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       51
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,642 :: 		}
L_Sim1103:
;GC V2.c,643 :: 		}
L_end_Sim1:
	RETURN      0
; end of _Sim1

_Sim2:

;GC V2.c,659 :: 		void Sim2() // Open
;GC V2.c,661 :: 		if(SignalingSystem_CheckSignal(&SigSys,51))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       51
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim2107
;GC V2.c,663 :: 		DoorStatus=DOORSTATUS_Invalid;
	CLRF        _DoorStatus+0 
;GC V2.c,664 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim2110
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim2110
L__Sim2187:
;GC V2.c,666 :: 		LCD_out(2,1,"    Invalid     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr26_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr26_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr26_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr26_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr26_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr26_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,667 :: 		}
L_Sim2110:
;GC V2.c,668 :: 		SimStatus=3;
	MOVLW       3
	MOVWF       _SimStatus+0 
;GC V2.c,669 :: 		SignalingSystem_AddSignal(&SigSys,InvalidTime*2,52); // invalid time * 2
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	RLCF        FARG_SignalingSystem_AddSignal+0, 1 
	RLCF        FARG_SignalingSystem_AddSignal+1, 1 
	BCF         FARG_SignalingSystem_AddSignal+0, 0 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       52
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,670 :: 		SimTime=ms500+InvalidTime;
	MOVF        _InvalidTime+0, 0 
	ADDWF       _ms500+0, 0 
	MOVWF       _SimTime+0 
	MOVLW       0
	ADDWFC      _ms500+1, 0 
	MOVWF       _SimTime+1 
	MOVLW       0
	ADDWFC      _ms500+2, 0 
	MOVWF       _SimTime+2 
	MOVLW       0
	ADDWFC      _ms500+3, 0 
	MOVWF       _SimTime+3 
;GC V2.c,671 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,672 :: 		}
L_Sim2107:
;GC V2.c,673 :: 		}
L_end_Sim2:
	RETURN      0
; end of _Sim2

_Sim3:

;GC V2.c,696 :: 		void Sim3() // Invalid 1
;GC V2.c,698 :: 		if(SignalingSystem_CheckSignal(&SigSys,52))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       52
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim3111
;GC V2.c,700 :: 		DoorStatus=DOORSTATUS_Closing;
	MOVLW       4
	MOVWF       _DoorStatus+0 
;GC V2.c,701 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3114
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3114
L__Sim3189:
;GC V2.c,703 :: 		LCD_out(2,1,"    Closing     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr27_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr27_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr27_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr27_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr27_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr27_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr27_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,704 :: 		}
L_Sim3114:
;GC V2.c,705 :: 		SimStatus=4;
	MOVLW       4
	MOVWF       _SimStatus+0 
;GC V2.c,706 :: 		SignalingSystem_AddSignal(&SigSys,ClosingTime-(InvalidTime*2),53); // closing time - invalid time * 2
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	SUBWF       _ClosingTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVF        R1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	SUBFWB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,707 :: 		}
L_Sim3111:
;GC V2.c,709 :: 		if(!(IRin^IRMode.b0))
	BTFSC       PORTC+0, 0 
	GOTO        L__Sim3216
	BTFSC       _IRMode+0, 0 
	GOTO        L__Sim3218
	BCF         4056, 0 
	GOTO        L__Sim3217
L__Sim3218:
	BSF         4056, 0 
	GOTO        L__Sim3217
L__Sim3216:
	BTFSC       _IRMode+0, 0 
	GOTO        L__Sim3219
	BSF         4056, 0 
	GOTO        L__Sim3217
L__Sim3219:
	BCF         4056, 0 
L__Sim3217:
	BTFSC       4056, 0 
	GOTO        L_Sim3115
;GC V2.c,711 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,712 :: 		SignalingSystem_ClearSignal(&SigSys,52);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       52
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,713 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,714 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3118
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3118
L__Sim3188:
;GC V2.c,716 :: 		LCD_out(2,1,"    Openning    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr28_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr28_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr28_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr28_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr28_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr28_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,717 :: 		}
L_Sim3118:
;GC V2.c,718 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,719 :: 		SignalingSystem_AddSignal(&SigSys,InvalidTime,50);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,720 :: 		}
L_Sim3115:
;GC V2.c,721 :: 		}
L_end_Sim3:
	RETURN      0
; end of _Sim3

_Sim4:

;GC V2.c,742 :: 		void Sim4() // Closing
;GC V2.c,744 :: 		if(SignalingSystem_CheckSignal(&SigSys,53))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim4119
;GC V2.c,746 :: 		DoorStatus=DOORSTATUS_Invalid;
	CLRF        _DoorStatus+0 
;GC V2.c,747 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4122
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4122
L__Sim4192:
;GC V2.c,749 :: 		LCD_out(2,1,"    Invalid     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr29_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr29_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr29_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr29_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr29_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr29_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,750 :: 		}
L_Sim4122:
;GC V2.c,751 :: 		SimStatus=5;
	MOVLW       5
	MOVWF       _SimStatus+0 
;GC V2.c,752 :: 		SignalingSystem_AddSignal(&SigSys,(InvalidTime*2),54); // invalid time * 2
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	RLCF        FARG_SignalingSystem_AddSignal+0, 1 
	RLCF        FARG_SignalingSystem_AddSignal+1, 1 
	BCF         FARG_SignalingSystem_AddSignal+0, 0 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,753 :: 		}
L_Sim4119:
;GC V2.c,755 :: 		if(!(IRin^IRMode.b0))
	BTFSC       PORTC+0, 0 
	GOTO        L__Sim4221
	BTFSC       _IRMode+0, 0 
	GOTO        L__Sim4223
	BCF         4056, 0 
	GOTO        L__Sim4222
L__Sim4223:
	BSF         4056, 0 
	GOTO        L__Sim4222
L__Sim4221:
	BTFSC       _IRMode+0, 0 
	GOTO        L__Sim4224
	BSF         4056, 0 
	GOTO        L__Sim4222
L__Sim4224:
	BCF         4056, 0 
L__Sim4222:
	BTFSC       4056, 0 
	GOTO        L_Sim4123
;GC V2.c,757 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,758 :: 		SignalingSystem_ClearSignal(&SigSys,54);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,759 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,760 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4126
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4126
L__Sim4191:
;GC V2.c,762 :: 		LCD_out(2,1,"    Openning    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr30_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr30_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr30_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr30_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr30_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr30_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,763 :: 		}
L_Sim4126:
;GC V2.c,764 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,765 :: 		SignalingSystem_AddSignal(&SigSys,ms500-SimTime,50);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _ms500+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVF        _ms500+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _ms500+2, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVF        _ms500+3, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        _SimTime+0, 0 
	SUBWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVF        _SimTime+1, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVF        _SimTime+2, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+2, 1 
	MOVF        _SimTime+3, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+3, 1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,766 :: 		}
L_Sim4123:
;GC V2.c,768 :: 		if(DoorActFlag)
	MOVF        _DoorActFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim4127
;GC V2.c,770 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,771 :: 		SignalingSystem_ClearSignal(&SigSys,54);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,772 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,773 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4130
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4130
L__Sim4190:
;GC V2.c,775 :: 		LCD_out(2,1,"    Openning    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr31_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr31_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr31_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr31_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr31_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr31_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,776 :: 		}
L_Sim4130:
;GC V2.c,777 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,778 :: 		SignalingSystem_AddSignal(&SigSys,ms500-SimTime,50);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _ms500+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVF        _ms500+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        _ms500+2, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVF        _ms500+3, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        _SimTime+0, 0 
	SUBWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVF        _SimTime+1, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVF        _SimTime+2, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+2, 1 
	MOVF        _SimTime+3, 0 
	SUBWFB      FARG_SignalingSystem_AddSignal+3, 1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,779 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,780 :: 		}
L_Sim4127:
;GC V2.c,781 :: 		}
L_end_Sim4:
	RETURN      0
; end of _Sim4

_Sim5:

;GC V2.c,798 :: 		void Sim5() // Invalid 2
;GC V2.c,800 :: 		if(SignalingSystem_CheckSignal(&SigSys,54))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim5131
;GC V2.c,802 :: 		DoorStatus=DOORSTATUS_Close;
	MOVLW       2
	MOVWF       _DoorStatus+0 
;GC V2.c,803 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim5134
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim5134
L__Sim5193:
;GC V2.c,805 :: 		LCD_out(2,1,"     Closed     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr32_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr32_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr32_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr32_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr32_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr32_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr32_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,806 :: 		}
L_Sim5134:
;GC V2.c,807 :: 		SimStatus=0;
	CLRF        _SimStatus+0 
;GC V2.c,808 :: 		}
L_Sim5131:
;GC V2.c,809 :: 		}
L_end_Sim5:
	RETURN      0
; end of _Sim5

_DoorSimulator:

;GC V2.c,828 :: 		void DoorSimulator()
;GC V2.c,830 :: 		switch(SimStatus)
	GOTO        L_DoorSimulator135
;GC V2.c,832 :: 		case 0:
L_DoorSimulator137:
;GC V2.c,833 :: 		Sim0();
	CALL        _Sim0+0, 0
;GC V2.c,834 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,836 :: 		case 1:
L_DoorSimulator138:
;GC V2.c,837 :: 		Sim1();
	CALL        _Sim1+0, 0
;GC V2.c,838 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,840 :: 		case 2:
L_DoorSimulator139:
;GC V2.c,841 :: 		Sim2();
	CALL        _Sim2+0, 0
;GC V2.c,842 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,844 :: 		case 3:
L_DoorSimulator140:
;GC V2.c,845 :: 		Sim3();
	CALL        _Sim3+0, 0
;GC V2.c,846 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,848 :: 		case 4:
L_DoorSimulator141:
;GC V2.c,849 :: 		Sim4();
	CALL        _Sim4+0, 0
;GC V2.c,850 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,852 :: 		case 5:
L_DoorSimulator142:
;GC V2.c,853 :: 		Sim5();
	CALL        _Sim5+0, 0
;GC V2.c,854 :: 		break;
	GOTO        L_DoorSimulator136
;GC V2.c,855 :: 		}
L_DoorSimulator135:
	MOVF        _SimStatus+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator137
	MOVF        _SimStatus+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator138
	MOVF        _SimStatus+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator139
	MOVF        _SimStatus+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator140
	MOVF        _SimStatus+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator141
	MOVF        _SimStatus+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator142
L_DoorSimulator136:
;GC V2.c,856 :: 		}
L_end_DoorSimulator:
	RETURN      0
; end of _DoorSimulator

_SaveConfig:

;GC V2.c,869 :: 		void SaveConfig()
;GC V2.c,871 :: 		eeprom_write(0,OpenningTime);
	CLRF        FARG_EEPROM_Write_address+0 
	CLRF        FARG_EEPROM_Write_address+1 
	MOVF        _OpenningTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,872 :: 		eeprom_write(1,ClosingTime);
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _ClosingTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,873 :: 		eeprom_write(2,InvalidTime);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,874 :: 		eeprom_write(3,AutocloseTime);
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _AutocloseTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,875 :: 		eeprom_write(4,NetworkAddress);
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,876 :: 		eeprom_write(5,WorkingMode);
	MOVLW       5
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _WorkingMode+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,877 :: 		eeprom_write(6,IRMode);
	MOVLW       6
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _IRMode+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,879 :: 		RS485Slave_Init(NetworkAddress);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_RS485Slave_Init_slave_address+0 
	CALL        _RS485Slave_Init+0, 0
;GC V2.c,880 :: 		}
L_end_SaveConfig:
	RETURN      0
; end of _SaveConfig

_LoadConfig:

;GC V2.c,890 :: 		void LoadConfig()
;GC V2.c,892 :: 		OpenningTime=eeprom_read(0);
	CLRF        FARG_EEPROM_Read_address+0 
	CLRF        FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _OpenningTime+0 
;GC V2.c,893 :: 		ClosingTime=eeprom_read(1);
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ClosingTime+0 
;GC V2.c,894 :: 		InvalidTime=eeprom_read(2);
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _InvalidTime+0 
;GC V2.c,895 :: 		AutocloseTime=eeprom_read(3);
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _AutocloseTime+0 
;GC V2.c,896 :: 		NetworkAddress=eeprom_read(4);
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _NetworkAddress+0 
;GC V2.c,897 :: 		WorkingMode=eeprom_read(5);
	MOVLW       5
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _WorkingMode+0 
;GC V2.c,898 :: 		IRMode=eeprom_read(6);
	MOVLW       6
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _IRMode+0 
;GC V2.c,899 :: 		}
L_end_LoadConfig:
	RETURN      0
; end of _LoadConfig

_FlashLCD:

;GC V2.c,912 :: 		void FlashLCD()
;GC V2.c,916 :: 		if(LCDFlashFlag)
	MOVF        _LCDFlashFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD143
;GC V2.c,918 :: 		PrevLCDFlashState=LCDFlashFlag;
	MOVF        _LCDFlashFlag+0, 0 
	MOVWF       FlashLCD_PrevLCDFlashState_L0+0 
;GC V2.c,919 :: 		if(LCDFlashState)
	MOVF        _LCDFlashState+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD144
;GC V2.c,921 :: 		LCD_chr(2,1,'>');LCD_chr(2,2,'>');LCD_chr(2,3,'>');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,922 :: 		LCD_chr(2,16,'<');LCD_chr(2,15,'<');LCD_chr(2,14,'<');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       60
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       60
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       60
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,923 :: 		}
	GOTO        L_FlashLCD145
L_FlashLCD144:
;GC V2.c,926 :: 		LCD_chr(2,1,' ');LCD_chr(2,2,' ');LCD_chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,927 :: 		LCD_chr(2,16,' ');LCD_chr(2,15,' ');LCD_chr(2,14,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,928 :: 		}
L_FlashLCD145:
;GC V2.c,929 :: 		}
	GOTO        L_FlashLCD146
L_FlashLCD143:
;GC V2.c,932 :: 		if(PrevLCDFlashState)
	MOVF        FlashLCD_PrevLCDFlashState_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD147
;GC V2.c,934 :: 		LCD_chr(2,1,' ');LCD_chr(2,2,' ');LCD_chr(2,3,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,935 :: 		LCD_chr(2,16,' ');LCD_chr(2,15,' ');LCD_chr(2,14,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GC V2.c,936 :: 		}
L_FlashLCD147:
;GC V2.c,937 :: 		PrevLCDFlashState=LCDFlashState;
	MOVF        _LCDFlashState+0, 0 
	MOVWF       FlashLCD_PrevLCDFlashState_L0+0 
;GC V2.c,938 :: 		}
L_FlashLCD146:
;GC V2.c,939 :: 		}
L_end_FlashLCD:
	RETURN      0
; end of _FlashLCD

_NetworkTask:

;GC V2.c,947 :: 		void NetworkTask()
;GC V2.c,949 :: 		if (NetBuffer[4]) {                    // upon completed valid message receive
	MOVF        _NetBuffer+4, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask148
;GC V2.c,950 :: 		NetBuffer[4] = 0;                    //   data[4] is set to 0xFF
	CLRF        _NetBuffer+4 
;GC V2.c,951 :: 		switch(NetBuffer[0])
	GOTO        L_NetworkTask149
;GC V2.c,953 :: 		case 1:
L_NetworkTask151:
;GC V2.c,954 :: 		LCTime=ms500;
	MOVF        _ms500+0, 0 
	MOVWF       _LCTime+0 
	MOVF        _ms500+1, 0 
	MOVWF       _LCTime+1 
	MOVF        _ms500+2, 0 
	MOVWF       _LCTime+2 
	MOVF        _ms500+3, 0 
	MOVWF       _LCTime+3 
;GC V2.c,955 :: 		OpenCommand=1;
	MOVLW       1
	MOVWF       _OpenCommand+0 
;GC V2.c,956 :: 		SignalingSystem_ClearSignal(&SigSys,1);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,957 :: 		SignalingSystem_AddSignal(&SigSys,DoorOpenTime,1);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       60
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,958 :: 		NetBuffer[0]=200;
	MOVLW       200
	MOVWF       _NetBuffer+0 
;GC V2.c,959 :: 		Delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_NetworkTask152:
	DECFSZ      R13, 1, 1
	BRA         L_NetworkTask152
	DECFSZ      R12, 1, 1
	BRA         L_NetworkTask152
	NOP
;GC V2.c,960 :: 		RS485Slave_Send(NetBuffer,1);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Send_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Slave_Send_datalen+0 
	CALL        _RS485Slave_Send+0, 0
;GC V2.c,961 :: 		LED=1;
	BSF         PORTD+0, 7 
;GC V2.c,962 :: 		break;
	GOTO        L_NetworkTask150
;GC V2.c,964 :: 		case 2:
L_NetworkTask153:
;GC V2.c,965 :: 		NetBuffer[0]=220;
	MOVLW       220
	MOVWF       _NetBuffer+0 
;GC V2.c,966 :: 		if((DoorStatus==DOORSTATUS_Close)||(DoorStatus==DOORSTATUS_Closing))
	MOVF        _DoorStatus+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask195
	MOVF        _DoorStatus+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask195
	GOTO        L_NetworkTask156
L__NetworkTask195:
;GC V2.c,967 :: 		NetBuffer[0]=200;
	MOVLW       200
	MOVWF       _NetBuffer+0 
L_NetworkTask156:
;GC V2.c,968 :: 		if((DoorStatus==DOORSTATUS_Open)||(DoorStatus==DOORSTATUS_Openning))
	MOVF        _DoorStatus+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask194
	MOVF        _DoorStatus+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask194
	GOTO        L_NetworkTask159
L__NetworkTask194:
;GC V2.c,969 :: 		NetBuffer[0]=210;
	MOVLW       210
	MOVWF       _NetBuffer+0 
L_NetworkTask159:
;GC V2.c,970 :: 		Delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_NetworkTask160:
	DECFSZ      R13, 1, 1
	BRA         L_NetworkTask160
	DECFSZ      R12, 1, 1
	BRA         L_NetworkTask160
	NOP
;GC V2.c,971 :: 		RS485Slave_Send(NetBuffer,1);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Send_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Slave_Send_datalen+0 
	CALL        _RS485Slave_Send+0, 0
;GC V2.c,972 :: 		break;
	GOTO        L_NetworkTask150
;GC V2.c,973 :: 		}
L_NetworkTask149:
	MOVF        _NetBuffer+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask151
	MOVF        _NetBuffer+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask153
L_NetworkTask150:
;GC V2.c,974 :: 		}
L_NetworkTask148:
;GC V2.c,976 :: 		}
L_end_NetworkTask:
	RETURN      0
; end of _NetworkTask

_DoorManager:

;GC V2.c,987 :: 		void DoorManager()
;GC V2.c,997 :: 		if(SignalingSystem_CheckSignal(&SigSys,4))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager161
;GC V2.c,998 :: 		Relay1=1;
	BSF         PORTD+0, 0 
L_DoorManager161:
;GC V2.c,1000 :: 		if(SignalingSystem_CheckSignal(&SigSys,5))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager162
;GC V2.c,1001 :: 		Relay1=0;
	BCF         PORTD+0, 0 
L_DoorManager162:
;GC V2.c,1003 :: 		if(SignalingSystem_CheckSignal(&SigSys,6))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager163
;GC V2.c,1004 :: 		Relay2=1;
	BSF         PORTD+0, 1 
L_DoorManager163:
;GC V2.c,1006 :: 		if(SignalingSystem_CheckSignal(&SigSys,7))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager164
;GC V2.c,1007 :: 		Relay2=0;
	BCF         PORTD+0, 1 
L_DoorManager164:
;GC V2.c,1009 :: 		if(SignalingSystem_CheckSignal(&SigSys,8))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       8
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager165
;GC V2.c,1010 :: 		Relay4=1;
	BSF         PORTD+0, 3 
L_DoorManager165:
;GC V2.c,1012 :: 		if(SignalingSystem_CheckSignal(&SigSys,9))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       9
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager166
;GC V2.c,1013 :: 		Relay4=0;
	BCF         PORTD+0, 3 
L_DoorManager166:
;GC V2.c,1017 :: 		if(SignalingSystem_CheckSignal(&SigSys,1))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager167
;GC V2.c,1018 :: 		OpenCommand=0;
	CLRF        _OpenCommand+0 
L_DoorManager167:
;GC V2.c,1020 :: 		if(SignalingSystem_CheckSignal(&SigSys,2))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager168
;GC V2.c,1021 :: 		ActionTaken=0;
	CLRF        _ActionTaken+0 
L_DoorManager168:
;GC V2.c,1027 :: 		if((DoorStatus==DOORSTATUS_Close) && (OpenCommand) && (!ActionTaken))
	MOVF        _DoorStatus+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager171
	MOVF        _OpenCommand+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager171
	MOVF        _ActionTaken+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager171
L__DoorManager197:
;GC V2.c,1029 :: 		OpenWhenClosed();
	CALL        _OpenWhenClosed+0, 0
;GC V2.c,1030 :: 		ActionTaken=1;
	MOVLW       1
	MOVWF       _ActionTaken+0 
;GC V2.c,1031 :: 		SignalingSystem_AddSignal(&SigSys,DoorActionDelay,2);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1032 :: 		}
L_DoorManager171:
;GC V2.c,1034 :: 		if((DoorStatus==DOORSTATUS_Closing) && (OpenCommand) && (!ActionTaken))
	MOVF        _DoorStatus+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager174
	MOVF        _OpenCommand+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager174
	MOVF        _ActionTaken+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager174
L__DoorManager196:
;GC V2.c,1036 :: 		OpenWhenClosing();
	CALL        _OpenWhenClosing+0, 0
;GC V2.c,1037 :: 		ActionTaken=1;
	MOVLW       1
	MOVWF       _ActionTaken+0 
;GC V2.c,1038 :: 		SignalingSystem_AddSignal(&SigSys,DoorActionDelay,2);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1039 :: 		}
L_DoorManager174:
;GC V2.c,1040 :: 		}
L_end_DoorManager:
	RETURN      0
; end of _DoorManager

_OpenWhenClosed:

;GC V2.c,1066 :: 		void OpenWhenClosed()
;GC V2.c,1076 :: 		switch(WorkingMode)
	GOTO        L_OpenWhenClosed175
;GC V2.c,1078 :: 		case 0: //Start stop mode
L_OpenWhenClosed177:
;GC V2.c,1079 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1080 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1081 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1082 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1083 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1084 :: 		break;
	GOTO        L_OpenWhenClosed176
;GC V2.c,1086 :: 		case 1: // Open stop close mode
L_OpenWhenClosed178:
;GC V2.c,1087 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1088 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1089 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1090 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1091 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1092 :: 		break;
	GOTO        L_OpenWhenClosed176
;GC V2.c,1093 :: 		}
L_OpenWhenClosed175:
	MOVF        _WorkingMode+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OpenWhenClosed177
	MOVF        _WorkingMode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_OpenWhenClosed178
L_OpenWhenClosed176:
;GC V2.c,1094 :: 		}
L_end_OpenWhenClosed:
	RETURN      0
; end of _OpenWhenClosed

_OpenWhenClosing:

;GC V2.c,1113 :: 		void OpenWhenClosing()
;GC V2.c,1123 :: 		switch(WorkingMode)
	GOTO        L_OpenWhenClosing179
;GC V2.c,1125 :: 		case 0: //Start stop mode
L_OpenWhenClosing181:
;GC V2.c,1126 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1127 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1128 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1129 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1130 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1131 :: 		break;
	GOTO        L_OpenWhenClosing180
;GC V2.c,1133 :: 		case 1: // Open stop close mode
L_OpenWhenClosing182:
;GC V2.c,1134 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1135 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1136 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1137 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;GC V2.c,1138 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1139 :: 		break;
	GOTO        L_OpenWhenClosing180
;GC V2.c,1140 :: 		}
L_OpenWhenClosing179:
	MOVF        _WorkingMode+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_OpenWhenClosing181
	MOVF        _WorkingMode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_OpenWhenClosing182
L_OpenWhenClosing180:
;GC V2.c,1141 :: 		}
L_end_OpenWhenClosing:
	RETURN      0
; end of _OpenWhenClosing
