/**
 * @file	MainController.m
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	tenKeyToSheet = [[TenKeyToSheet alloc] initWithTenKeyView: tenKeyView withSheetView: sheetView] ;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
