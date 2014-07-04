/**
 * @file	PZCalcSheetDelegate.m
 * @brief	Data source and delegate for calc sheet
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZCalcSheetDelegate.h"
#import "PZCalcField.h"

@implementation PZCalcSheetDelegate

- init
{
	if((self = [super init]) != nil){
		calcFields = [[NSMutableArray alloc] initWithCapacity: PZNumberOfFields] ;
		activeFieldIndex = 0 ;
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
	return PZNumberOfFields ;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	PZCalcField * cell;
	cell = [tableView dequeueReusableCellWithIdentifier: @"field" forIndexPath: indexPath];
	[cell setup] ;
	
	/* Add cell to the array */
	NSUInteger index = [indexPath indexAtPosition: 1] ; /* index in the section 0 */
	if([calcFields count] >= index){
		[calcFields addObject: cell] ;
	} else {
		[calcFields setObject: cell atIndexedSubscript: index] ;
	}
	
	/* activate the 1st cell */
	if(index == activeFieldIndex){
		[cell activate] ;
	}
	
	return cell ;	
}

- (void) pushTenKey: (PZKeyCode) code
{
	
	switch (code) {
		case PZRetKey: {
			NSUInteger nextindex = activeFieldIndex + 1 ;
			if(nextindex < [calcFields count]){
				PZCalcField * nextfield = [calcFields objectAtIndexedSubscript: nextindex] ;
				[nextfield activate] ;
				activeFieldIndex = nextindex ;
			}
		} break;
		default: {
			PZCalcField * actfield = [calcFields objectAtIndexedSubscript: activeFieldIndex] ;
			[actfield pushTenKey: code] ;
		} break;
	}
}

@end
