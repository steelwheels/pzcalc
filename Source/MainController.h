/**
 * @file	MainController.h
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "Forwarders.h"
#import <UIKit/UIKit.h>
#import <PzTenKeyView/PzTenKeyView.h>
#import <PzSheetView/PzSheetView.h>

@interface MainController : UIViewController
{
	CalcEngine *				calcEngine ;
	TenKeyToSheet *				tenKeyToSheet ;
	SheetToEngine *				sheetToEngine ;
	__weak IBOutlet PzTenKeyView *		tenKeyView;
	__weak IBOutlet PzSheetView *		sheetView;
}

@end

