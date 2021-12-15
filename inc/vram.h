#ifndef __VRAM_H__
#define __VRAM_H__


// ------------------------------------------------------------------
// vram.h : Define function releted to vram
// ------------------------------------------------------------------


// ------------------------------------------------------------------
// Summary  : Set vram address
// Argument : Address of vram
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ set_vram_addr(unsigned int addr);


// ------------------------------------------------------------------
// Summary  : Put a value to vram
// Argument : A value to put to vram
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ put_to_vram(unsigned int value);


// ------------------------------------------------------------------
// Summary  : Get a value from vram
// Argument : None
// Return   : Value
// ------------------------------------------------------------------
unsigned char __fastcall__ get_from_vram(void);


// ------------------------------------------------------------------
// Summary  : Copy data to vram
// Argument : Number of data - 1 and pointer of data
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ copy_to_vram(unsigned char num, void *ptr);


// ------------------------------------------------------------------
// Summary  : Copy data to vram
// Argument : Number of data - 1 and pointer of ram that data
//            will be stored
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ copy_from_vram(unsigned char num, void *ptr);


// ------------------------------------------------------------------
// Summary  : Fill vram with specified value
// Argument : Number of time to fill data - 1 and value to use
// Return   : None
// ------------------------------------------------------------------
void __fastcall__ fill_vram(unsigned char num, unsigned char value);


#endif
