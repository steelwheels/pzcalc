/**
 * @file	PZCalcField.m
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZCalcField.h"

@implementation PZCalcField

- (void) clear
{
	self.resultLabel.text = @"" ;
	self.calcLabel.text = @"" ;
}

@end
