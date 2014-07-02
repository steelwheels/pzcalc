/**
 * @file	PZButton.h
 * @brief	Define PZButton class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZButton.h"

static const NSInteger PZNoButtonIndex		= -1 ;

@implementation PZButton

- (id) initWithCoder:(NSCoder *)aDecoder
{
	if((self = [super initWithCoder: aDecoder]) != nil){
		self.layer.shadowOpacity = 0.5f;//shadow
		self.layer.shadowOffset = CGSizeMake(2, 2);//shadow
		
		self.buttonId = PZNoButtonIndex ;
		self.keyCode = PZNopKey ;
	}
	return self ;
}

@synthesize buttonId ;
@synthesize keyCode ;

@end
