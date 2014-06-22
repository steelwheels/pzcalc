/**
 * @file	PZCalcSheetDelegate.m
 * @brief	Data source and delegate for calc sheet
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZCalcSheetDelegate.h"

@implementation PZCalcSheetDelegate

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
	((void) tableView) ;
	return 1 ;
}

- (NSInteger)tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
	((void) tableView) ;
	((void) section) ;
	return 3 ;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell * cell;
	cell = [tableView dequeueReusableCellWithIdentifier: @"field" forIndexPath: indexPath];

	return cell ;	
}

@end
