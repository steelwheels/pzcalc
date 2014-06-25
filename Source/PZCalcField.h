/**
 * @file	PZCalcField.h
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

@interface PZCalcField : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * resultLabel ;
@property (weak, nonatomic) IBOutlet UILabel * calcLabel ;

- (void) clear ;

@end
