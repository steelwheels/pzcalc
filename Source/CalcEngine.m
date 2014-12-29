/**
 * @file	CalcEngine.m
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "CalcEngine.h"


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
	CNErrorList *	psrerrs = [[CNErrorList alloc] init] ;
	KCExpression *	psrexp = KCParseExpression(str, psrerrs) ;
	if(psrexp){
		KCExpression *	propexp ;
		CNErrorList *	properrs = [[CNErrorList alloc] init] ;
		propexp = [KCTypePropagator propagateTypeInExpression: psrexp errors: properrs] ;
		if(propexp != nil){
			CNErrorList * execerrs = [[CNErrorList alloc] init] ;
			KCValue * resval = [propexp execute: execerrs] ;
			if(resval){
				CalcItem * item = [calcItemArray objectAtIndex: index] ;
				item.sourceExpression = propexp ;
				item.resultValue = resval ;
				KCValueFormat newformat = adjustValueFormat(item.valueFormat, [resval type]) ;
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

- (void) clearExpressionStringAtIndex: (NSUInteger) index
{
	CalcItem * item = [calcItemArray objectAtIndex: index] ;
	item.sourceExpression = nil ;
	item.resultValue = nil ;
	item.valueFormat = KCDefaultValueFormat ; /* Reset the value format */
	[outputDelegate outputResultString: @"" atIndex: index] ;
}

- (void) redrawResultValue: (NSUInteger) index
{
	CalcItem * item = [calcItemArray objectAtIndex: index] ;
	NSString * newstr = [item.resultValue toString: item.valueFormat] ;
	[outputDelegate outputResultString: newstr atIndex: index] ;
}

- (KCValue *) resultValueAtIndex: (NSUInteger) index
{
	if(index < [calcItemArray count]){
		CalcItem * item = [calcItemArray objectAtIndex: index] ;
		return item.resultValue ;
	} else {
		return nil ;
	}
}

- (BOOL) updateResultValueFormat: (KCValueFormat) format atIndex: (NSUInteger) index
{
	BOOL ismodified = NO ;
	if(index < [calcItemArray count]){
		CalcItem * item = [calcItemArray objectAtIndex: index] ;
		if(item.valueFormat != format){
			item.valueFormat = format ;
			ismodified = YES ;
		}
	} else {
		NSLog(@"Invalid index") ;
	}
	return ismodified ;
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


