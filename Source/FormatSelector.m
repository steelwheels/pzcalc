/**
 * @file	FormatSelector.m
 * @brief	Define FormatSelector class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "FormatSelector.h"
#import "CalcEngine.h"

@implementation FormatSelector

- (instancetype) initWithViewController: (UIViewController *) controller withCalcEngine: (CalcEngine *) engine
{
	if((self = [super init]) != nil){
		viewController = controller ;
		calcEngine = engine ;
		buttonTable = [[KCButtonTable alloc] init] ;
		currentIndex = 0 ;
	}
	return self ;
}

- (void) touchLabelAtIndex: (NSUInteger) index atAbsolutePoint: (CGPoint) point
{
	currentIndex = index ;
	KCValue * value = [calcEngine resultValueAtIndex: index] ;
	if(value == nil){
		return ;
	}
	
	currentFormats = KCSupportedValueFormatsOfType([value type]) ;
	if(currentFormats.numberOfFormats <= 1){
		return ;
	}
	
	NSMutableArray * menulabels = [[NSMutableArray alloc] initWithCapacity: 16] ;
	unsigned int i, num = currentFormats.numberOfFormats ;
	for(i=0 ; i<num ; i++){
		const char * labstr = KCValueFormatToString(currentFormats.formatArray[i]) ;
		NSString * labname = [[NSString alloc] initWithUTF8String: labstr] ;
		[menulabels addObject: labname] ;
	}
	
	[buttonTable displayButtonTableWithLabelNames: menulabels
					 withDelegate: self
					   withOrigin: point
				     atViewController: viewController] ;
}

- (void) buttonPressed: (NSUInteger) index
{
	KCValueFormat newformat = currentFormats.formatArray[index] ;
	if([calcEngine updateResultValueFormat: newformat atIndex: currentIndex]){
		[calcEngine redrawResultValue: currentIndex] ;
	}
}

@end
