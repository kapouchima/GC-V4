#line 1 "C:/Users/Kapouchima/Desktop/GC-V4/Keys/Keys.c"
#line 1 "c:/users/kapouchima/desktop/gc-v4/keys/keys.h"
#line 38 "c:/users/kapouchima/desktop/gc-v4/keys/keys.h"
void KeysSystem_EPOCH();
char KeysSystem_Task();
#line 3 "C:/Users/Kapouchima/Desktop/GC-V4/Keys/Keys.c"
char SystemState=0,DebouncingCounter=0,RepeatCounter=0,PrevVal=0,RepeatNoCounter=0;




void KeysSystem_EPOCH()
{
 if(DebouncingCounter>0) DebouncingCounter=DebouncingCounter-1;
 if(RepeatCounter>0) RepeatCounter=RepeatCounter-1;
}





char KeysSystem_Task()
{
 char val=0,res=0;

 val.b0= (!portd.b6) ;



 val.b1= (!portd.b5) ;



 val.b2= (!portd.b4) ;
#line 54 "C:/Users/Kapouchima/Desktop/GC-V4/Keys/Keys.c"
 switch(SystemState)
 {
 case 0:
 if((val!=0) && (DebouncingCounter==0)){res=val;DebouncingCounter= (1) ;RepeatCounter= (100) ;SystemState=1;PrevVal=val;}
 break;

 case 1:
 if((DebouncingCounter==0) && (val == 0)){res=0;PrevVal=0;DebouncingCounter= (1) ;SystemState=0;}
 if((DebouncingCounter==0) && (val == PrevVal) && (RepeatCounter == 0)){res=val,SystemState=2;RepeatCounter= (6) ;RepeatNoCounter= (10) ;}
 if((DebouncingCounter==0) && (val != PrevVal) && (val != 0)){res=val;PrevVal=val;DebouncingCounter= (1) ;}
 break;

 case 2:
 if((val == PrevVal) && (RepeatCounter == 0) && (RepeatNoCounter > 0)){res=val;RepeatCounter= (6) ;RepeatNoCounter=RepeatNoCounter-1;}
 if((val == PrevVal) && (RepeatCounter == 0) && (RepeatNoCounter == 0)){res=val;RepeatCounter= (6) ;RepeatNoCounter= (10) ;SystemState=3;}
 if((val != PrevVal) && (val != 0)){res=val;PrevVal=val;DebouncingCounter= (1) ;RepeatCounter= (100) ;SystemState=1;}
 if(val == 0){res=0;PrevVal=0;DebouncingCounter= (1) ;SystemState=0;}
 break;

 case 3:
 if((val == PrevVal) && (RepeatCounter == 0) && (RepeatNoCounter > 0)){res=val;RepeatCounter= (6) ;RepeatNoCounter=RepeatNoCounter-1;}
 if((val == PrevVal) && (RepeatCounter == 0) && (RepeatNoCounter == 0)){res=val;RepeatCounter= (6) ;SystemState=4;}
 if((val != PrevVal) && (val != 0)){res=val;PrevVal=val;DebouncingCounter= (1) ;RepeatCounter= (100) ;SystemState=1;}
 if(val == 0){res=0;PrevVal=0;DebouncingCounter= (1) ;SystemState=0;}
 break;

 case 4:
 if((val == PrevVal) && (RepeatCounter == 0)){res=val;RepeatCounter= (6) ;}
 if((val != PrevVal) && (val != 0)){res=val;PrevVal=val;DebouncingCounter= (1) ;RepeatCounter= (100) ;SystemState=1;}
 if(val == 0){res=0;PrevVal=0;DebouncingCounter= (1) ;SystemState=0;}
 break;
 }

 return res;
}
