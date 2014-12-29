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
}

@property (strong, nonatomic) KCExpression *	resultExpression ;
@property (strong, nonatomic) CNErrorList *	errors ;

- (instancetype) initWithInputString: (NSString *) str withErrors: (CNErrorList *) errs ;
- (size_t) input: (char *) buf withMaxSize: (unsigned long) buflen ;

@end
