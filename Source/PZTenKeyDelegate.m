/**
 * @file	PZTenKeyDelegate.m
 * @brief	Data source and delegate for collection view
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import "PZTenKeyDelegate.h"
#import "PZViewController.h"
#import "PZButton.h"
#import "PZKeyCode.h"

#define NUMBER_OF_ROWS		5
#define NUMBER_OF_COLS		5
#define NUMBER_OF_ITEMS		(NUMBER_OF_ROWS * NUMBER_OF_COLS)

struct PZKeyInfo {
	PZKeyCode			keyCode ;
	const char *			keyString ;
} ;

#define S(T, S)	{ .keyCode = PZ ## T ## Key, .keyString = (S) }

static struct PZKeyInfo s_keyValues[][NUMBER_OF_ITEMS] = {
 /* Dec */ {
 S(DecState, "Dec"),	S(Clear, "Clr"),	S(Nop, "-"),	S(Negate, "+/-"), S(Del, "⌫"),
 S(HexState, "Hex"),	S(7, "7"),		S(8, "8"),	S(9, "9"),	  S(Nop, "-"),
 S(FuncState, "Func"),	S(4, "4"),		S(5, "5"),	S(6, "6"),	  S(Mul, "*"),
 S(Nop, "-"),		S(1, "1"),		S(2, "2"),	S(3, "3"),	  S(Ret, "⏎"),
 S(Nop, "-"),		S(0, "0"),		S(Dot, "."),	S(Left, "◀︎"),	  S(Right, "▶︎")
},
 /* Hex */ {
 S(DecState, "Dec"),	S(Clear, "Clr"),	S(A, "A"),	S(B, "B"),	S(C, "C"),
 S(HexState, "Hex"),	S(7, "7"),		S(8, "8"),	S(9, "9"),	S(D, "D"),
 S(FuncState,"Func"),	S(4, "4"),		S(5, "5"),	S(6, "6"),	S(E, "E"),
 S(Nop, "-"),		S(1, "1"),		S(2, "2"),	S(3, "3"),	S(F, "F"),
 S(Nop, "-"),		S(0, "0"),		S(0X, "0x"),	S(Left, "←"),	S(Right, "→")
}
} ;

@interface PZTenKeyDelegate ()
- (IBAction) clickEvent:(id)sender event:(id)event ;
@end

@implementation PZTenKeyDelegate

- (id) initWithController: (PZViewController *) controller 
{
	if((self = [super init]) != nil){
		ownerController = controller ;
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
	
	const char * labstr = s_keyValues[self.tenKeyState][button.buttonId].keyString ;
	NSString * label  = [[NSString alloc] initWithUTF8String: labstr] ;
	
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
		[ownerController pushTenKey: s_keyValues[self.tenKeyState][button.buttonId].keyCode] ;
	}
}

@end
