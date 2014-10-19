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
		functionSampleDeclarationArray = [[KCFunctionTable sharedFunctionTable] allSampleDeclarations] ;
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
	CGSize tablesize = [functionTable frameSize] ;
	
	CGFloat hpos = (bounds.size.width  - tablesize.width ) / 2.0 ;
	if(hpos < 0.0){ hpos = 0.0 ; }
	
	CGPoint offpoint = CGPointMake(bounds.origin.x + hpos, bounds.origin.y) ;
	CGPoint abspoint = KCAbsolutePointAtView(tenKeyView, offpoint) ;
	[functionTable displayButtonTableWithLabelNames: functionSampleDeclarationArray
					   withDelegate: self
					     withOrigin: abspoint
				       atViewController: viewController] ;
}

- (void) buttonPressed: (NSUInteger) index
{
	NSString * funcstr = [functionSampleDeclarationArray objectAtIndex: index] ;
	[sheetView insertStringToExpressionField: funcstr] ;
}

@end


