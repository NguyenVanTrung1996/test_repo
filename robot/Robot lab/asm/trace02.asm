;��������������������������������������������������������
;        �g���[�X����v���O�����i�����ҁj
;        2003.11.19
;         Y.ANDO
;���������|�[�g�̊��蓖�ā���������������������������������������
;
;      RB0�`RB2�i�Z���T���́j
;      RB3�`RB5�iLED�o�́j
;      RB6�`RB7�i���g�p�j
;      RA0�`RA1�i���[�^�o�́j
;      RA2�`RA3�i���g�p�j
;      RA4     �i�X�C�b�`���́j
;
;���������g�p�v���Z�b�T�C�t�@�C���̎w�聖������������������������
;
        LIST    p=pic16F84a        ;�g�p�v���Z�b�T�� PIC16F84A
        INCLUDE <p16F84a.inc>   ;�g�p�t�@�C��
;
;������������@�\�ݒ聖������������������������������������������
;
        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_OFF & _HS_OSC
                                ;�R�[�h�v���e�N�g���Ȃ�
                                ;�E�H�b�`�h�b�O�^�C�}�𓮍삳���Ȃ�
                                ;�p���[�A�b�v�^�C�}�[���N�������Ȃ�
                                ;�I�b�V���[�^���[�h�� HS
;
;���������ėp���W�X�^�̊��蓖�ā���������������������������������
;
        CBLOCK 0Ch              ;0CH�Ԓn���犄�蓖�Ă�
        W_COUNT                 ;100��sec�p�^�C�}�J�E���^
        WM_COUNT                ;  10msec�p�^�C�}�J�E���^
        WS_COUNT                ;10msec*n�p�^�C�}�J�E���^
        ENDC                    ;���蓖�ďI��
;
;���������v���O�����J�n������������������������������������������
;
        ORG     0               ;�v���O�����X�^�[�g�Ԓn
        GOTO    MAIN            ;���C�����[�`����
        ORG     4
        GOTO    INT             ;���荞�ݔ�ѐ�
        ORG     8
;
MAIN:   BCF     INTCON,GIE      ;���荞�ݑS�ċ֎~
        CLRF    PORTA           ;A�|�[�g�̃��b�`�N���A
        CLRF    PORTB           ;B�|�[�g�̃��b�`�N���A
;
        BSF     STATUS,RP0      ;Bank��1
;
        MOVLW   B'11111100'     ;A�|�[�g,RA0��RA1�͏o�́C���S�ē���
        MOVWF   TRISA
        MOVLW   B'00000111'     ;B�|�[�g,RB0,RB1,RB2�͓��́C���S�ďo��
        MOVWF   TRISB
;
        BCF     STATUS,RP0      ;Bank��0
;
;;;;;;;;;;;;;;;;;;;;�v���O�����̍l����;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;�i�������j�����v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
;;;;�i�������j�����v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
;;;;�i�������j���v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
;;;;�i�������j���v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
;;;;�i�������j���i
;;;;�i�������j�Ȃɂ����Ȃ�
;;;;
;;;;MT_TST    �ŏ��̃`�F�b�N
;;;;C_TST     ���Z���T�����C�����o��̃`�F�b�N
;;;;CCW_SML   �����v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
;;;;CCW_BIG   �����v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
;;;;CW_SML    ���v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
;;;;CW_BIG    ���v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
;;;;S_FAST    ���i
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;�Z���T�e�X�g�J�n;;;;;;;;;;;;;;;;;;;;;;;;;
SENS:	CLRF	PORTB           ;�SLED�������i�Z���T�e�X�g�J�n�j
	BTFSC	PORTB,0         ;���Z���T��0�̎��C���̍s���X�L�b�v
	BSF	PORTB,3         ;��LED��_��
	BTFSC	PORTB,1         ;���Z���T��0�̎��C���̍s���X�L�b�v
	BSF	PORTB,4         ;��LED��_��
	BTFSC	PORTB,2         ;�E�Z���T��0�̎��C���̍s���X�L�b�v
	BSF	PORTB,5         ;�ELED��_��
	
	NOP

;;;;;;;;;;;;�ŏ��̃`�F�b�N�C�S�Z���T�ɑ΂��ă��C�����o���`�F�b�N
MT_TST:	
	BTFSS	PORTB,1         ;���Z���T��1�i���j�̎��C���̍s���X�L�b�v
	GOTO	C_TST	        ;�i�H���H�j���Z���T�����C�����o�C���̃`�F�b�N��
	BTFSS	PORTB,0         ;���Z���T��1�i���j�̎��C���̍s���X�L�b�v
	GOTO	CCW_SML         ;�i�����H�j�����v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
	BTFSS	PORTB,2         ;�E�Z���T��1�i���j�̎��C���̍s���X�L�b�v
	GOTO	CW_SML		;�i�������j���v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
	GOTO	SENS            ;�i�������jSENS�ɖ߂�

;;;;;;;;;;;;���Z���T�����C�����o��C���̃`�F�b�N
C_TST:	BTFSS	PORTB,0         ;���Z���T��1�i���j�̎��C���̍s���X�L�b�v
	GOTO	CCW_BIG         ;�i�����H�j�����v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
	BTFSS	PORTB,2         ;�E�Z���T��1�̎��C���̍s���X�L�b�v
	GOTO	CW_BIG		;�i�������j���v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
	GOTO	S_FAST          ;�i�������j�������s

;;;;;;;;;;;;�����v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
CCW_SML:MOVLW   B'00000011'     ;�E���[�^ON�C�����[�^ON
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.03sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	MOVLW   B'00000001'     ;�E���[�^ON�C�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.12sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
        MOVLW   B'00000000'     ;�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'10'            ;��0.05sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	GOTO	SENS            ;�߂�

;;;;;;;;;;;;�����v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
CCW_BIG:MOVLW   B'00000011'     ;�E���[�^ON�C�����[�^ON
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.06sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	MOVLW   B'00000001'     ;�E���[�^ON�C�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'1'           ;��0.09sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
        MOVLW   B'00000000'     ;�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'10'           ;��0.05sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	GOTO	SENS           ;SENS�ɖ߂�

;;;;;;;;;;;;���v�܂��ɋȗ����a�̏����ȉ~�ʂœ�����
CW_SML: MOVLW   B'00000011'     ;�E���[�^ON�C�����[�^ON
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.03sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	MOVLW   B'00000010'     ;�����[�^ON�C�E���[�^OFF
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.12sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
        MOVLW   B'00000000'     ;�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'10'            ;��0.05sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	GOTO	SENS            ;SENS�ɖ߂�

;;;;;;;;;;;;���v�܂��ɋȗ����a�̑傫�ȉ~�ʂœ�����
CW_BIG: MOVLW   B'00000011'     ;�E���[�^ON�C�����[�^ON
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.06sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	MOVLW   B'00000010'     ;�����[�^ON�C�E���[�^OFF
        MOVWF   PORTA
        MOVLW   D'1'           ;��0.09sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
        MOVLW   B'00000000'     ;�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'10'           ;��0.05sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	GOTO	SENS           ;SENS�ɖ߂�

;;;;;;;;;;;;�܂������ɑ��s����
S_FAST: MOVLW   B'00000011'     ;�E���[�^ON�C�����[�^ON
        MOVWF   PORTA
        MOVLW   D'3'           ;��0.09sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
        MOVLW   B'00000000'     ;�����[�^OFF
        MOVWF   PORTA
        MOVLW   D'5'           ;��0.02sec�^�C�}
        MOVWF   WS_COUNT
        CALL    WAIT_s
;
	GOTO	SENS           ;SENS�ɖ߂�

;���������^�C�}�T�u���[�`������������������������������������������
;
;100��sec�^�C�}
;                               ;�T�C�N���� (CALL WAIT�� 2)
WAIT:   MOVLW   D'165'          ;1
        MOVWF   W_COUNT         ;1
        DECFSZ  W_COUNT,F       ;1*164+2
        GOTO    $-1             ;2*164
        RETURN                  ;2
                                ;�v�@500�T�C�N��*0.2��sec=100��sec
                                ;������T�u���[�`���Ƃ��Ďg�p����Ƃ���
                                ;MOVLW  D'164' �Ƃ���ƌ덷�����Ȃ�
;
;10msec�^�C�}
WAIT_m: MOVLW   D'100'          ;�J��Ԃ���100
        MOVWF   WM_COUNT
        CALL    WAIT            ;100��sec�^�C�}
        DECFSZ  WM_COUNT,F      ;WM_COUNT-1��0�Ȃ�2�s����
        GOTO    $-2             ;2�s��̖��߂ɔ��
        RETURN
;
;10msec*n�̃^�C�}�쐬(1<n<255)
;WS_COUNT��n�̒l�����ă^�C���𒲐�
WAIT_s: CALL    WAIT_m
        DECFSZ  WS_COUNT,F
        GOTO    WAIT_s
        RETURN
;���荞�݂͖��g�p
INT:    RETFIE
        END

