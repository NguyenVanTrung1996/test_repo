/*************************************************/
/* �Z���T�̔����ɉ����C���[�^���쓮����v���O���� */
/*  �@�@�@�@�@      �@2004.8.24     by AND�@      */
/*************************************************/
#include <pic.h>
__CONFIG(0xFFFA); /* �����ݒ� CP:OFF,PT:OFF,WT:OFF,HS */
#define T_MAX 30 /* 300msec�����Ń��[�^��ON,OFF���� */
#define COUNT 3 /* �J��Ԃ��� */
wait0(short k)
{
/* ��(k�~0.01)�b �̃E�F�C�g*/
	short i;
	short j; /* 16 Bit �ϐ��̐錾 */
   	for(j=0;j<k;j++){ /* (k�~3000)��̌J��Ԃ� */
		for(i=0;i<3000;i++){ /* ���ԑ҂� */
		}
	}
}
main(void)
{
	TRISA = 0xFC; /* A 0,1:output, 2,3,4:input */
	TRISB = 0xC7; /* B0,1,2:input, B3,4,5:LEDoutput, other bits input */

	PORTA=0x00; /* ���[�^ OFF */
	PORTB=0x00; /* LED�S���� */
	while(1){/* �������[�v */
		RB3=RB0; /* �Z���T���́�LED�\�� */
		RB4=RB1; /* �Z���T���́�LED�\�� */
		RB5=RB2; /* �Z���T���́�LED�\�� */

		if(RB0==1){         /* if left sensor on */
			PORTA=0x02; /* then left motor on */
		}
		else if(RB2==1){    /* if right sensor on */
			PORTA=0x01; /* then right motor on */
		}
		else if (RB1==1){   /* if center sensor on */
			PORTA=0x03; /* then both motor on */
		}
		else{                /* if the other case */
			PORTA=0x00; /* then both motor off */

		}
	}
}
