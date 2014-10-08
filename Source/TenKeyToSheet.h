/**
 * @file	TenKeyToSheet.h
 * @brief	Define TenKeyToSheet class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <PzTenKeyView/PzTenKeyView.h>
#import <PzSheetView/PzSheetView.h>
#import <KCButtonTable/KCButtonTable.h>

@interface TenKeyToSheet : NSObject <PzTenKeyClicking, KCButtonTableDelegate>
{
	UIViewController *		viewController ;
	PzTenKeyView *			tenKeyView ;
	PzSheetView *			sheetView ;
	KCButtonTable *			functionTable ;
	NSArray *			functionNameArray ;
}

- (instancetype) initWithController: (UIViewController *) controller withTenKeyView: (PzTenKeyView *) tenkey withSheetView: (PzSheetView *) sheet ;

@end
