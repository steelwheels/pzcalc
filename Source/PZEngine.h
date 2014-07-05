/**
 * @file	PZEngine.h
 * @brief	Engine to calculate the user decribed expression
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <Foundation/Foundation.h>

@interface PZEngine : NSObject
{
	NSMutableArray *		expressionArray ;
}

@property (strong, atomic) NSMutableDictionary *	resultTable ;

- init ;
- (void) setSourceText: (NSString *) text atIndex: (NSUInteger) index ;

@end
