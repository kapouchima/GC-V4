
_Init:

;GC V2.c,124 :: 		void Init()
;GC V2.c,127 :: 		OSCCON=0b01100000;
	MOVLW       96
	MOVWF       OSCCON+0 
;GC V2.c,128 :: 		OSCTUNE.PLLEN=1;
	BSF         OSCTUNE+0, 6 
;GC V2.c,130 :: 		ANCON0=0;
	CLRF        ANCON0+0 
;GC V2.c,131 :: 		ANCON1=0;
	CLRF        ANCON1+0 
;GC V2.c,133 :: 		porta=0;
	CLRF        PORTA+0 
;GC V2.c,134 :: 		portb=0;
	CLRF        PORTB+0 
;GC V2.c,135 :: 		portc=0;
	CLRF        PORTC+0 
;GC V2.c,136 :: 		portd=0;
	CLRF        PORTD+0 
;GC V2.c,137 :: 		porte=0;
	CLRF        PORTE+0 
;GC V2.c,138 :: 		trisa=0b10111111;
	MOVLW       191
	MOVWF       TRISA+0 
;GC V2.c,139 :: 		trisb=0b11000000;
	MOVLW       192
	MOVWF       TRISB+0 
;GC V2.c,140 :: 		trisc=0b10000001;
	MOVLW       129
	MOVWF       TRISC+0 
;GC V2.c,141 :: 		trisd=0b10110000;
	MOVLW       176
	MOVWF       TRISD+0 
;GC V2.c,142 :: 		trise=0b1110;
	MOVLW       14
	MOVWF       TRISE+0 
;GC V2.c,145 :: 		T0CON=0b10000001; //prescaler 4
	MOVLW       129
	MOVWF       T0CON+0 
;GC V2.c,146 :: 		TMR0H=0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;GC V2.c,147 :: 		TMR0L=0xBF;
	MOVLW       191
	MOVWF       TMR0L+0 
;GC V2.c,148 :: 		INTCON.b7=1;
	BSF         INTCON+0, 7 
;GC V2.c,149 :: 		INTCON.T0IE=1;
	BSF         INTCON+0, 5 
;GC V2.c,152 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;GC V2.c,154 :: 		LCD_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GC V2.c,155 :: 		delay_ms(500);
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
;GC V2.c,156 :: 		LCDBL=1;
	BSF         PORTA+0, 6 
;GC V2.c,159 :: 		UART1_Init(9600);
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GC V2.c,160 :: 		UART2_Init(9600);
	BSF         BAUDCON2+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH2+0 
	MOVLW       64
	MOVWF       SPBRG2+0 
	BSF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;GC V2.c,161 :: 		RC1IF_bit=0;
	BCF         RC1IF_bit+0, 5 
;GC V2.c,162 :: 		RC1IE_bit=1;
	BSF         RC1IE_bit+0, 5 
;GC V2.c,163 :: 		RC1IP_bit=1;
	BSF         RC1IP_bit+0, 5 
;GC V2.c,164 :: 		PEIE_bit=1;
	BSF         PEIE_bit+0, 6 
;GC V2.c,165 :: 		UART_Set_Active(&UART1_Read, &UART1_Write, &UART1_Data_Ready, &UART1_Tx_Idle);
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
;GC V2.c,168 :: 		SignalingSystem_Init(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_Init+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_Init+1 
	CALL        _SignalingSystem_Init+0, 0
;GC V2.c,171 :: 		DoorStatus=DOORSTATUS_Close;
	MOVLW       2
	MOVWF       _DoorStatus+0 
;GC V2.c,174 :: 		LoadConfig();
	CALL        _LoadConfig+0, 0
;GC V2.c,177 :: 		RS485Slave_Init(NetworkAddress);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_RS485Slave_Init_slave_address+0 
	CALL        _RS485Slave_Init+0, 0
;GC V2.c,178 :: 		}
L_end_Init:
	RETURN      0
; end of _Init

_interrupt:

;GC V2.c,192 :: 		void interrupt()
;GC V2.c,194 :: 		if((TMR0IF_bit)&&(TMR0IE_bit))
	BTFSS       TMR0IF_bit+0, 2 
	GOTO        L_interrupt3
	BTFSS       TMR0IE_bit+0, 5 
	GOTO        L_interrupt3
L__interrupt166:
;GC V2.c,196 :: 		Flag20ms=1;
	MOVLW       1
	MOVWF       _Flag20ms+0 
;GC V2.c,197 :: 		Counterms500=Counterms500+1;
	INCF        _Counterms500+0, 1 
;GC V2.c,198 :: 		if(Counterms500>=25)
	MOVLW       25
	SUBWF       _Counterms500+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt4
;GC V2.c,199 :: 		{Flag500ms=1;Counterms500=0;}
	MOVLW       1
	MOVWF       _Flag500ms+0 
	CLRF        _Counterms500+0 
L_interrupt4:
;GC V2.c,200 :: 		TMR0H=0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;GC V2.c,201 :: 		TMR0L=0xBF;
	MOVLW       191
	MOVWF       TMR0L+0 
;GC V2.c,202 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, 2 
;GC V2.c,203 :: 		}
L_interrupt3:
;GC V2.c,205 :: 		if((RC1IE_bit)&&(RC1IF_bit))
	BTFSS       RC1IE_bit+0, 5 
	GOTO        L_interrupt7
	BTFSS       RC1IF_bit+0, 5 
	GOTO        L_interrupt7
L__interrupt165:
;GC V2.c,207 :: 		RS485Slave_Receive(NetBuffer);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Receive_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Receive_data_buffer+1 
	CALL        _RS485Slave_Receive+0, 0
;GC V2.c,208 :: 		RC1IF_bit=0;
	BCF         RC1IF_bit+0, 5 
;GC V2.c,209 :: 		}
L_interrupt7:
;GC V2.c,210 :: 		}
L_end_interrupt:
L__interrupt182:
	RETFIE      1
; end of _interrupt

_main:

;GC V2.c,223 :: 		void main() {
;GC V2.c,227 :: 		Init();
	CALL        _Init+0, 0
;GC V2.c,229 :: 		LCD_out(1,1,"     Start!     ");
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
;GC V2.c,230 :: 		LCD_out(2,1,"                ");
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
;GC V2.c,233 :: 		while(1)
L_main8:
;GC V2.c,236 :: 		if(Flag20ms)
	MOVF        _Flag20ms+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;GC V2.c,238 :: 		KeysSystem_EPOCH();
	CALL        _KeysSystem_EPOCH+0, 0
;GC V2.c,240 :: 		if(BuzzerCounter>0)
	MOVF        _BuzzerCounter+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;GC V2.c,241 :: 		{BuzzerCounter=BuzzerCounter-1;Buzzer=1;}
	DECF        _BuzzerCounter+0, 1 
	BSF         PORTC+0, 5 
	GOTO        L_main12
L_main11:
;GC V2.c,243 :: 		Buzzer=0;
	BCF         PORTC+0, 5 
L_main12:
;GC V2.c,245 :: 		Flag20ms=0;
	CLRF        _Flag20ms+0 
;GC V2.c,246 :: 		}
L_main10:
;GC V2.c,248 :: 		if(Flag500ms)
	MOVF        _Flag500ms+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
;GC V2.c,250 :: 		if(LCDBLCounter>0)
	MOVLW       0
	MOVWF       R0 
	MOVF        _LCDBLCounter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main184
	MOVF        _LCDBLCounter+0, 0 
	SUBLW       0
L__main184:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;GC V2.c,251 :: 		LCDBLCounter=LCDBLCounter-1;
	MOVLW       1
	SUBWF       _LCDBLCounter+0, 1 
	MOVLW       0
	SUBWFB      _LCDBLCounter+1, 1 
	GOTO        L_main15
L_main14:
;GC V2.c,253 :: 		LCDBL=0;
	BCF         PORTA+0, 6 
L_main15:
;GC V2.c,254 :: 		LCDFlashState=!LCDFlashState;
	MOVF        _LCDFlashState+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       _LCDFlashState+0 
;GC V2.c,255 :: 		FlashLCD();
	CALL        _FlashLCD+0, 0
;GC V2.c,256 :: 		ms500=ms500+1;
	MOVLW       1
	ADDWF       _ms500+0, 1 
	MOVLW       0
	ADDWFC      _ms500+1, 1 
	ADDWFC      _ms500+2, 1 
	ADDWFC      _ms500+3, 1 
;GC V2.c,257 :: 		SignalingSystem_SystemEPOCH(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_SystemEPOCH+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_SystemEPOCH+1 
	CALL        _SignalingSystem_SystemEPOCH+0, 0
;GC V2.c,258 :: 		SignalingSystem_Task(&SigSys);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_Task+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_Task+1 
	CALL        _SignalingSystem_Task+0, 0
;GC V2.c,259 :: 		Flag500ms=0;
	CLRF        _Flag500ms+0 
;GC V2.c,260 :: 		}
L_main13:
;GC V2.c,263 :: 		Keys=KeysSystem_Task();
	CALL        _KeysSystem_Task+0, 0
	MOVF        R0, 0 
	MOVWF       _Keys+0 
;GC V2.c,264 :: 		if(Keys!=0) {LCDBLCounter=360;BuzzerCounter=3;}
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
;GC V2.c,268 :: 		if(DisplayMode==0)
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;GC V2.c,269 :: 		MenuHandler();
	CALL        _MenuHandler+0, 0
L_main17:
;GC V2.c,272 :: 		DoorSimulator();
	CALL        _DoorSimulator+0, 0
;GC V2.c,273 :: 		NetworkTask();
	CALL        _NetworkTask+0, 0
;GC V2.c,274 :: 		DoorManager();
	CALL        _DoorManager+0, 0
;GC V2.c,276 :: 		if(LCDBLCounter>0)LCDBL=1;
	MOVLW       0
	MOVWF       R0 
	MOVF        _LCDBLCounter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main185
	MOVF        _LCDBLCounter+0, 0 
	SUBLW       0
L__main185:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
	BSF         PORTA+0, 6 
L_main18:
;GC V2.c,277 :: 		}
	GOTO        L_main8
;GC V2.c,278 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ShowLCTime:

;GC V2.c,294 :: 		void ShowLCTime()
;GC V2.c,301 :: 		tm=(ms500-LCTime)/2;
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
;GC V2.c,302 :: 		if(tm!=PrevLCTime)
	MOVF        R4, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime187
	MOVF        R3, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime187
	MOVF        R2, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ShowLCTime187
	MOVF        R1, 0 
	XORWF       ShowLCTime_PrevLCTime_L0+0, 0 
L__ShowLCTime187:
	BTFSC       STATUS+0, 2 
	GOTO        L_ShowLCTime19
;GC V2.c,304 :: 		PrevLCTime=tm;
	MOVF        ShowLCTime_tm_L0+0, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+0 
	MOVF        ShowLCTime_tm_L0+1, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+1 
	MOVF        ShowLCTime_tm_L0+2, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+2 
	MOVF        ShowLCTime_tm_L0+3, 0 
	MOVWF       ShowLCTime_PrevLCTime_L0+3 
;GC V2.c,305 :: 		seconds=(tm%60);
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
;GC V2.c,306 :: 		tm=tm/60;
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
;GC V2.c,307 :: 		minutes=(tm%60);
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
;GC V2.c,308 :: 		hours=tm/60;
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
;GC V2.c,310 :: 		wordtostr(hours,txt+2);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       ShowLCTime_txt_L0+2
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+2)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;GC V2.c,311 :: 		bytetostr(minutes,txt+8);
	MOVF        ShowLCTime_minutes_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       ShowLCTime_txt_L0+8
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+8)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,312 :: 		bytetostr(seconds,txt+12);
	MOVF        ShowLCTime_seconds_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       ShowLCTime_txt_L0+12
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+12)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,313 :: 		memcpy(txt,"LC:",3);
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
;GC V2.c,314 :: 		memcpy(txt+7,"H ",2);
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
;GC V2.c,315 :: 		memcpy(txt+11,"M ",2);
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
;GC V2.c,316 :: 		memcpy(txt+15,"S ",2);
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
;GC V2.c,317 :: 		txt[16]=0;
	CLRF        ShowLCTime_txt_L0+16 
;GC V2.c,319 :: 		LCD_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ShowLCTime_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(ShowLCTime_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,320 :: 		}
L_ShowLCTime19:
;GC V2.c,326 :: 		}
L_end_ShowLCTime:
	RETURN      0
; end of _ShowLCTime

_MenuHandler:

;GC V2.c,346 :: 		void MenuHandler()
;GC V2.c,348 :: 		switch(MenuState)
	GOTO        L_MenuHandler20
;GC V2.c,350 :: 		case 0:
L_MenuHandler22:
;GC V2.c,351 :: 		if(Keys & CENTER) {MenuState=1;MenuCounter=0;}
	BTFSS       _Keys+0, 0 
	GOTO        L_MenuHandler23
	MOVLW       1
	MOVWF       _MenuState+0 
	CLRF        _MenuCounter+0 
L_MenuHandler23:
;GC V2.c,352 :: 		ShowLCTime();
	CALL        _ShowLCTime+0, 0
;GC V2.c,353 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,355 :: 		case 1:
L_MenuHandler24:
;GC V2.c,356 :: 		Menu1();
	CALL        _Menu1+0, 0
;GC V2.c,357 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,359 :: 		case 2:
L_MenuHandler25:
;GC V2.c,360 :: 		Menu2();
	CALL        _Menu2+0, 0
;GC V2.c,361 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,363 :: 		case 3:
L_MenuHandler26:
;GC V2.c,364 :: 		Menu3();
	CALL        _Menu3+0, 0
;GC V2.c,365 :: 		break;
	GOTO        L_MenuHandler21
;GC V2.c,366 :: 		}
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
;GC V2.c,367 :: 		}
L_end_MenuHandler:
	RETURN      0
; end of _MenuHandler

_UpdateMenuText:

;GC V2.c,378 :: 		void UpdateMenuText()
;GC V2.c,382 :: 		memcpy(txt,"                ",10);
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
;GC V2.c,383 :: 		LCD_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GC V2.c,384 :: 		switch(MenuCounter)
	GOTO        L_UpdateMenuText27
;GC V2.c,386 :: 		case 0:
L_UpdateMenuText29:
;GC V2.c,387 :: 		lcd_out(1,1,"1 Openning Time ");
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
;GC V2.c,388 :: 		charValueToStr(OpenningTime,txt);
	MOVF        _OpenningTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,389 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,390 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,392 :: 		case 1:
L_UpdateMenuText30:
;GC V2.c,393 :: 		lcd_out(1,1,"2 Closing Time  ");
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
;GC V2.c,394 :: 		charValueToStr(ClosingTime,txt);
	MOVF        _ClosingTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,395 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,396 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,398 :: 		case 2:
L_UpdateMenuText31:
;GC V2.c,399 :: 		lcd_out(1,1,"3 Invalid Time  ");
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
;GC V2.c,400 :: 		charValueToStr(InvalidTime,txt);
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,401 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,402 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,404 :: 		case 3:
L_UpdateMenuText32:
;GC V2.c,405 :: 		lcd_out(1,1,"4 Autoclose Time");
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
;GC V2.c,406 :: 		charValueToStr(AutocloseTime,txt);
	MOVF        _AutocloseTime+0, 0 
	MOVWF       FARG_charValueToStr+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_charValueToStr+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_charValueToStr+1 
	CALL        _charValueToStr+0, 0
;GC V2.c,407 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,408 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,410 :: 		case 4:
L_UpdateMenuText33:
;GC V2.c,411 :: 		lcd_out(1,1,"5 Net Address   ");
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
;GC V2.c,412 :: 		byteToStr(NetworkAddress,txt);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,413 :: 		lcd_out(2,5,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       UpdateMenuText_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(UpdateMenuText_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,414 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,416 :: 		case 5:
L_UpdateMenuText34:
;GC V2.c,417 :: 		lcd_out(1,1,"6 Save Changes  ");
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
;GC V2.c,418 :: 		lcd_out(2,1,_Blank);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        __Blank+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        __Blank+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,419 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,421 :: 		case 6:
L_UpdateMenuText35:
;GC V2.c,422 :: 		lcd_out(1,1,"7 Discard & Exit");
	MOVLW       1
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
;GC V2.c,423 :: 		lcd_out(2,1,_Blank);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        __Blank+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        __Blank+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,424 :: 		break;
	GOTO        L_UpdateMenuText28
;GC V2.c,425 :: 		}
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
	GOTO        L_UpdateMenuText35
L_UpdateMenuText28:
;GC V2.c,426 :: 		}
L_end_UpdateMenuText:
	RETURN      0
; end of _UpdateMenuText

_Menu1:

;GC V2.c,440 :: 		void Menu1()
;GC V2.c,442 :: 		UpdateMenuText();
	CALL        _UpdateMenuText+0, 0
;GC V2.c,443 :: 		MenuState=2;
	MOVLW       2
	MOVWF       _MenuState+0 
;GC V2.c,444 :: 		}
L_end_Menu1:
	RETURN      0
; end of _Menu1

_Menu2:

;GC V2.c,454 :: 		void Menu2()
;GC V2.c,458 :: 		LCDFlashFlag=0;
	CLRF        _LCDFlashFlag+0 
;GC V2.c,459 :: 		if(Keys & DOWN)
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu236
;GC V2.c,461 :: 		if(MenuCounter>0)
	MOVF        _MenuCounter+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu237
;GC V2.c,462 :: 		MenuCounter=MenuCounter-1;
	DECF        _MenuCounter+0, 1 
	GOTO        L_Menu238
L_Menu237:
;GC V2.c,464 :: 		MenuCounter=MenuLevel;
	MOVLW       6
	MOVWF       _MenuCounter+0 
L_Menu238:
;GC V2.c,465 :: 		MenuState=1;
	MOVLW       1
	MOVWF       _MenuState+0 
;GC V2.c,466 :: 		}
L_Menu236:
;GC V2.c,468 :: 		if(Keys & UP)
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu239
;GC V2.c,470 :: 		if(MenuCounter<MenuLevel)
	MOVLW       6
	SUBWF       _MenuCounter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu240
;GC V2.c,471 :: 		MenuCounter=MenuCounter+1;
	INCF        _MenuCounter+0, 1 
	GOTO        L_Menu241
L_Menu240:
;GC V2.c,473 :: 		MenuCounter=0;
	CLRF        _MenuCounter+0 
L_Menu241:
;GC V2.c,474 :: 		MenuState=1;
	MOVLW       1
	MOVWF       _MenuState+0 
;GC V2.c,475 :: 		}
L_Menu239:
;GC V2.c,477 :: 		if(Keys & CENTER)
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu242
;GC V2.c,478 :: 		MenuState=3;
	MOVLW       3
	MOVWF       _MenuState+0 
L_Menu242:
;GC V2.c,479 :: 		}
L_end_Menu2:
	RETURN      0
; end of _Menu2

_Menu3:

;GC V2.c,488 :: 		void Menu3()
;GC V2.c,490 :: 		LCDFlashFlag=1;
	MOVLW       1
	MOVWF       _LCDFlashFlag+0 
;GC V2.c,491 :: 		switch(MenuCounter)
	GOTO        L_Menu343
;GC V2.c,493 :: 		case 0:
L_Menu345:
;GC V2.c,494 :: 		if(Keys & UP)     if(OpenningTime<255)  {OpenningTime=OpenningTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu346
	MOVLW       255
	SUBWF       _OpenningTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu347
	INCF        _OpenningTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu347:
L_Menu346:
;GC V2.c,495 :: 		if(Keys & DOWN)   if(OpenningTime>0)    {OpenningTime=OpenningTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu348
	MOVF        _OpenningTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu349
	DECF        _OpenningTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu349:
L_Menu348:
;GC V2.c,496 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu350
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu350:
;GC V2.c,497 :: 		break;
	GOTO        L_Menu344
;GC V2.c,499 :: 		case 1:
L_Menu351:
;GC V2.c,500 :: 		if(Keys & UP)     if(ClosingTime<255)  {ClosingTime=ClosingTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu352
	MOVLW       255
	SUBWF       _ClosingTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu353
	INCF        _ClosingTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu353:
L_Menu352:
;GC V2.c,501 :: 		if(Keys & DOWN)   if(ClosingTime>0)    {ClosingTime=ClosingTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu354
	MOVF        _ClosingTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu355
	DECF        _ClosingTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu355:
L_Menu354:
;GC V2.c,502 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu356
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu356:
;GC V2.c,503 :: 		break;
	GOTO        L_Menu344
;GC V2.c,505 :: 		case 2:
L_Menu357:
;GC V2.c,506 :: 		if(Keys & UP)     if(InvalidTime<255)  {InvalidTime=InvalidTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu358
	MOVLW       255
	SUBWF       _InvalidTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu359
	INCF        _InvalidTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu359:
L_Menu358:
;GC V2.c,507 :: 		if(Keys & DOWN)   if(InvalidTime>0)    {InvalidTime=InvalidTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu360
	MOVF        _InvalidTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu361
	DECF        _InvalidTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu361:
L_Menu360:
;GC V2.c,508 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu362
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu362:
;GC V2.c,509 :: 		break;
	GOTO        L_Menu344
;GC V2.c,511 :: 		case 3:
L_Menu363:
;GC V2.c,512 :: 		if(Keys & UP)     if(AutocloseTime<255)  {AutocloseTime=AutocloseTime+1;UpdateMenuText();}
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu364
	MOVLW       255
	SUBWF       _AutocloseTime+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu365
	INCF        _AutocloseTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu365:
L_Menu364:
;GC V2.c,513 :: 		if(Keys & DOWN)   if(AutocloseTime>0)    {AutocloseTime=AutocloseTime-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu366
	MOVF        _AutocloseTime+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu367
	DECF        _AutocloseTime+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu367:
L_Menu366:
;GC V2.c,514 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu368
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu368:
;GC V2.c,515 :: 		break;
	GOTO        L_Menu344
;GC V2.c,517 :: 		case 4:
L_Menu369:
;GC V2.c,518 :: 		if(Keys & UP)     if(NetworkAddress<255)  {NetworkAddress=NetworkAddress+1;UpdateMenuText();}
	BTFSS       _Keys+0, 1 
	GOTO        L_Menu370
	MOVLW       255
	SUBWF       _NetworkAddress+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu371
	INCF        _NetworkAddress+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu371:
L_Menu370:
;GC V2.c,519 :: 		if(Keys & DOWN)   if(NetworkAddress>0)    {NetworkAddress=NetworkAddress-1;UpdateMenuText();}
	BTFSS       _Keys+0, 2 
	GOTO        L_Menu372
	MOVF        _NetworkAddress+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Menu373
	DECF        _NetworkAddress+0, 1 
	CALL        _UpdateMenuText+0, 0
L_Menu373:
L_Menu372:
;GC V2.c,520 :: 		if(Keys & CENTER) MenuState=1;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu374
	MOVLW       1
	MOVWF       _MenuState+0 
L_Menu374:
;GC V2.c,521 :: 		break;
	GOTO        L_Menu344
;GC V2.c,523 :: 		case 5:
L_Menu375:
;GC V2.c,524 :: 		if(Keys & CENTER) MenuState=0;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu376
	CLRF        _MenuState+0 
L_Menu376:
;GC V2.c,525 :: 		{LCDFlashFlag=0;SaveConfig();MenuState=0;BuzzerCounter=20;}
	CLRF        _LCDFlashFlag+0 
	CALL        _SaveConfig+0, 0
	CLRF        _MenuState+0 
	MOVLW       20
	MOVWF       _BuzzerCounter+0 
;GC V2.c,526 :: 		break;
	GOTO        L_Menu344
;GC V2.c,528 :: 		case 6:
L_Menu377:
;GC V2.c,529 :: 		if(Keys & CENTER) MenuState=0;
	BTFSS       _Keys+0, 0 
	GOTO        L_Menu378
	CLRF        _MenuState+0 
L_Menu378:
;GC V2.c,530 :: 		{LCDFlashFlag=0;LoadConfig();MenuState=0;}
	CLRF        _LCDFlashFlag+0 
	CALL        _LoadConfig+0, 0
	CLRF        _MenuState+0 
;GC V2.c,531 :: 		break;
	GOTO        L_Menu344
;GC V2.c,532 :: 		}
L_Menu343:
	MOVF        _MenuCounter+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu345
	MOVF        _MenuCounter+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu351
	MOVF        _MenuCounter+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu357
	MOVF        _MenuCounter+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu363
	MOVF        _MenuCounter+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu369
	MOVF        _MenuCounter+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu375
	MOVF        _MenuCounter+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Menu377
L_Menu344:
;GC V2.c,536 :: 		}
L_end_Menu3:
	RETURN      0
; end of _Menu3

_charValueToStr:

;GC V2.c,551 :: 		void charValueToStr(char val, char * string)
;GC V2.c,553 :: 		bytetostr(val>>1,string);
	MOVF        FARG_charValueToStr_val+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	RRCF        FARG_ByteToStr_input+0, 1 
	BCF         FARG_ByteToStr_input+0, 7 
	MOVF        FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_ByteToStr_output+0 
	MOVF        FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;GC V2.c,554 :: 		if((val%2)==1)
	MOVLW       1
	ANDWF       FARG_charValueToStr_val+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_charValueToStr79
;GC V2.c,555 :: 		memcpy(string+3,".5s",4);
	MOVLW       3
	ADDWF       FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       0
	ADDWFC      FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       46
	MOVWF       ?lstr16_GC_32V2+0 
	MOVLW       53
	MOVWF       ?lstr16_GC_32V2+1 
	MOVLW       115
	MOVWF       ?lstr16_GC_32V2+2 
	CLRF        ?lstr16_GC_32V2+3 
	MOVLW       ?lstr16_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr16_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       4
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
	GOTO        L_charValueToStr80
L_charValueToStr79:
;GC V2.c,557 :: 		memcpy(string+3,".0s",4);
	MOVLW       3
	ADDWF       FARG_charValueToStr_string+0, 0 
	MOVWF       FARG_memcpy_d1+0 
	MOVLW       0
	ADDWFC      FARG_charValueToStr_string+1, 0 
	MOVWF       FARG_memcpy_d1+1 
	MOVLW       46
	MOVWF       ?lstr17_GC_32V2+0 
	MOVLW       48
	MOVWF       ?lstr17_GC_32V2+1 
	MOVLW       115
	MOVWF       ?lstr17_GC_32V2+2 
	CLRF        ?lstr17_GC_32V2+3 
	MOVLW       ?lstr17_GC_32V2+0
	MOVWF       FARG_memcpy_s1+0 
	MOVLW       hi_addr(?lstr17_GC_32V2+0)
	MOVWF       FARG_memcpy_s1+1 
	MOVLW       4
	MOVWF       FARG_memcpy_n+0 
	MOVLW       0
	MOVWF       FARG_memcpy_n+1 
	CALL        _memcpy+0, 0
L_charValueToStr80:
;GC V2.c,558 :: 		}
L_end_charValueToStr:
	RETURN      0
; end of _charValueToStr

_Sim0:

;GC V2.c,581 :: 		void Sim0() // Close
;GC V2.c,584 :: 		if(DoorActFlag)
	MOVF        _DoorActFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim081
;GC V2.c,586 :: 		SignalingSystem_AddSignal(&SigSys,OpenningTime,50); // OpenTime
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
;GC V2.c,587 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,588 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim084
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim084
L__Sim0167:
;GC V2.c,590 :: 		LCD_out(2,1,"    Openning    ");
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
;GC V2.c,591 :: 		}
L_Sim084:
;GC V2.c,592 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,593 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,594 :: 		}
L_Sim081:
;GC V2.c,595 :: 		}
L_end_Sim0:
	RETURN      0
; end of _Sim0

_Sim1:

;GC V2.c,610 :: 		void Sim1() // Openning
;GC V2.c,612 :: 		if(SignalingSystem_CheckSignal(&SigSys,50))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim185
;GC V2.c,614 :: 		DoorStatus=DOORSTATUS_Open;
	MOVLW       1
	MOVWF       _DoorStatus+0 
;GC V2.c,615 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim188
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim188
L__Sim1168:
;GC V2.c,617 :: 		LCD_out(2,1,"     Opened     ");
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
;GC V2.c,618 :: 		}
L_Sim188:
;GC V2.c,619 :: 		SimStatus=2;
	MOVLW       2
	MOVWF       _SimStatus+0 
;GC V2.c,620 :: 		SignalingSystem_AddSignal(&SigSys,AutocloseTime-InvalidTime,51);//AutoClose - Invalid
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
;GC V2.c,621 :: 		}
L_Sim185:
;GC V2.c,622 :: 		}
L_end_Sim1:
	RETURN      0
; end of _Sim1

_Sim2:

;GC V2.c,638 :: 		void Sim2() // Open
;GC V2.c,640 :: 		if(SignalingSystem_CheckSignal(&SigSys,51))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       51
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim289
;GC V2.c,642 :: 		DoorStatus=DOORSTATUS_Invalid;
	CLRF        _DoorStatus+0 
;GC V2.c,643 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim292
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim292
L__Sim2169:
;GC V2.c,645 :: 		LCD_out(2,1,"    Invalid     ");
	MOVLW       2
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
;GC V2.c,646 :: 		}
L_Sim292:
;GC V2.c,647 :: 		SimStatus=3;
	MOVLW       3
	MOVWF       _SimStatus+0 
;GC V2.c,648 :: 		SignalingSystem_AddSignal(&SigSys,InvalidTime*2,52); // invalid time * 2
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
;GC V2.c,649 :: 		SimTime=ms500+InvalidTime;
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
;GC V2.c,650 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,651 :: 		}
L_Sim289:
;GC V2.c,652 :: 		}
L_end_Sim2:
	RETURN      0
; end of _Sim2

_Sim3:

;GC V2.c,675 :: 		void Sim3() // Invalid 1
;GC V2.c,677 :: 		if(SignalingSystem_CheckSignal(&SigSys,52))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       52
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim393
;GC V2.c,679 :: 		DoorStatus=DOORSTATUS_Closing;
	MOVLW       4
	MOVWF       _DoorStatus+0 
;GC V2.c,680 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim396
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim396
L__Sim3171:
;GC V2.c,682 :: 		LCD_out(2,1,"    Closing     ");
	MOVLW       2
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
;GC V2.c,683 :: 		}
L_Sim396:
;GC V2.c,684 :: 		SimStatus=4;
	MOVLW       4
	MOVWF       _SimStatus+0 
;GC V2.c,685 :: 		SignalingSystem_AddSignal(&SigSys,ClosingTime-(InvalidTime*2),53); // closing time - invalid time * 2
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
;GC V2.c,686 :: 		}
L_Sim393:
;GC V2.c,688 :: 		if(!IRin)
	BTFSS       PORTC+0, 0 
	GOTO        L_Sim397
;GC V2.c,690 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,691 :: 		SignalingSystem_ClearSignal(&SigSys,52);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       52
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,692 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,693 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3100
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim3100
L__Sim3170:
;GC V2.c,695 :: 		LCD_out(2,1,"    Openning    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr22_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr22_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr22_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr22_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr22_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr22_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,696 :: 		}
L_Sim3100:
;GC V2.c,697 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,698 :: 		SignalingSystem_AddSignal(&SigSys,InvalidTime,50);
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
;GC V2.c,699 :: 		}
L_Sim397:
;GC V2.c,700 :: 		}
L_end_Sim3:
	RETURN      0
; end of _Sim3

_Sim4:

;GC V2.c,721 :: 		void Sim4() // Closing
;GC V2.c,723 :: 		if(SignalingSystem_CheckSignal(&SigSys,53))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim4101
;GC V2.c,725 :: 		DoorStatus=DOORSTATUS_Invalid;
	CLRF        _DoorStatus+0 
;GC V2.c,726 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4104
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4104
L__Sim4174:
;GC V2.c,728 :: 		LCD_out(2,1,"    Invalid     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr23_GC_32V2+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICS?lstr23_GC_32V2+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICS?lstr23_GC_32V2+0)
	MOVWF       TBLPTRU 
	MOVLW       ?lstr23_GC_32V2+0
	MOVWF       FSR1 
	MOVLW       hi_addr(?lstr23_GC_32V2+0)
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr23_GC_32V2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_GC_32V2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GC V2.c,729 :: 		}
L_Sim4104:
;GC V2.c,730 :: 		SimStatus=5;
	MOVLW       5
	MOVWF       _SimStatus+0 
;GC V2.c,731 :: 		SignalingSystem_AddSignal(&SigSys,(InvalidTime*2),54); // invalid time * 2
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
;GC V2.c,732 :: 		}
L_Sim4101:
;GC V2.c,734 :: 		if(!IRin)
	BTFSS       PORTC+0, 0 
	GOTO        L_Sim4105
;GC V2.c,736 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,737 :: 		SignalingSystem_ClearSignal(&SigSys,54);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,738 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,739 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4108
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4108
L__Sim4173:
;GC V2.c,741 :: 		LCD_out(2,1,"    Openning    ");
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
;GC V2.c,742 :: 		}
L_Sim4108:
;GC V2.c,743 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,744 :: 		SignalingSystem_AddSignal(&SigSys,ms500-SimTime,50);
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
;GC V2.c,745 :: 		}
L_Sim4105:
;GC V2.c,747 :: 		if(DoorActFlag)
	MOVF        _DoorActFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim4109
;GC V2.c,749 :: 		SignalingSystem_ClearSignal(&SigSys,53);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       53
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,750 :: 		SignalingSystem_ClearSignal(&SigSys,54);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,751 :: 		DoorStatus=DOORSTATUS_Openning;
	MOVLW       3
	MOVWF       _DoorStatus+0 
;GC V2.c,752 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4112
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim4112
L__Sim4172:
;GC V2.c,754 :: 		LCD_out(2,1,"    Openning    ");
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
;GC V2.c,755 :: 		}
L_Sim4112:
;GC V2.c,756 :: 		SimStatus=1;
	MOVLW       1
	MOVWF       _SimStatus+0 
;GC V2.c,757 :: 		SignalingSystem_AddSignal(&SigSys,ms500-SimTime,50);
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
;GC V2.c,758 :: 		DoorActFlag=0;
	CLRF        _DoorActFlag+0 
;GC V2.c,759 :: 		}
L_Sim4109:
;GC V2.c,760 :: 		}
L_end_Sim4:
	RETURN      0
; end of _Sim4

_Sim5:

;GC V2.c,777 :: 		void Sim5() // Invalid 2
;GC V2.c,779 :: 		if(SignalingSystem_CheckSignal(&SigSys,54))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       54
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Sim5113
;GC V2.c,781 :: 		DoorStatus=DOORSTATUS_Close;
	MOVLW       2
	MOVWF       _DoorStatus+0 
;GC V2.c,782 :: 		if((DisplayMode==0) && (MenuState==0))
	MOVF        _DisplayMode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim5116
	MOVF        _MenuState+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Sim5116
L__Sim5175:
;GC V2.c,784 :: 		LCD_out(2,1,"     Closed     ");
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
;GC V2.c,785 :: 		}
L_Sim5116:
;GC V2.c,786 :: 		SimStatus=0;
	CLRF        _SimStatus+0 
;GC V2.c,787 :: 		}
L_Sim5113:
;GC V2.c,788 :: 		}
L_end_Sim5:
	RETURN      0
; end of _Sim5

_DoorSimulator:

;GC V2.c,807 :: 		void DoorSimulator()
;GC V2.c,809 :: 		switch(SimStatus)
	GOTO        L_DoorSimulator117
;GC V2.c,811 :: 		case 0:
L_DoorSimulator119:
;GC V2.c,812 :: 		Sim0();
	CALL        _Sim0+0, 0
;GC V2.c,813 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,815 :: 		case 1:
L_DoorSimulator120:
;GC V2.c,816 :: 		Sim1();
	CALL        _Sim1+0, 0
;GC V2.c,817 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,819 :: 		case 2:
L_DoorSimulator121:
;GC V2.c,820 :: 		Sim2();
	CALL        _Sim2+0, 0
;GC V2.c,821 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,823 :: 		case 3:
L_DoorSimulator122:
;GC V2.c,824 :: 		Sim3();
	CALL        _Sim3+0, 0
;GC V2.c,825 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,827 :: 		case 4:
L_DoorSimulator123:
;GC V2.c,828 :: 		Sim4();
	CALL        _Sim4+0, 0
;GC V2.c,829 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,831 :: 		case 5:
L_DoorSimulator124:
;GC V2.c,832 :: 		Sim5();
	CALL        _Sim5+0, 0
;GC V2.c,833 :: 		break;
	GOTO        L_DoorSimulator118
;GC V2.c,834 :: 		}
L_DoorSimulator117:
	MOVF        _SimStatus+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator119
	MOVF        _SimStatus+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator120
	MOVF        _SimStatus+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator121
	MOVF        _SimStatus+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator122
	MOVF        _SimStatus+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator123
	MOVF        _SimStatus+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorSimulator124
L_DoorSimulator118:
;GC V2.c,835 :: 		}
L_end_DoorSimulator:
	RETURN      0
; end of _DoorSimulator

_SaveConfig:

;GC V2.c,848 :: 		void SaveConfig()
;GC V2.c,850 :: 		eeprom_write(0,OpenningTime);
	CLRF        FARG_EEPROM_Write_address+0 
	CLRF        FARG_EEPROM_Write_address+1 
	MOVF        _OpenningTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,851 :: 		eeprom_write(1,ClosingTime);
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _ClosingTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,852 :: 		eeprom_write(2,InvalidTime);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _InvalidTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,853 :: 		eeprom_write(3,AutocloseTime);
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _AutocloseTime+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,854 :: 		eeprom_write(4,NetworkAddress);
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;GC V2.c,855 :: 		RS485Slave_Init(NetworkAddress);
	MOVF        _NetworkAddress+0, 0 
	MOVWF       FARG_RS485Slave_Init_slave_address+0 
	CALL        _RS485Slave_Init+0, 0
;GC V2.c,856 :: 		}
L_end_SaveConfig:
	RETURN      0
; end of _SaveConfig

_LoadConfig:

;GC V2.c,866 :: 		void LoadConfig()
;GC V2.c,868 :: 		OpenningTime=eeprom_read(0);
	CLRF        FARG_EEPROM_Read_address+0 
	CLRF        FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _OpenningTime+0 
;GC V2.c,869 :: 		ClosingTime=eeprom_read(1);
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ClosingTime+0 
;GC V2.c,870 :: 		InvalidTime=eeprom_read(2);
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _InvalidTime+0 
;GC V2.c,871 :: 		AutocloseTime=eeprom_read(3);
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _AutocloseTime+0 
;GC V2.c,872 :: 		NetworkAddress=eeprom_read(4);
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _NetworkAddress+0 
;GC V2.c,873 :: 		}
L_end_LoadConfig:
	RETURN      0
; end of _LoadConfig

_FlashLCD:

;GC V2.c,886 :: 		void FlashLCD()
;GC V2.c,890 :: 		if(LCDFlashFlag)
	MOVF        _LCDFlashFlag+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD125
;GC V2.c,892 :: 		PrevLCDFlashState=LCDFlashFlag;
	MOVF        _LCDFlashFlag+0, 0 
	MOVWF       FlashLCD_PrevLCDFlashState_L0+0 
;GC V2.c,893 :: 		if(LCDFlashState)
	MOVF        _LCDFlashState+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD126
;GC V2.c,895 :: 		LCD_chr(2,1,'>');LCD_chr(2,2,'>');LCD_chr(2,3,'>');
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
;GC V2.c,896 :: 		LCD_chr(2,16,'<');LCD_chr(2,15,'<');LCD_chr(2,14,'<');
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
;GC V2.c,897 :: 		}
	GOTO        L_FlashLCD127
L_FlashLCD126:
;GC V2.c,900 :: 		LCD_chr(2,1,' ');LCD_chr(2,2,' ');LCD_chr(2,3,' ');
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
;GC V2.c,901 :: 		LCD_chr(2,16,' ');LCD_chr(2,15,' ');LCD_chr(2,14,' ');
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
;GC V2.c,902 :: 		}
L_FlashLCD127:
;GC V2.c,903 :: 		}
	GOTO        L_FlashLCD128
L_FlashLCD125:
;GC V2.c,906 :: 		if(PrevLCDFlashState)
	MOVF        FlashLCD_PrevLCDFlashState_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FlashLCD129
;GC V2.c,908 :: 		LCD_chr(2,1,' ');LCD_chr(2,2,' ');LCD_chr(2,3,' ');
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
;GC V2.c,909 :: 		LCD_chr(2,16,' ');LCD_chr(2,15,' ');LCD_chr(2,14,' ');
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
;GC V2.c,910 :: 		}
L_FlashLCD129:
;GC V2.c,911 :: 		PrevLCDFlashState=LCDFlashState;
	MOVF        _LCDFlashState+0, 0 
	MOVWF       FlashLCD_PrevLCDFlashState_L0+0 
;GC V2.c,912 :: 		}
L_FlashLCD128:
;GC V2.c,913 :: 		}
L_end_FlashLCD:
	RETURN      0
; end of _FlashLCD

_NetworkTask:

;GC V2.c,921 :: 		void NetworkTask()
;GC V2.c,923 :: 		if (NetBuffer[4]) {                    // upon completed valid message receive
	MOVF        _NetBuffer+4, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask130
;GC V2.c,924 :: 		NetBuffer[4] = 0;                    //   data[4] is set to 0xFF
	CLRF        _NetBuffer+4 
;GC V2.c,925 :: 		switch(NetBuffer[0])
	GOTO        L_NetworkTask131
;GC V2.c,927 :: 		case 1:
L_NetworkTask133:
;GC V2.c,928 :: 		LCTime=ms500;
	MOVF        _ms500+0, 0 
	MOVWF       _LCTime+0 
	MOVF        _ms500+1, 0 
	MOVWF       _LCTime+1 
	MOVF        _ms500+2, 0 
	MOVWF       _LCTime+2 
	MOVF        _ms500+3, 0 
	MOVWF       _LCTime+3 
;GC V2.c,929 :: 		OpenCommand=1;
	MOVLW       1
	MOVWF       _OpenCommand+0 
;GC V2.c,930 :: 		SignalingSystem_ClearSignal(&SigSys,1);
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;GC V2.c,931 :: 		SignalingSystem_AddSignal(&SigSys,DoorOpenTime,1);
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
;GC V2.c,932 :: 		NetBuffer[0]=200;
	MOVLW       200
	MOVWF       _NetBuffer+0 
;GC V2.c,933 :: 		Delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_NetworkTask134:
	DECFSZ      R13, 1, 1
	BRA         L_NetworkTask134
	DECFSZ      R12, 1, 1
	BRA         L_NetworkTask134
	NOP
;GC V2.c,934 :: 		RS485Slave_Send(NetBuffer,1);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Send_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Slave_Send_datalen+0 
	CALL        _RS485Slave_Send+0, 0
;GC V2.c,935 :: 		LED=1;
	BSF         PORTE+0, 0 
;GC V2.c,936 :: 		break;
	GOTO        L_NetworkTask132
;GC V2.c,938 :: 		case 2:
L_NetworkTask135:
;GC V2.c,939 :: 		NetBuffer[0]=220;
	MOVLW       220
	MOVWF       _NetBuffer+0 
;GC V2.c,940 :: 		if((DoorStatus==DOORSTATUS_Close)||(DoorStatus==DOORSTATUS_Closing))
	MOVF        _DoorStatus+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask177
	MOVF        _DoorStatus+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask177
	GOTO        L_NetworkTask138
L__NetworkTask177:
;GC V2.c,941 :: 		NetBuffer[0]=200;
	MOVLW       200
	MOVWF       _NetBuffer+0 
L_NetworkTask138:
;GC V2.c,942 :: 		if((DoorStatus==DOORSTATUS_Open)||(DoorStatus==DOORSTATUS_Openning))
	MOVF        _DoorStatus+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask176
	MOVF        _DoorStatus+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__NetworkTask176
	GOTO        L_NetworkTask141
L__NetworkTask176:
;GC V2.c,943 :: 		NetBuffer[0]=210;
	MOVLW       210
	MOVWF       _NetBuffer+0 
L_NetworkTask141:
;GC V2.c,944 :: 		Delay_ms(1);
	MOVLW       11
	MOVWF       R12, 0
	MOVLW       98
	MOVWF       R13, 0
L_NetworkTask142:
	DECFSZ      R13, 1, 1
	BRA         L_NetworkTask142
	DECFSZ      R12, 1, 1
	BRA         L_NetworkTask142
	NOP
;GC V2.c,945 :: 		RS485Slave_Send(NetBuffer,1);
	MOVLW       _NetBuffer+0
	MOVWF       FARG_RS485Slave_Send_data_buffer+0 
	MOVLW       hi_addr(_NetBuffer+0)
	MOVWF       FARG_RS485Slave_Send_data_buffer+1 
	MOVLW       1
	MOVWF       FARG_RS485Slave_Send_datalen+0 
	CALL        _RS485Slave_Send+0, 0
;GC V2.c,946 :: 		break;
	GOTO        L_NetworkTask132
;GC V2.c,947 :: 		}
L_NetworkTask131:
	MOVF        _NetBuffer+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask133
	MOVF        _NetBuffer+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_NetworkTask135
L_NetworkTask132:
;GC V2.c,948 :: 		}
L_NetworkTask130:
;GC V2.c,950 :: 		}
L_end_NetworkTask:
	RETURN      0
; end of _NetworkTask

_DoorManager:

;GC V2.c,961 :: 		void DoorManager()
;GC V2.c,971 :: 		if(SignalingSystem_CheckSignal(&SigSys,4))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager143
;GC V2.c,972 :: 		Relay1=1;
	BSF         PORTD+0, 3 
L_DoorManager143:
;GC V2.c,974 :: 		if(SignalingSystem_CheckSignal(&SigSys,5))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager144
;GC V2.c,975 :: 		Relay1=0;
	BCF         PORTD+0, 3 
L_DoorManager144:
;GC V2.c,977 :: 		if(SignalingSystem_CheckSignal(&SigSys,6))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       6
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager145
;GC V2.c,978 :: 		Relay2=1;
	BSF         PORTD+0, 2 
L_DoorManager145:
;GC V2.c,980 :: 		if(SignalingSystem_CheckSignal(&SigSys,7))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       7
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager146
;GC V2.c,981 :: 		Relay2=0;
	BCF         PORTD+0, 2 
L_DoorManager146:
;GC V2.c,983 :: 		if(SignalingSystem_CheckSignal(&SigSys,8))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       8
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager147
;GC V2.c,984 :: 		Relay3=1;
	BSF         PORTD+0, 1 
L_DoorManager147:
;GC V2.c,986 :: 		if(SignalingSystem_CheckSignal(&SigSys,9))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       9
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager148
;GC V2.c,987 :: 		Relay3=0;
	BCF         PORTD+0, 1 
L_DoorManager148:
;GC V2.c,991 :: 		if(SignalingSystem_CheckSignal(&SigSys,1))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager149
;GC V2.c,992 :: 		OpenCommand=0;
	CLRF        _OpenCommand+0 
L_DoorManager149:
;GC V2.c,994 :: 		if(SignalingSystem_CheckSignal(&SigSys,2))
	MOVLW       _SigSys+0
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       hi_addr(_SigSys+0)
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager150
;GC V2.c,995 :: 		ActionTaken=0;
	CLRF        _ActionTaken+0 
L_DoorManager150:
;GC V2.c,1001 :: 		if((DoorStatus==DOORSTATUS_Close) && (OpenCommand) && (!ActionTaken))
	MOVF        _DoorStatus+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager153
	MOVF        _OpenCommand+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager153
	MOVF        _ActionTaken+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager153
L__DoorManager179:
;GC V2.c,1003 :: 		OpenWhenClosed();
	CALL        _OpenWhenClosed+0, 0
;GC V2.c,1004 :: 		ActionTaken=1;
	MOVLW       1
	MOVWF       _ActionTaken+0 
;GC V2.c,1005 :: 		SignalingSystem_AddSignal(&SigSys,DoorActionDelay,2);
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
;GC V2.c,1006 :: 		}
L_DoorManager153:
;GC V2.c,1008 :: 		if((DoorStatus==DOORSTATUS_Closing) && (OpenCommand) && (!ActionTaken))
	MOVF        _DoorStatus+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager156
	MOVF        _OpenCommand+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager156
	MOVF        _ActionTaken+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager156
L__DoorManager178:
;GC V2.c,1010 :: 		OpenWhenClosing();
	CALL        _OpenWhenClosing+0, 0
;GC V2.c,1011 :: 		ActionTaken=1;
	MOVLW       1
	MOVWF       _ActionTaken+0 
;GC V2.c,1012 :: 		SignalingSystem_AddSignal(&SigSys,DoorActionDelay,2);
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
;GC V2.c,1013 :: 		}
L_DoorManager156:
;GC V2.c,1014 :: 		}
L_end_DoorManager:
	RETURN      0
; end of _DoorManager

_OpenWhenClosed:

;GC V2.c,1040 :: 		void OpenWhenClosed()
;GC V2.c,1050 :: 		switch(Dip1)
	BTFSC       PORTA+0, 5 
	GOTO        L__OpenWhenClosed207
	BSF         R0, 0 
	GOTO        L__OpenWhenClosed208
L__OpenWhenClosed207:
	BCF         R0, 0 
L__OpenWhenClosed208:
	GOTO        L_OpenWhenClosed157
;GC V2.c,1052 :: 		case 0: //Start stop mode
L_OpenWhenClosed159:
;GC V2.c,1053 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
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
;GC V2.c,1054 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
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
;GC V2.c,1055 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
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
;GC V2.c,1056 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
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
;GC V2.c,1057 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1058 :: 		break;
	GOTO        L_OpenWhenClosed158
;GC V2.c,1060 :: 		case 1: // Open stop close mode
L_OpenWhenClosed160:
;GC V2.c,1061 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
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
;GC V2.c,1062 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
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
;GC V2.c,1063 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
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
;GC V2.c,1064 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
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
;GC V2.c,1065 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1066 :: 		break;
	GOTO        L_OpenWhenClosed158
;GC V2.c,1067 :: 		}
L_OpenWhenClosed157:
	BTFSS       R0, 0 
	GOTO        L_OpenWhenClosed159
	BTFSC       R0, 0 
	GOTO        L_OpenWhenClosed160
L_OpenWhenClosed158:
;GC V2.c,1068 :: 		}
L_end_OpenWhenClosed:
	RETURN      0
; end of _OpenWhenClosed

_OpenWhenClosing:

;GC V2.c,1087 :: 		void OpenWhenClosing()
;GC V2.c,1097 :: 		switch(Dip1)
	BTFSC       PORTA+0, 5 
	GOTO        L__OpenWhenClosing210
	BSF         R0, 0 
	GOTO        L__OpenWhenClosing211
L__OpenWhenClosing210:
	BCF         R0, 0 
L__OpenWhenClosing211:
	GOTO        L_OpenWhenClosing161
;GC V2.c,1099 :: 		case 0: //Start stop mode
L_OpenWhenClosing163:
;GC V2.c,1100 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
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
;GC V2.c,1101 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
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
;GC V2.c,1102 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
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
;GC V2.c,1103 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
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
;GC V2.c,1104 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1105 :: 		break;
	GOTO        L_OpenWhenClosing162
;GC V2.c,1107 :: 		case 1: // Open stop close mode
L_OpenWhenClosing164:
;GC V2.c,1108 :: 		SignalingSystem_AddSignal(&SigSys,1,6); //Stop on
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
;GC V2.c,1109 :: 		SignalingSystem_AddSignal(&SigSys,2,7); //Stop off
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
;GC V2.c,1110 :: 		SignalingSystem_AddSignal(&SigSys,3,4); //Start on
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
;GC V2.c,1111 :: 		SignalingSystem_AddSignal(&SigSys,4,5); //Start off
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
;GC V2.c,1112 :: 		DoorActFlag=1;
	MOVLW       1
	MOVWF       _DoorActFlag+0 
;GC V2.c,1113 :: 		break;
	GOTO        L_OpenWhenClosing162
;GC V2.c,1114 :: 		}
L_OpenWhenClosing161:
	BTFSS       R0, 0 
	GOTO        L_OpenWhenClosing163
	BTFSC       R0, 0 
	GOTO        L_OpenWhenClosing164
L_OpenWhenClosing162:
;GC V2.c,1115 :: 		}
L_end_OpenWhenClosing:
	RETURN      0
; end of _OpenWhenClosing
