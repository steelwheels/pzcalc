/**
 * @file	PZButton.h
 * @brief	Define PZButton class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import "PZKeyCode.h"

@interface PZButton : UIButton
{
	
}

@property (nonatomic, assign) NSInteger buttonId ;
@property (nonatomic, assign) PZKeyCode keyCode ;

- (id) initWithCoder:(NSCoder *)aDecoder ;

@end
