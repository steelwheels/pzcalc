/**
 * @file	PZViewController.m
 * @brief	PZViewController class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */


#import "PZViewController.h"

@interface PZViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *	tenKeyView;
@property (weak, nonatomic) IBOutlet UITableView *	calcSheetView ;

@end

@implementation PZViewController

@synthesize  tenKeyView ;

- (void) dealloc
{
	calcSheetDelegate = nil ;
	tenKeyDelegate = nil ;
}

- (void) viewDidLoad
{
	tenKeyDelegate = [[PZTenKeyDelegate alloc] initWithController: self] ;
	self.tenKeyView.delegate = tenKeyDelegate ;
	self.tenKeyView.dataSource = tenKeyDelegate ;
	
	calcSheetDelegate = [[PZCalcSheetDelegate alloc] init] ;
	self.calcSheetView.delegate = calcSheetDelegate ;
	self.calcSheetView.dataSource = calcSheetDelegate ;
	
	[super viewDidLoad];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushTenKey: (NSString *) key
{
	[calcSheetDelegate pushTenKey: key] ;
}

@end
