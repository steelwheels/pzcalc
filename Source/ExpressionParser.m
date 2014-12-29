/**
 * @file	ExpressionParser.m
 * @brief	Define KCExpressionParser class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "ExpressionParser.h"

@implementation KCExpressionParser

@synthesize resultExpression ;

- (instancetype) initWithInputString: (NSString *) str withErrors: (CNErrorList *) errs
{
	if((self = [super init]) != nil){
		self.resultExpression = nil ;
		self.errors = errs ;
		
		inputString = [str copy] ;
		currentInputPosition = 0 ;
		maxInputLength = [inputString length] ;
	}
	return self ;
}

- (size_t) input: (char *) buf withMaxSize: (unsigned long) buflen
{
	//printf("%s : input\n", __func__) ;
	if(currentInputPosition < maxInputLength){
		NSUInteger	restlen = maxInputLength - currentInputPosition ;
		NSUInteger	copylen = MIN(buflen, restlen) ;
		const char *	srcptr = [inputString UTF8String] + currentInputPosition ;
		memcpy(buf, srcptr, copylen) ;
		currentInputPosition += copylen ;
		//printf("Read size : %u\n", (unsigned int) copylen) ;
		return copylen ;
	} else {
		//printf("Read size : ZERO\n") ;
		return 0 ;
	}
}

@end
