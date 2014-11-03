/**
 * @file	KCExpressionParser.h
 * @brief	Define KCExpressionParser class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <KiwiCode/KiwiCode.h>

@interface KCExpressionParser : NSObject
{
	/*
	 * Scanner
	 */
	NSString *		inputString ;
	NSUInteger		currentInputPosition ;
	NSUInteger		maxInputLength ;
	
	/*
	 * Error handerl
	 */
	NSMutableArray *	errorArray ;
}

@property (strong, nonatomic)	KCExpression *	resultExpression ;

- (instancetype) initWithInputString: (NSString *) str ;
- (size_t) input: (char *) buf withMaxSize: (unsigned long) buflen ;

- (void) addError: (KCError *) error ;
- (NSArray *) errors ;

@end
