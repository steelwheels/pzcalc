/**
 * @file	PZCalcField.h
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import <KiwiCode/KiwiCode.h>
#import "PZForwarders.h"
#import "PZKeyCode.h"

@interface PZCalcField : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * resultLabel ;
@property (weak, nonatomic) IBOutlet UITextField * expressionField ;

- (void) setup: (PZCalcSheetDelegate *) parent ;
- (void) activate ;

  /**
   * @brief Tell push key event to calc field
   * @retval True	The context of the field is modified
   * @retval False	The context of the field is NOT modified
   * @param code Pressed key code
   */
- (BOOL) pushTenKey: (PZKeyCode) code ;

- (void) setResultValue: (KCValue *) value ;

@end
