; �u���C���g���[�X���{�b�g LTR04�|03�v�@�t�@�C�����FLTR04-03.asm
;
;  �T�}�[�Z�~�i�[�p�@���C���g���[�X�v���O�����i���C���͍��j
;  �c�C�����[�^A�^�C�v�p
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
        WQ_COUNT                ; 0.2msec�^�C�}�p�J�E���^
        WH_COUNT                ; 0.5msec�^�C�}�p�J�E���^
        WM_COUNT                ;  10msec�^�C�}�p�J�E���^
        WS_COUNT                ;10msec*n�^�C�}�p�J�E���^
        LE_COUNT                ;LED�_�ŗp�J�E���^
        LED_OUT                 ;LED�\���p���W�X�^
	SENSOR			;�Z���T���W�X�^
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
        MOVLW   B'00000000'     ;�Z���T�\��LED����
        MOVWF   PORTB
;
;�\�\�\�\�s�Z���T���͂���уX�C�b�`���̓`�F�b�N�t�\�\�\�\�\�\�\�\�\�\�\�\
;
SW:     CALL    SENS            ;�Z���T���̓`�F�b�N
;
        BTFSC   PORTA,4         ;�X�C�b�`���́H
        GOTO    SW              ;�X�C�b�`���͂Ȃ���SW��
SW1:    BTFSS   PORTA,4         ;�X�C�b�`���͂���,�X�C�b�`�������H
        GOTO    SW1             ;�X�C�b�`�����Ă��Ȃ���SW1��
;
        CALL    T500            ;�X�C�b�`��������0.5sec�҂�
;
;�\�\�\�\�s�k�d�c�_�Łt�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
        MOVLW   D'5'            ; 5��_��
        MOVWF   LE_COUNT
LED:    MOVLW   B'00000000'     ;LED����
        MOVWF   PORTB
        CALL    T200            ;200msec
        MOVLW   B'00111000'     ;LED�_��
        MOVWF   PORTB
        CALL    T200            ;200msec
        DECFSZ  LE_COUNT
        GOTO    LED
;
        CALL    T500            ; 0.5sec�҂�
;
;�\�\�\�\�s���C���g���[�X�J�n�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
MAIN2:  CALL    GO              ;���E�̃��[�^��]�@0.5msec
        CALL    SS              ;            ��~�@0.5msec
        CALL    SS
;
;�\�\�\�\�s�Z���T�`�F�b�N����ё��s����t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;                                ���C��(��)��ł̓Z���T����̓��͂̓[��,
;                                �k�d�c�\���̓r�b�g���]���ē_�����Ă���
;
SEN:    CALL    SENS            ;�Z���T����
        BTFSS   SENSOR,1        ;�~�H�~�@���Z���T�H
        GOTO    SEN1            ;�~0�~�@�@�@�@�@����
        GOTO    SEN2            ;�~1�~�@�@�@�@�@�Ȃ��@�E�Z���T�H(SEN2)��
;
SEN1:   BTFSS   SENSOR,0        ;�H0�~�@���Z���T�H
        GOTO    SEN1_1          ;00�~�@�@�@�@�@����
        GOTO    SEN1_2          ;10�~�@�@�@�@�@�Ȃ��@�E�Z���T�H(SEN1_2)��
;
SEN1_1: BTFSS   SENSOR,2        ;00�H  �E�Z���T�H
        GOTO    MAIN2           ;000�@�@�@�@�@����@�S������@�@�Ƃ肠�������i
        CALL    L1              ;001�@�@�@�@�@�Ȃ��@���E���@��⍶��
        GOTO    SEN
;
SEN1_2: BTFSC   SENSOR,2        ;10�H  �E�Z���T�H
        GOTO    MAIN2           ;101�@�@�@�@�@�Ȃ��@����@�@�@�@���i
        CALL    R1              ;100�@�@�@�@�@����@��⍶���@���E��
        GOTO    SEN
;
SEN2:   BTFSS   SENSOR,2        ;�~1�H�@�E�Z���T�H
        GOTO    SEN2_1          ;�~10�@�@�@�@�@����@���Z���T�H(SEN2_1)��
        GOTO    SEN2_2          ;�~11�@�@�@�@�@�Ȃ��@���Z���T�H(SEN2_2)��
;
SEN2_1: BTFSS   SENSOR,0        ;�H10  ���Z���T�H
        GOTO    MAIN2           ;010�@�@�@�@�@����@���蓾�Ȃ��@�Ƃ肠�������i
        CALL    R2              ;110�@�@�@�@�@�Ȃ��@�����@�@�@�E��
        GOTO    SEN
;
SEN2_2  BTFSC   SENSOR,0        ;�H11  ���Z���T�H
        GOTO    STOP            ;111�@�@�@�@�@�Ȃ��@�S���͂��ꂽ����~��
        CALL    L2              ;011  �@�@�@�@����@�E���@�@�@����
        GOTO    SEN
;
STOP:   CALL    STP
        GOTO    STOP
;
;�\�\�\�\�s�Z���T���͂̃T�u���[�`���t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
SENS:   MOVF    PORTB,W         ;�Z���T����
        MOVWF   SENSOR          ;SENSOR�Ɋi�[(�p������p)
        MOVWF   LED_OUT         ;LED_OUT�Ɋi�[(LED�_���p)
        RLF     LED_OUT         ;1�r�b�g���փV�t�g
        RLF     LED_OUT         ;1�r�b�g���փV�t�g
        RLF     LED_OUT         ;1�r�b�g���փV�t�g
        COMF    LED_OUT         ;�r�b�g���]
        MOVF    LED_OUT,W       ;LED_OUT�Ɋi�[
        MOVWF   PORTB           ;LED�_��
        RETURN
;
;�\�\�\�\�s���[�^�쓮�̃T�u���[�`���t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
GO:     MOVLW   B'00000011'     ;���i�@0.5msec
        MOVWF   PORTA
        CALL    WAIT_h
        RETURN
;
R1:     MOVLW   B'00000010'     ;���E��
        MOVWF   PORTA           ;0.2msec �E��~
        CALL    WAIT_q
        CALL    SS
        CALL    SS
        RETURN
;
L1:     MOVLW   B'00000001'     ;��⍶��
        MOVWF   PORTA           ;0.2msec ����~
        CALL    WAIT_q
        CALL    SS
        CALL    SS
        RETURN
;
R2:     MOVLW   B'00000010'     ;�E��
        MOVWF   PORTA           ;0.5msec �E��~
        CALL    WAIT_h
        CALL    SS
        CALL    SS
        RETURN
;
L2:     MOVLW   B'00000001'     ;����
        MOVWF   PORTA           ;0.5msec ����~
        CALL    WAIT_h
        CALL    SS
        CALL    SS
        RETURN
;
SS:     MOVLW   B'00000000'     ;��~�@0.5msec
        MOVWF   PORTA
        CALL    WAIT_h
        RETURN
;
STP:    MOVLW   B'00000000'     ;��~
        MOVWF   PORTA
        RETURN
;
;�\�\�\�\�s�^�C�}�̃T�u���[�`���@�t�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;
WAIT:   MOVLW   D'164'          ;100��sec�̃^�C�}
        MOVWF   W_COUNT         
        DECFSZ  W_COUNT,F      
        GOTO    $-1             
        RETURN                  
;
WAIT_h: MOVLW   D'5'            ;0.5msec�̃^�C�}
        MOVWF   WH_COUNT
        CALL    WAIT
        DECFSZ  WH_COUNT,F
        GOTO    $-2
        RETURN
;
WAIT_q: MOVLW   D'2'            ;0.2msec�̃^�C�}
        MOVWF   WQ_COUNT
        CALL    WAIT
        DECFSZ  WQ_COUNT,F
        GOTO    $-2
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
T500:   MOVLW   D'50'           ;500msec�̃^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
        RETURN
;       
;�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
;���荞�݂͖��g�p
INT:    RETFIE
        END

