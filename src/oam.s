; vim: ft=ca65
; ------------------------------------------------------------------------
; oam.s : Function related to oam
; ------------------------------------------------------------------------


; ------------------------------------------------------------------------
; Import and export
    .export _set_oam_addr, _put_to_oam
    .export _get_from_oam, _copy_to_oam

    .include "neslib.inc"
    .include "zeropage.inc"


; ------------------------------------------------------------------------
; void __fastcall__ set_oam_addr(unsigned char addr)
.code
.proc _set_oam_addr: near
    
    ; Set address
    sta OAMADDR

    ; End of process
    rts

.endproc


; ------------------------------------------------------------------------
; void __fastcall__ put_to_oam(unsigned char addr)
.code
.proc _put_to_oam: near
    
    ; Put a value to oam
    sta OAMDATA

    ; End of process
    rts

.endproc


; ------------------------------------------------------------------------
; void __fastcall__ get_from_oam(unsigned char *ptr)
.code
.proc _get_from_oam: near
    
    ; Set pointer
    sta ptr1 + 0
    sta ptr1 + 1
    
    ; Get a value from vram
    ldy #$00
    lda OAMDATA
    sta (ptr1), y

    ; End of process
    rts

.endproc


; ------------------------------------------------------------------------
; void __fastcall__ copy_to_oam(unsigned char addr)
.code
.proc _copy_to_oam: near
    
    ; Copy data from memory to oam
    sta OAMDMA

    ; End of process
    rts

.endproc
