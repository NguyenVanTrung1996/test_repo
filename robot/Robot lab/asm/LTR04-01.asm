; �u���C���g���[�X���{�b�g LTR04�|01�v�@�t�@�C�����FLTR04-01.asm
;
;  �T�}�[�Z�~�i�[�p�@LED�̓_��
;
;�\�\�\�\�s�|�[�g�̊��蓖�āt�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
;A�|�[�g
;   A7     A6     A5     A4     A3     A2     A1     A0
;   �\     �\     �\      3      2      1     18     17   �� �s���ԍ�
;   �\     �\     �\    ���ā@   �@�@�@�@�@ ��Ӱ�  �EӰ��@�� �p�r
;   �\     �\     �\    ���́@�@�@�@   �@�@�@�o�́@ �o�́@�� ���o��
;    1      1      1      1      1      1      0      0   �� �����ݒ�
;
;B�|�[�g
;   B7     B6     B5     B4     B3     B2     B1     B0
;   13     12     11     10      9      8      7      6   �� �s���ԍ�
;  ײ��@  ײ�   �ELED  ��LED  ��LED  �E�ݻ  ���ݻ  ���ݻ  �� �p�r
;  ����   ���́@ �o�́@ �o�́@ �o�́@ ���́@ ���́@ ���́@�� ���o��
;    1      1      0      0      0      1      1      1   �� �����ݒ�
;
;�\�\�\�\�s�g�p�v���Z�b�T,�t�@�C���̑[��t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
        LIST    p=16F84a        ;�g�p�v���Z�b�T�� PIC16F84A
        INCLUDE <p16F84a.inc>   ;�g�p�t�@�C��
;
;�\�\�\�\�s����@�\�ݒ�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_OFF & _HS_OSC
                                ;�R�[�h�v���e�N�g���Ȃ�
                                ;�E�H�b�`�h�b�O�^�C�}�𓮍삳���Ȃ�
                                ;�p���[�A�b�v�^�C�}���N�������Ȃ�
                                ;�I�b�V���[�^���[�h�� HS
;
;�\�\�\�\�s�ėp���W�X�^�̊��蓖�āt�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
        CBLOCK 0Ch              ; 0CH�Ԓn���犄�蓖�Ă�
        W_COUNT                 ;100��sec�^�C�}�p�J�E���^
        WM_COUNT                ;  10msec�^�C�}�p�J�E���^
        WS_COUNT                ;10msec*n�^�C�}�p�J�E���^
        ENDC                    ;���蓖�ďI��(CBLOCK�̍Ō�ɂ���)
;
;�\�\�\�\�s�v���O�����J�n�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
        ORG     0               ;�v���O�����X�^�[�g�Ԓn
        GOTO    MAIN            ;���C�����[�`����
        ORG     4
        GOTO    INT             ;���荞�ݔ�ѐ�
        ORG     8
;
;�\�\�\�\�s�����ݒ�,������Ԑݒ�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
MAIN:   BCF     INTCON,GIE      ;���荞�ݑS�ċ֎~
�@�@�@  CLRF    PORTA           ;A�|�[�g�̃��b�`�N���A
        CLRF    PORTB           ;B�|�[�g�̃��b�`�N���A
;
        BSF     STATUS,RP0      ;Bank��1
;
        MOVLW   B'11111100'     ;A�|�[�g�����ݒ� 0:�o�� 1:����
        MOVWF   TRISA
        MOVLW   B'11000111'     ;B�|�[�g�����ݒ�
        MOVWF   TRISB
;
        BCF     STATUS,RP0      ;Bank��0
;
        MOVLW   B'00000000'     ;���[�^�̉�]��~
        MOVWF   PORTA
;
        MOVLW   B'00000000'     ;LED����
        MOVWF   PORTB
;
;�\�\�\�\�s�X�C�b�`���́t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
SW:     BTFSC   PORTA,4         ;�X�C�b�`���́H
        GOTO    SW              ;�X�C�b�`���͂Ȃ���SW��
SW1:    BTFSS   PORTA,4         ;�X�C�b�`���͂���,�X�C�b�`�������H
        GOTO    SW1             ;�X�C�b�`�����Ă��Ȃ���SW1��
;
        CALL    T500            ;�X�C�b�`��������0.5sec�҂�
;
;�\�\�\�\�s�k�d�c�_�Łt�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
LED:    MOVLW   B'00000000'     ;LED����
        MOVWF   PORTB
        CALL    T200            ;200msec
        MOVLW   B'00111000'     ;LED�_��
        MOVWF   PORTB
        CALL    T200            ;200msec
        GOTO    LED
;
;�\�\�\�\�s�^�C�}�̃T�u���[�`���@�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
WAIT:   MOVLW   D'164'          ;100��sec�̃^�C�}
        MOVWF   W_COUNT         
        DECFSZ  W_COUNT,F      
        GOTO    $-1             
        RETURN                  
;
WAIT_m: MOVLW   D'100'          ;10msec�̃^�C�}
        MOVWF   WM_COUNT
        CALL    WAIT
        DECFSZ  WM_COUNT,F
        GOTO    $-2
        RETURN
;
WAIT_s: CALL    WAIT_m          ;10msec�~n�̃^�C�}    
        DECFSZ  WS_COUNT,F      ;WS_COUNT �� n
        GOTO    WAIT_s
        RETURN
;
T200:   MOVLW   D'20'           ;200msec�̃^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
        RETURN
;
T500    MOVLW   D'50'           ;500msec�̃^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
        RETURN
;
;�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;���荞�݂͖��g�p
INT:    RETFIE
        END

