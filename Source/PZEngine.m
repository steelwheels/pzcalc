/**
 * @file	PZEngine.h
 * @brief	Engine to calculate the user decribed expression
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZEngine.h"
#import "PZConstant.h"

@implementation PZEngine

- init
{
	if((self = [super init]) != nil){
		expressionArray = [[NSMutableArray alloc] initWithCapacity: 16] ;
	}
	return self ;
}

@end
