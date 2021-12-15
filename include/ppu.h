#ifndef __PPU_H__
#define __PPU_H__


// ------------------------------------------------------------------
// ppu.h : Define of function related to ppu
// ------------------------------------------------------------------


// ------------------------------------------------------------------
// Summary  : Set flags of PPUCTRL($2000) using specified value
//            Value || PPUCTRL -> PPUCTRL
// Argument : A value to set flags
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ set_ppu_ctrl(unsigned char value);


// ------------------------------------------------------------------
// Summary  : Clear flags of PPUCTRL($2000) using specified value
//            Value && PPUCTRL -> PPUCTRL
// Argument : A value to clear flags
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ clear_ppu_ctrl(unsigned char value);


// ------------------------------------------------------------------
// Summary  : Set flags of PPUMASK($2000) using specified value
//            Value || PPUMASK -> PPUMASK
// Argument : A value to set flags
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ set_ppu_mask(unsigned char value);


// ------------------------------------------------------------------
// Summary  : Clear flags of PPUMASK($2000) using specified value
//            Value && PPUMASK -> PPUMASK
// Argument : A value to clear flags
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ clear_ppu_mask(unsigned char value);


// ------------------------------------------------------------------
// Summary  : Wait until vblank start
// Argument : None
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ wait_vblank(void);


// ------------------------------------------------------------------
// Summary  : Wait until 0 sprite hit was detected
// Argument : None
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ wait_zero_sprite(void);


#endif
