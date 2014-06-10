/**
 * @file	PZTenKeyDelegate.m
 * @brief	Data source and delegate for collection view
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZTenKeyDelegate.h"
#import "PZButton.h"

#define NUMBER_OF_ITEMS		20

@interface PZTenKeyDelegate ()
- (IBAction) clickEvent:(id)sender event:(id)event ;
@end

@implementation PZTenKeyDelegate

- (NSInteger) numberOfSectionsInCollectionView: (UICollectionView *) collectionView
{
	return 1;
}

- (NSInteger) collectionView: (UICollectionView *) collectionView numberOfItemsInSection:(NSInteger)section
{
	((void) collectionView) ;
	((void) section) ;
	return NUMBER_OF_ITEMS ;
}

- (UICollectionViewCell *) collectionView: (UICollectionView *)collectionView cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
	UICollectionViewCell *cell;
	cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"key" forIndexPath:indexPath];
	
	PZButton * button = (PZButton *) [cell viewWithTag: 1] ; /* The tag id is attached to the button */
	button.buttonId = [indexPath row] ;
	[button addTarget: self action: @selector(clickEvent:event:) forControlEvents: UIControlEventTouchUpInside] ;
	return cell;
}

- (IBAction) clickEvent:(id) sender event:(id) event
{
	PZButton * button = sender ;
	NSLog(@"clicked %u", (unsigned int) button.buttonId) ;
}

@end
