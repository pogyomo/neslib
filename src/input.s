; vim: ft=ca65
; -----------------------------------------------------------------------
; input.s : Function related to input
; -----------------------------------------------------------------------


; -----------------------------------------------------------------------
; Import and export
    .export  _get_joypad1, _get_joypad2

    .include "neslib.inc"
    .include "zeropage.inc"


; ------------------------------------------------------------------------
; unsigned char __fastcall__ get_joypad1(void)
.code
.proc _get_joypad1: near
    
    ; Init I/O port
    ldx #$01
    stx JOYPAD1
    dex
    stx JOYPAD1

    ; Init variable
    stx tmp1

    ; Get input
    ldy #$08
@loop:
    lda JOYPAD1
    ror a
    rol tmp1
    dey
    bne @loop

    ; Prepare return value
    lda tmp1
    ldx #$00

    ; End of process
    rts

.endproc


; ------------------------------------------------------------------------
; unsigned char __fastcall__ get_joypad2(void)
.code
.proc _get_joypad2: near
    
    ; Init I/O port
    ldx #$01
    stx JOYPAD1
    dex
    stx JOYPAD1

    ; Init variable
    stx tmp1

    ; Get input
    ldy #$08
@loop:
    lda JOYPAD2
    ror a
    rol tmp1
    dey
    bne @loop

    ; Prepare return value
    lda tmp1
    ldx #$00

    ; End of process
    rts

.endproc
