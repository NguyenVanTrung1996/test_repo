/*************************************************/
/*            LED�̖�0.5�b���̗��[�_�ŁiC����j */
/*  �@�@�@�@�@      �@2004.8.20     by AND        */
/*************************************************/
#include <pic.h>
__CONFIG(0xFFFA); /* �����ݒ� CP:OFF,PT:OFF,WT:OFF,HS */

wait0(short k)
{
/* ��(k�~0.01)�b �̃E�F�C�g*/
	short i;
	short j; /* 16 Bit �ϐ��̐錾 */
   	for(j=0;j<k;j++){ /* (k�~3000)��̌J��Ԃ� */
		for(i=0;i<3000;i++){
		}
	}
}

main(void)
{
	TRISA = 0xFC; /* A 0,1:output, 2,3,4:input */
	TRISB = 0xC7; /* B0,1,2:input, B3,4,5:LEDoutput, other bits input */
	PORTA=0x00;    /*���[�^OFF */
	while(1){  /* �������[�v */
		PORTB=0x10;    /* LED���_�� */
		wait0(50); /* 0.5�b�E�F�C�g */
		PORTB=0x28;    /* LED�[�_�� */
		wait0(50); /* 0.5�b�E�F�C�g */
	}
}
