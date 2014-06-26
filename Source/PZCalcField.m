/**
 * @file	PZCalcField.m
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZCalcField.h"

@implementation PZCalcField

- (void) setup
{
	//PZExpFieldDelegate * expdelegate = [[PZExpFieldDelegate alloc] init] ;
	
	self.resultLabel.text = @"" ;
	self.expressionField.text = @"" ;
	//self.expressionField.delegate = expdelegate ;
}

- (void) activate
{
	[self.expressionField resignFirstResponder] ;
}



@end
