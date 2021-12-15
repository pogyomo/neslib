; vim: ft=ca65
; -------------------------------------------------------------------
; ppu.s : functions that relate to ppu
; -------------------------------------------------------------------


; -------------------------------------------------------------------
; Import and export
    .export _set_ppu_ctrl, _clear_ppu_ctrl
    .export _set_ppu_mask, _clear_ppu_mask

    .include "neslib.inc"


; -------------------------------------------------------------------
; Structs for BSS
.struct ppu_bss
    ppu_ctrl .byte $01
    ppu_mask .byte $01
.endstruct


; -------------------------------------------------------------------
; BSS for functino
.bss
ppu_bss: .tag ppu_bss


; -------------------------------------------------------------------
; void __fastcall__ set_ppu_ctrl(unsigned char value)
.code
.proc _set_ppu_ctrl: near
    
    ; Set flags
    ora ppu_bss + ppu_bss::ppu_ctrl
    sta PPUCTRL
    sta ppu_bss + ppu_bss::ppu_ctrl

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ clear_ppu_ctrl(unsigned char value)
.code
.proc _clear_ppu_ctrl: near
    
    ; Clear flags
    and ppu_bss + ppu_bss::ppu_ctrl
    sta PPUCTRL
    sta ppu_bss + ppu_bss::ppu_ctrl

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ set_ppu_mask(unsigned char value)
.code
.proc _set_ppu_mask: near
    
    ; Set flags
    ora ppu_bss + ppu_bss::ppu_mask
    sta PPUMASK
    sta ppu_bss + ppu_bss::ppu_mask

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ clear_ppu_mask(unsigned char value)
.code
.proc _clear_ppu_mask: near
    
    ; Clear flags
    and ppu_bss + ppu_bss::ppu_mask
    sta PPUMASK
    sta ppu_bss + ppu_bss::ppu_mask

    ; End of function
    rts


; -------------------------------------------------------------------
; void __fastcall__ wait_vblank(void)
.code
.proc _wait_vblank: near
    
    ; Wait vblank
wait_vblank:
    bit PPUSTATUS
    bpl wait_vblank

    ; End of function
    rts

.endproc


; -------------------------------------------------------------------
; void __fastcall__ wait_zero_sprite(void)
.code
.proc _wait_zero_sprite: near
    
    ; Wait 0 sprite hit
wait_zero_sprite:
    bit PPUSTATUS
    bvc wait_zero_sprite

    ; End of function
    rts

.endproc
