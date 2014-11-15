/**
 * @file	SheetToEngine.h
 * @brief	Define SheetToEngine class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <PzSheetView/PzSheetView.h>
#import "CalcEngine.h"
#import "Forwarders.h"

@interface SheetToEngine : NSObject <PzSheetTextFieldDelegate, CalcEngineOutputDelegate>
{
	PzSheetView *		sheetView ;
	CalcEngine *		calcEngine ;
}

- (instancetype) initWithSheetView: (PzSheetView *) sheet withCalcEngine: (CalcEngine *) engine ;

@end
