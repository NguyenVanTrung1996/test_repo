/*************************************************/
/*   �Z���T�̏�Ԃ�LED�ɕ\������v���O�����@�@�@ */
/*  �@�@�@�@�@      �@2002.8.18     by AND      */
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
		wait0(3); /* ��30msec�E�F�C�g */
	}
}
