/**
 * @file	TenKeyToSheet.m
 * @brief	Define TenKeyToSheet class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "TenKeyToSheet.h"

@implementation TenKeyToSheet

- (instancetype) initWithTenKeyView: (PzTenKeyView *) tenkey withSheetView: (PzSheetView *) sheet
{
	if((self = [super init]) != nil){
		tenKeyView = tenkey ;
		sheetView = sheet ;
		/** Connect tenKeyView <- self */
		tenKeyView.delegate = self ;
	}
	return self ;
}

- (void) pressKey: (enum PzTenKeyCode) code
{
	switch(code){
		case PzTenKeyCode_Ret: {
			[sheetView selectNextExpressionField] ;
		} break ;
		case PzTenKeyCode_Del: {
		} break ;
		case PzTenKeyCode_MoveLeft: {
			[sheetView moveCursorBackwardInExpressionField] ;
		} break ;
		case PzTenKeyCode_MoveRight: {
			[sheetView moveCursorForwardInExpressionField] ;
		} break ;
		default: {
			NSString * str = PzTenKeyTypeToString(code) ;
			if(str){
				[sheetView insertStringToExpressionField: str] ;
			}
		} break ;
	}
}

@end
