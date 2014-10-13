/**
 * @file	TenKeyToSheet.m
 * @brief	Define TenKeyToSheet class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "TenKeyToSheet.h"
#import <KiwiCode/KiwiCode.h>

@implementation TenKeyToSheet

- (instancetype) initWithController: (UIViewController *) controller withTenKeyView: (PzTenKeyView *) tenkey withSheetView: (PzSheetView *) sheet
{
	if((self = [super init]) != nil){
		viewController = controller ;
		tenKeyView = tenkey ;
		sheetView = sheet ;
		/** Connect tenKeyView <- self */
		tenKeyView.delegate = self ;
		
		/** Setup function menu */
		functionTable = [[KCButtonTable alloc] init] ;
		functionNameArray = [[KCFunctionTable sharedFunctionTable] allFunctionNames] ;
	}
	return self ;
}

- (void) pressKey: (enum PzTenKeyCode) code
{
	switch(code){
		case PzTenKeyCode_Nop: {
			/* Do nothing */
		} break ;
		case PzTenKeyCode_Ret: {
			[sheetView selectNextExpressionField] ;
		} break ;
		case PzTenKeyCode_Del: {
			[sheetView deleteSelectedStringInExpressionField] ;
		} break ;
		case PzTenKeyCode_MoveLeft: {
			[sheetView moveCursorBackwardInExpressionField] ;
		} break ;
		case PzTenKeyCode_MoveRight: {
			[sheetView moveCursorForwardInExpressionField] ;
		} break ;
		case PzTenKeyCode_Clear: {
			[sheetView clearCurrentField] ;
		} break ;
		case PzTenKeyCode_AllClear: {
			[sheetView clearAllFields] ;
		} break ;
		case PzTenKeyCode_FuncSel: {
			[self selectFunction] ;
		} break ;
		default: {
			NSString * str = PzTenKeyTypeToString(code) ;
			if(str){
				[sheetView insertStringToExpressionField: str] ;
			}
		} break ;
	}
}

- (void) selectFunction
{
	CGRect bounds = [tenKeyView bounds] ;
	CGPoint abspoint = KCAbsolutePointAtView(tenKeyView, bounds.origin) ;
	[functionTable displayButtonTableWithLabelNames: functionNameArray
					   withDelegate: self
					     withOrigin: abspoint
				       atViewController: viewController] ;
}

- (void) buttonPressed: (NSUInteger) index
{
	NSString * funcstr = [functionNameArray objectAtIndex: index] ;
	[sheetView insertStringToExpressionField: funcstr] ;
}

@end


