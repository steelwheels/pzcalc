/**
 * @file	PZCalcSheetDelegate.m
 * @brief	Data source and delegate for calc sheet
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZCalcSheetDelegate.h"
#import "PZCalcField.h"
#import "PZConstant.h"

@implementation PZCalcSheetDelegate

@synthesize activeFieldIndex ;

- init
{
	if((self = [super init]) != nil){
		calcFields = [[NSMutableArray alloc] initWithCapacity: PZNumberOfCalcFields] ;
		self.activeFieldIndex = 0 ;
	}
	return self ;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
	((void) tableView) ;
	return 1 ;
}

- (NSInteger)tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
	((void) tableView) ;
	((void) section) ;
	return PZNumberOfCalcFields ;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	PZCalcField * cell;
	cell = [tableView dequeueReusableCellWithIdentifier: @"field" forIndexPath: indexPath];
	[cell setup: self] ;
	
	/* Add cell to the array */
	NSUInteger index = [indexPath indexAtPosition: 1] ; /* index in the section 0 */
	if([calcFields count] >= index){
		[calcFields addObject: cell] ;
	} else {
		[calcFields setObject: cell atIndexedSubscript: index] ;
	}
	
	/* activate the 1st cell */
	if(index == self.activeFieldIndex){
		[cell activate] ;
	}
	
	return cell ;	
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) nextpath
{
	NSUInteger nextindex = [nextpath indexAtPosition: 1] ; /* index in the section 0 */
	PZCalcField * nextfield = [calcFields objectAtIndexedSubscript: nextindex] ;
	[nextfield activate] ;
	
	self.activeFieldIndex = nextindex ;
}

- (BOOL) textFieldShouldBeginEditing: (UITextField *) textField
{
	NSUInteger i ;
	for(i=0 ; i<PZNumberOfCalcFields ; i++){
		PZCalcField * calcfield = [calcFields objectAtIndex: i] ;
		if(calcfield.expressionField == textField){
			self.activeFieldIndex = i ;
			return true ;
		}
	};
	return false ;
}

- (BOOL) pushTenKey: (PZKeyCode) code
{
	BOOL edited = false ;
	switch (code) {
		case PZRetKey: {
			NSUInteger nextindex = self.activeFieldIndex + 1 ;
			if(nextindex >= [calcFields count]){
				nextindex = 0 ;
			}
			PZCalcField * nextfield = [calcFields objectAtIndexedSubscript: nextindex] ;
			[nextfield activate] ;
			self.activeFieldIndex = nextindex ;
		} break;
		default: {
			PZCalcField * actfield = [calcFields objectAtIndexedSubscript: self.activeFieldIndex] ;
			[actfield pushTenKey: code] ;
			edited = true ;
		} break;
	}
	return edited ;
}

- (void) linkWithResultTable: (NSMutableDictionary *) table
{
	static NSInteger	s_indexs[PZNumberOfCalcFields] ;
	
	NSInteger	i ;
	for(i=0 ; i<PZNumberOfCalcFields ; i++){
		NSString * numstr = [[NSString alloc] initWithFormat: @"%d", (int) i] ;
		s_indexs[i] = i ;
		[table addObserver: self forKeyPath: numstr options: NSKeyValueObservingOptionNew context: &(s_indexs[i])] ;
	}
}

- (void) observeValueForKeyPath: (NSString *) keypath ofObject: (id) object change:(NSDictionary *) change context:(void *)context
{
	NSInteger		index = *((NSInteger *) context) ;
	NSMutableDictionary *	dict = object ;
	KCValue *		value = [dict valueForKey: keypath] ;
	PZCalcField *	calcfield = [calcFields objectAtIndexedSubscript: index] ;
	[calcfield performSelectorOnMainThread: @selector(setResultValue:) withObject: value waitUntilDone: NO] ;
}

- (NSString *) activeFieldText
{
	PZCalcField * field = [calcFields objectAtIndexedSubscript: self.activeFieldIndex] ;
	return field.expressionField.text ;
}

@end
