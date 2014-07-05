/**
 * @file	PZCalcSheetDelegate.h
 * @brief	Data source and delegate for calc sheet
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZForwarders.h"
#import "PZKeyCode.h"
#import "PZConstant.h"

@interface PZCalcSheetDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>
{
	NSMutableArray *		calcFields ;
}

@property (assign, nonatomic) NSUInteger	activeFieldIndex ;

- init ;
- (BOOL) pushTenKey: (PZKeyCode) code ;
- (void) linkWithResultTable: (NSMutableDictionary *) table ;

- (NSString *) activeFieldText ;

@end
