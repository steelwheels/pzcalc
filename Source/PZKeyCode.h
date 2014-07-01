/**
 * @file	PZKeyCode.h
 * @brief	Define ten key code
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#ifndef PZKEYCODE_H
#define PZKEYCODE_H

#import <UIKit/UIKit.h>

#define PZKeyMask			0xffff0000
#define PZNopKeyMask			0x00000000
#define PZStateKeyMask			0x00010000
#define PZEditKeyMask			0x00020000
#define PZOperationKeyMask		0x00030000
#define PZNumberKeyMask			0x00040000

typedef enum {
	PZNopKey			= PZNopKeyMask		| 0x0001,
	
	PZDecStateKey			= PZStateKeyMask	| 0x0001,
	PZHexStateKey			= PZStateKeyMask	| 0x0002,
	PZFuncStateKey			= PZStateKeyMask	| 0x0003,
	
	PZClearKey			= PZEditKeyMask		| 0x0001,
	PZLeftKey			= PZEditKeyMask		| 0x0002,
	PZRightKey			= PZEditKeyMask		| 0x0003,
	PZRetKey			= PZEditKeyMask		| 0x0004,
	PZDelKey			= PZEditKeyMask		| 0x0005,
	
	PZNegateKey			= PZOperationKeyMask	| 0x0001,
	PZAddKey			= PZOperationKeyMask	| 0x0002,
	PZSubKey			= PZOperationKeyMask	| 0x0003,
	PZMulKey			= PZOperationKeyMask	| 0x0004,
	PZDivKey			= PZOperationKeyMask	| 0x0005,
	PZModKey			= PZOperationKeyMask	| 0x0006,
	
	PZ0Key				= PZNumberKeyMask	| 0x0000,
	PZ1Key				= PZNumberKeyMask	| 0x0001,
	PZ2Key				= PZNumberKeyMask	| 0x0002,
	PZ3Key				= PZNumberKeyMask	| 0x0003,
	PZ4Key				= PZNumberKeyMask	| 0x0004,
	PZ5Key				= PZNumberKeyMask	| 0x0005,
	PZ6Key				= PZNumberKeyMask	| 0x0006,
	PZ7Key				= PZNumberKeyMask	| 0x0007,
	PZ8Key				= PZNumberKeyMask	| 0x0008,
	PZ9Key				= PZNumberKeyMask	| 0x0009,
	PZAKey				= PZNumberKeyMask	| 0x000A,
	PZBKey				= PZNumberKeyMask	| 0x000B,
	PZCKey				= PZNumberKeyMask	| 0x000C,
	PZDKey				= PZNumberKeyMask	| 0x000D,
	PZEKey				= PZNumberKeyMask	| 0x000E,
	PZFKey				= PZNumberKeyMask	| 0x000F,
	PZDotKey			= PZNumberKeyMask	| 0x0010,
	PZ0XKey				= PZNumberKeyMask	| 0x0011
} PZKeyCode ;


#endif	/* PZKEYCODE_H */

