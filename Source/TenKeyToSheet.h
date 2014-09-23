/**
 * @file	TenKeyToSheet.h
 * @brief	Define TenKeyToSheet class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <PzTenKeyView/PzTenKeyView.h>
#import <PzSheetView/PzSheetView.h>

@interface TenKeyToSheet : NSObject <PzTenKeyClicking>
{
	PzTenKeyView *			tenKeyView ;
	PzSheetView *			sheetView ;
}

- (instancetype) initWithTenKeyView: (PzTenKeyView *) tenkey withSheetView: (PzSheetView *) sheet ;

@end
