/**
 * @file	SheetToEngine.m
 * @brief	Define SheetToEngine class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "SheetToEngine.h"
#import "CalcEngine.h"

@implementation SheetToEngine

- (instancetype) initWithSheetView: (PzSheetView *) sheet withCalcEngine: (CalcEngine *) engine
{
	if((self = [super init]) != nil){
		sheetView = sheet ;
		calcEngine = engine ;
		
		[sheetView setTextFieldDelegate: self] ;
		calcEngine.outputDelegate = self ;
	}
	return self ;
}

- (void) enterText: (NSString *) text atIndex: (NSUInteger) index
{
	[calcEngine putExpressionString: text atIndex: index] ;
}

- (void) clearTextAtIndex: (NSUInteger) index
{
	[calcEngine clearExpressionStringAtIndex: index] ;
}

- (void) outputResultString: (NSString *) str atIndex: (NSUInteger) index
{
	[sheetView setLabelText: str forSlot: index] ;
}

@end
