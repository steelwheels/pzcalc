/**
 * @file	PZViewController.h
 * @brief	Define PZViewController class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZTenKeyDelegate.h"
#import "PZCalcSheetDelegate.h"

@interface PZViewController : UIViewController
{
	PZCalcSheetDelegate *	calcSheetDelegate ;
	PZTenKeyDelegate *	tenKeyDelegate ;
}

@end
