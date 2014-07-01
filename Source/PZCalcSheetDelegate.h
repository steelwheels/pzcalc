/**
 * @file	PZCalcSheetDelegate.h
 * @brief	Data source and delegate for calc sheet
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZForwarders.h"
#import "PZKeyCode.h"

@interface PZCalcSheetDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>
{
	NSMutableArray *		calcFields ;
	NSUInteger			activeFieldIndex ;
}

- init ;
- (void) pushTenKey: (PZKeyCode) code ;

@end
