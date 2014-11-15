/**
 * @file	FormatSelector.h
 * @brief	Define FormatSelector class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <Foundation/Foundation.h>
#import <PzSheetView/PzSheetView.h>
#import <KCButtonTable/KCButtonTable.h>
#import <KiwiCode/KiwiCode.h>
#import "Forwarders.h"

@interface FormatSelector : NSObject <PzSheetTouchLabelDelegate, KCButtonTableDelegate>
{
	UIViewController *		viewController ;
	CalcEngine *			calcEngine ;
	
	KCButtonTable *			buttonTable ;
	struct KCSupportValueFormats	currentFormats ;
	NSUInteger			currentIndex ;
}

- (instancetype) initWithViewController: (UIViewController *) controller withCalcEngine: (CalcEngine *) engine ;

@end
