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
 S(DecState, "Dec"),	S(HexState, "Hex"),	S(OpState, "Op"),	S(FuncState, "Func"),	S(Del, "⌫"),
 S(7, "7"),		S(8, "8"),		S(9, "9"),		S(LeftPar, "("),	S(RightPar, ")"),
 S(4, "4"),		S(5, "5"),		S(6, "6"),		S(Mul, "*"),		S(Div, "/"),
 S(1, "1"),		S(2, "2"),		S(3, "3"),		S(Add, "+"),		S(Sub, "-"),
 S(0, "0"),		S(Dot, "."),		S(Ret, "⏎"),		S(MovLeft, "◀︎"),	S(MovRight, "▶︎")
},
 /* Hex */ {
 S(DecState, "Dec"),	S(HexState, "Hex"),	S(OpState, "Op"),	S(FuncState, "Func"),	S(Del, "⌫"),
 S(7, "7"),		S(8, "8"),		S(9, "9"),		S(E, "E"),		S(F, "F"),
 S(4, "4"),		S(5, "5"),		S(6, "6"),		S(C, "C"),		S(D, "D"),
 S(1, "1"),		S(2, "2"),		S(3, "3"),		S(A, "A"),		S(B, "B"),
 S(0, "0"),		S(0X, "0x"),		S(Ret, "⏎"),		S(MovLeft, "◀︎"),	S(MovRight, "▶︎")
},
 /* Op */ {
 S(DecState, "Dec"),	S(HexState, "Hex"),	S(OpState, "Op"),	S(FuncState, "Func"),	S(Del, "⌫"),
 S(7, "7"),		S(8, "8"),		S(9, "9"),		S(LeftPar, "("),	S(RightPar, ")"),
 S(4, "4"),		S(5, "5"),		S(6, "6"),		S(Equal, "="),		S(Not, "!"),
 S(1, "1"),		S(2, "2"),		S(3, "3"),		S(Less, "<"),		S(Greater, ">"),
 S(Equal, "="),		S(Dot, "."),		S(Ret, "⏎"),		S(MovLeft, "◀︎"),	S(MovRight, "▶︎")
},
 /* Func */ {
 S(DecState, "Dec"),	S(HexState, "Hex"),	S(OpState, "Op"),	S(FuncState, "Func"),	S(Del, "⌫"),
 S(7, "7"),		S(8, "8"),		S(9, "9"),		S(LeftPar, "("),	S(RightPar, ")"),
 S(4, "4"),		S(5, "5"),		S(6, "6"),		S(Equal, "="),		S(Not, "!"),
 S(1, "1"),		S(2, "2"),		S(3, "3"),		S(Less, "<"),		S(Greater, ">"),
 S(Equal, "="),		S(Dot, "."),		S(Ret, "⏎"),		S(MovLeft, "◀︎"),	S(MovRight, "▶︎")
}
} ;

static inline const char *
keyStringOfButton(PZTenKeyState state, NSInteger buttonid)
{
	return s_keyValues[state][buttonid].keyString ;
}

static inline PZKeyCode
keyCodeOfButton(PZTenKeyState state, NSInteger buttonid)
{
	return s_keyValues[state][buttonid].keyCode ;
}

@interface PZTenKeyDelegate ()
- (IBAction) clickEvent:(id)sender event:(id)event ;
- (void) updateKeyLabels ;
@end

@implementation PZTenKeyDelegate

- (id) initWithController: (PZViewController *) controller 
{
	if((self = [super init]) != nil){
		ownerController = controller ;
		currentStateButton = nil ;
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
	
	const char * labstr = keyStringOfButton(self.tenKeyState, button.buttonId) ;
	NSString * label  = [[NSString alloc] initWithUTF8String: labstr] ;
	
	[button setTitle: label forState: UIControlStateNormal] ;
	[button addTarget: self action: @selector(clickEvent:event:) forControlEvents: UIControlEventTouchUpInside] ;
	
	PZKeyCode code = keyCodeOfButton(self.tenKeyState, button.buttonId) ;
	if(code == PZDecStateKey){
		currentStateButton = button ;
		button.selected = true ;
		self.tenKeyState = PZDecTenKeyState ;
	}
	return cell;
}

- (IBAction) clickEvent:(id) sender event:(id) event
{
	PZButton * button = sender ;
	
	PZKeyCode code = keyCodeOfButton(self.tenKeyState, button.buttonId) ;
	if((code & PZKeyMask) == PZStateKeyMask){
		if(currentStateButton != button){
			currentStateButton.selected = false ;
			switch(code){
				case PZDecStateKey:
					self.tenKeyState = PZDecTenKeyState ;
				break ;
				case PZHexStateKey:
					self.tenKeyState = PZHexTenKeyState ;
				break ;
				case PZOpStateKey:
					self.tenKeyState = PZOpTenKeyState ;
				break ;
				case PZFuncStateKey:
					self.tenKeyState = PZFuncTenKeyState ;
				break ;
				default:
				break ;
			}
			currentStateButton = button ;
			currentStateButton.selected = true ;
			/* Update key labels */
			[self updateKeyLabels] ;
		}
	} else if(code != PZNopKey){
		[ownerController pushTenKey: code] ;
	}
}

- (void) updateKeyLabels
{
	PZTenKeyState state = self.tenKeyState ;
	for(PZButton * button in self.buttonArray){
		NSInteger buttonid = button.buttonId ;
		const char * label = keyStringOfButton(state, buttonid) ;
		NSString * labobj = [[NSString alloc] initWithUTF8String: label] ;
		[button setTitle: labobj forState: UIControlStateNormal] ;
	}
}

@end
