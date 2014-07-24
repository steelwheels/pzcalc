/**
 * @file	PZEngine.h
 * @brief	Engine to calculate the user decribed expression
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZEngine.h"
#import "PZConstant.h"
#import <KiwiCode/KiwiCode.h>

@interface PZEngine (Private)
- (void) setResult: (KCValue *) value atIndex: (NSInteger) index ;
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
	KCExpression *		psrexp ;
	NSArray *		errors ;
	psrexp = KCParseExpression(text, &errors) ;
	
	KCValue * resval = nil ;
	if(psrexp){
		KCError *	error ;
		KCExpression *	propexp ;
		propexp = [KCTypePropagator propagateTypeInExpression: psrexp error: &error] ;
		if(propexp){
			resval = [propexp execute: &error] ;
		}
	}
	if(resval == nil){
		resval = [[KCValue alloc] initWithStringValue: @""] ;
	}
	[self setResult: resval atIndex: index] ;
}

- (void) setResult: (KCValue *) value atIndex: (NSInteger) index
{
	NSString * key = [[NSString alloc] initWithFormat: @"%d", (int) index] ;
	[resultTable setObject: value forKey: key] ;
}

@end
