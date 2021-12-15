; vim: ft=ca65
; -------------------------------------------------------------------
; vram.s : functions that related to vram
; -------------------------------------------------------------------


; -------------------------------------------------------------------
; Import and export
    .export _set_vram_addr, _put_to_vram, _get_from_vram
    .export _copy_to_vram, _copy_from_vram, _fill_vram

    .import popa

    .include "neslib.inc"
    .include "zeropage.inc"


; -------------------------------------------------------------------
; Structs for BSS
.struct vram_bss
    is_first_read .byte $01
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
    lda #$01
    sta vram_bss + vram_bss::is_first_read

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ put_to_vram(unsigned char value)
.code
.proc _put_to_vram: near
    
    ; Put a value to vram
    sta PPUDATA

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ get_from_vram(unsigned char *ptr)
.code
.proc _get_from_vram: near

    ; Set pointer
    sta ptr1 + 0
    stx ptr1 + 1

    ; Check it is first read
    lda vram_bss + vram_bss::is_first_read
    beq read
    lda PPUDATA
    lda #$00
    sta vram_bss + vram_bss::is_first_read

    ; Get value from vram
read:
    ldy #$00
    lda PPUDATA
    sta (ptr1), y

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ copy_to_vram(unsigned char num, unsigned char *ptr)
.code
.proc _copy_to_vram: near
    
    ; Set pointer
    sta ptr1 + 0
    stx ptr1 + 1

    ; Set loop counter
    jsr popa
    tax
    inx

    ; Copy data to vram
    ldy #$00
loop:
    lda (ptr1), y
    sta PPUDATA
    iny
    dex
    bne loop

    ; End of function
    rts
    
.endproc


; -------------------------------------------------------------------
; void __fastcall__ copy_from_vram(unsigned char num, unsigned char *ptr)
.code
.proc _copy_from_vram: near
    
    ; Set pointer
    sta ptr1 + 0
    stx ptr1 + 1

    ; Set loop counter
    jsr popa
    tax
    inx

    ; Check it is first read
    lda vram_bss + vram_bss::is_first_read
    beq loop
    lda PPUDATA
    lda #$00
    sta vram_bss + vram_bss::is_first_read

    ; Copy data to vram
    ldy #$00
loop:
    lda PPUDATA
    sta (ptr1), y
    iny
    dex
    bne loop

    ; End of function
    rts
    
.endproc


; -------------------------------------------------------------------
; void __fastcall__ fill_vram(unsigned char num, unsigned char value)
.code
.proc _fill_vram: near
    
    ; Escape 2nd argument
    pha

    ; Set loop counter
    jsr popa
    tax
    inx

    ; Restore 2nd argument
    pla

    ; Write value to vram
loop:
    sta PPUDATA
    dex
    bne loop

    ; End of function
    rts

.endproc
