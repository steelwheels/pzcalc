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

@property (assign, nonatomic) KCValueFormat		valueFormat ;
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
		self.valueFormat = KCDefaultValueFormat ;
		self.resultValue = nil ;
		self.sourceExpression = nil ;
	}
	return self ;
}

@end

static KCValueFormat
adjustValueFormat(KCValueFormat currentform, KCType * newtype) ;

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
				KCValueFormat newformat = adjustValueFormat(item.valueFormat, [resval type]) ;
				item.valueFormat = newformat ;
				[outputDelegate outputResultString: [resval toString: newformat] atIndex: index] ;
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

static KCValueFormat
adjustValueFormat(KCValueFormat currentform, KCType * newtype)
{
	if(currentform == KCDefaultValueFormat){
		return KCDefaultValueFormat ;
	}
	struct KCSupportValueFormats formats = KCSupportedValueFormatsOfType(newtype) ;
	unsigned int i, num = formats.numberOfFormats ;
	for(i=0; i<num ; i++){
		if(formats.formatArray[i] == currentform){
			return currentform ;
		}
	}
	return KCDefaultValueFormat ;
}

#if DO_DEBUG != 0
static void
printExpression(KCExpression * src)
{
	NSString * expstr = [KCExpressionToString toString: src] ;
	fputs([expstr UTF8String], stdout) ;
}
#endif


