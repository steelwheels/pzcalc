/**
 * @file	PZTenKeyDelegate.m
 * @brief	Data source and delegate for collection view
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZTenKeyDelegate.h"
#import "PZButton.h"
#import "PZKeyCode.h"

#define NUMBER_OF_ROWS		5
#define NUMBER_OF_COLS		5
#define NUMBER_OF_ITEMS		(NUMBER_OF_ROWS * NUMBER_OF_COLS)

static NSString * s_keyValues[][NUMBER_OF_ITEMS] = {
	/* Dec */ {
		@"Dec",		@"Clr",		@"-",		@"+/-",		@"+",
		@"Hex",		@"7",		@"8",		@"9",		@"-",
		@"Float",	@"4",		@"5",		@"6",		@"*",
		@"Func",	@"1",		@"2",		@"3",		@"/",
		@"-",		@"0",		@".",		@"(..)",	@"Ret"
	},
	/* Hex */ {
		@"Dec",		@"Clr",		@"A",		@"B",		@"C",
		@"Hex",		@"7",		@"8",		@"9",		@"D",
		@"Float",	@"4",		@"5",		@"6",		@"E",
		@"Func",	@"1",		@"2",		@"3",		@"F",
		@"-",		@"0",		@".",		@"(..)",	@"Ret"
	}
} ;

@interface PZTenKeyDelegate ()
- (IBAction) clickEvent:(id)sender event:(id)event ;
@end

@implementation PZTenKeyDelegate

- (id) init
{
	if((self = [super init]) != nil){
		NSLog(@"init") ;
		self.tenKeyState = PZDecTenKeyState ;
		self.buttonArray = [[NSMutableArray alloc] initWithCapacity: NUMBER_OF_ITEMS] ;
	}
	return self ;
}

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
	
	[self.buttonArray addObject: button] ;
	
	NSString * label = s_keyValues[self.tenKeyState][button.buttonId] ;
	[button setTitle: label forState: UIControlStateNormal] ;
	[button addTarget: self action: @selector(clickEvent:event:) forControlEvents: UIControlEventTouchUpInside] ;
	
	if(button.buttonId == 0){
		button.selected = true ;
		self.tenKeyState = PZDecTenKeyState ;
	}
	return cell;
}

- (IBAction) clickEvent:(id) sender event:(id) event
{
	PZButton * button = sender ;
	
	NSUInteger bid = button.buttonId ;
	if((bid % NUMBER_OF_ROWS) == 0){
		PZTenKeyState nextstate = (PZTenKeyState) (bid / NUMBER_OF_ROWS) ;
		PZButton * prevbutton = [self.buttonArray objectAtIndex: self.tenKeyState * NUMBER_OF_ROWS] ;
		PZButton * nextbutton = [self.buttonArray objectAtIndex: nextstate * NUMBER_OF_ROWS] ;
		prevbutton.selected = false ;
		nextbutton.selected = true ;
		self.tenKeyState = nextstate ;
	} else {
		NSLog(@"clicked %u", (unsigned int) button.buttonId) ;
	}
}

@end
