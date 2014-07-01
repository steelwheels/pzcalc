/**
 * @file	PZCalcField.h
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZForwarders.h"
#import "PZKeyCode.h"

@interface PZCalcField : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * resultLabel ;
@property (weak, nonatomic) IBOutlet UITextField * expressionField ;

- (void) setup ;
- (void) activate ;

  /**
   * @brief Tell push key event to calc field
   * @retval True	The key even is accepted by the field
   * @retval False	The event is NOT accepted
   * @param code Pressed key code
   */
- (BOOL) pushTenKey: (PZKeyCode) code ;

@end
