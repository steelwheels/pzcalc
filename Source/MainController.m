/**
 * @file	MainController.m
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "MainController.h"
#import "CalcEngine.h"
#import "FormatSelector.h"
#import "TenKeyToSheet.h"
#import "SheetToEngine.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	calcEngine = [[CalcEngine alloc] initWithItemCount: [PzSheetView maxRowNum]] ;
	formatSelector = [[FormatSelector alloc] initWithViewController: self withCalcEngine: calcEngine] ;
	tenKeyToSheet = [[TenKeyToSheet alloc] initWithTenKeyView: tenKeyView withSheetView: sheetView] ;
	sheetToEngine = [[SheetToEngine alloc] initWithSheetView: sheetView withCalcEngine: calcEngine] ;
	
	[sheetView setTouchableLabelDelegate: formatSelector] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
