/**
 * @file	PZEngine.h
 * @brief	Engine to calculate the user decribed expression
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZEngine.h"
#import "PZConstant.h"

@interface PZEngine (Private)
- (void) setResult: (NSNumber *) value atIndex: (NSInteger) index ;
@end

@implementation PZEngine

@synthesize resultTable ;

- init
{
	if((self = [super init]) != nil){
		expressionArray = [[NSMutableArray alloc] initWithCapacity: 16] ;
		resultTable = [[NSMutableDictionary alloc] initWithCapacity: 16] ;
	}
	return self ;
}

- (void) setSourceText: (NSString *) text atIndex: (NSUInteger) index
{
	[self setResult: @123 atIndex: index] ;
}

- (void) setResult: (NSNumber *) value atIndex: (NSInteger) index
{
	NSString * key = [[NSString alloc] initWithFormat: @"%d", (int) index] ;
	[resultTable setObject: value forKey: key] ;
}

@end
