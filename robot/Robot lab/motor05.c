/*************************************************/
/*         ���[�^�쓮�v���O����(C����)  	 */
/*  �@�i�Z���ȗ����a�̉~�ʂɉ����č�����j       */
/*�@�@    2004.8.23     by AND           	 */
/*************************************************/
#include <pic.h>
__CONFIG(0xFFFA); /* �����ݒ� CP:OFF,PT:OFF,WT:OFF,HS */

wait00(short k)
{
/* ��(k�~0.01)�~���b �̃E�F�C�g(k�~0.01msec wait)*/
	short i;
	short j; /* 16 Bit �ϐ��̐錾 */
   	for(j=0;j<k;j++){ /* (k�~3)��̌J��Ԃ� */
		for(i=0;i<3;i++){
		}
	
	}
	return 0;
}
main(void){   /* ---- left_down ---- */
	TRISA = 0xFC; /* A 0,1:output, 2,3,4:input */
	TRISB = 0xC7; /* B0,1,2:input, B3,4,5:LEDoutput, other bits input */
	PORTA=0x00;    /*���[�^OFF */
	while(1){  /* �������[�v */
		PORTA=0x03; /* both motor on */
		wait00(15);   /* 0.15msec wait */
		PORTA=0x01; /* right motor on */
		wait00(12);   /* 0.12msec wait */
		PORTA=0x00; /* both motor off */
		wait00(73);   /* 0.73msec wait */
	}
}
