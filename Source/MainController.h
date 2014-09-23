/**
 * @file	MainController.h
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import <PzTenKeyView/PzTenKeyView.h>
#import <PzSheetView/PzSheetView.h>
#import "TenKeyToSheet.h"

@interface MainController : UIViewController
{
	TenKeyToSheet *				tenKeyToSheet ;
	__weak IBOutlet PzTenKeyView *		tenKeyView;
	__weak IBOutlet PzSheetView *		sheetView;
}

@end

