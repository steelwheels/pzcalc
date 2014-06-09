/**
 * @file	PZButton.h
 * @brief	Define PZButton class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZButton.h"

@implementation PZButton

- (id) initWithCoder:(NSCoder *)aDecoder
{
	if((self = [super initWithCoder: aDecoder]) != nil){
		self.layer.borderColor = [UIColor grayColor].CGColor;
		self.layer.borderWidth = 1.0f;
		self.layer.cornerRadius = 7.5f;
	}
	return self ;
}

@end
