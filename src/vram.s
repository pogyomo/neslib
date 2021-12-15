; vim: ft=ca65
; -------------------------------------------------------------------
; vram.s : functions that related to vram
; -------------------------------------------------------------------


; -------------------------------------------------------------------
; Import and export

    .include "neslib.inc"


; -------------------------------------------------------------------
; Structs for BSS
.struct vram_bss
    is_read .byte $01
.endstruct


; -------------------------------------------------------------------
; BSS for function
.bss
vram_bss: .tag vram_bss


; -------------------------------------------------------------------
; void __fastcall__ set_vram_addr(unsigned int addr)
.code
.proc _set_vram_addr: near
    
    ; Set address
    stx PPUADDR ; Set high address
    sta PPUADDR ; Set low address

    ; Clear flag
    lda #$00
    sta vram_bss + vram_bss::is_read

    ; End of function
    rts

.endproc
