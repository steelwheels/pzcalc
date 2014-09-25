/**
 * @file	CalcEngine.m
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "CalcEngine.h"
#import <KiwiCode/KiwiCode.h>

#define DO_DEBUG	0

@interface CalcItem : NSObject

@property (strong, nonatomic) KCValue *			resultValue ;
@property (strong, nonatomic) KCExpression *		sourceExpression ;

- (instancetype) init ;

@end

@implementation CalcItem

@synthesize	resultValue ;
@synthesize	sourceExpression ;

- (instancetype) init
{
	if((self = [super init]) != nil){
		self.resultValue = nil ;
		self.sourceExpression = nil ;
	}
	return self ;
}

@end

#if DO_DEBUG != 0
static void printExpression(KCExpression * src) ;
#endif

@implementation CalcEngine

@synthesize outputDelegate ;

- (instancetype) initWithItemCount: (NSUInteger) count
{
	if((self = [super init]) != nil){
		calcItemArray = [[NSMutableArray alloc] initWithCapacity: 32] ;
		NSUInteger i ;
		for(i=0 ; i<count ; i++){
			CalcItem * newitem = [[CalcItem alloc] init] ;
			[calcItemArray addObject: newitem] ;
		}
		self.outputDelegate = nil ;
	}
	return self ;
}

- (void) putExpressionString: (NSString *) str atIndex: (NSUInteger) index
{
	BOOL		result = NO ;
	NSArray *	psrerrs ;
	KCExpression * psrexp = KCParseExpression(str, &psrerrs) ;
	if(psrexp){
		KCExpression *	propexp ;
		KCError *	properr ;
		propexp = [KCTypePropagator propagateTypeInExpression: psrexp error: &properr] ;
		if(propexp != nil){
			KCError * execerr ;
			KCValue * resval = [propexp execute: &execerr] ;
			if(resval){
				CalcItem * item = [calcItemArray objectAtIndex: index] ;
				item.sourceExpression = propexp ;
				item.resultValue = resval ;
				[outputDelegate outputResultString: [resval toString] atIndex: index] ;
				result = YES ;
			}
		}
	}
	if(!result){
		CalcItem * item = [calcItemArray objectAtIndex: index] ;
		item.sourceExpression = nil ;
		item.resultValue = nil ;
		[outputDelegate outputResultString: @"" atIndex: index] ;
	}
}

@end

#if DO_DEBUG != 0
static void
printExpression(KCExpression * src)
{
	NSString * expstr = [KCExpressionToString toString: src] ;
	fputs([expstr UTF8String], stdout) ;
}
#endif


