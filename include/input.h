#ifdef __INPUT_H__
#define __INPUT_H__


// --------------------------------------------------------
// input.h : Define function related to input 
// --------------------------------------------------------


// --------------------------------------------------------
// Summary  : Get joypad1
// Argument : None
// Return   : Below format
//            76543210
//            |||||||+- Right
//            ||||||+-- Left
//            |||||+--- Down
//            ||||+---- Up
//            |||+----- Start
//            ||+------ Select
//            |+------- B
//            +-------- A
// --------------------------------------------------------
unsigned char __fastcall__ get_joypad1(void);


// --------------------------------------------------------
// Summary  : Get joypad2
// Argument : None
// Return   : Below format
//            76543210
//            |||||||+- Right
//            ||||||+-- Left
//            |||||+--- Down
//            ||||+---- Up
//            |||+----- Start
//            ||+------ Select
//            |+------- B
//            +-------- A
// --------------------------------------------------------
unsigned char __fastcall__ get_joypad2(void);


#endifn
