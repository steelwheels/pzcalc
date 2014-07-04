/**
 * @file	PZViewController.h
 * @brief	Define PZViewController class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZTenKeyDelegate.h"
#import "PZCalcSheetDelegate.h"
#import "PZKeyCode.h"

@interface PZViewController : UIViewController
{
	PZCalcSheetDelegate *	calcSheetDelegate ;
	PZTenKeyDelegate *	tenKeyDelegate ;
	PZEngine *		calcEngine ;
}

- (void) pushTenKey: (PZKeyCode) code ;

@end
