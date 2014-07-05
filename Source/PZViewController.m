/**
 * @file	PZViewController.m
 * @brief	PZViewController class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */


#import "PZViewController.h"
#import "PZEngine.h"

@interface PZViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *	tenKeyView;
@property (weak, nonatomic) IBOutlet UITableView *	calcSheetView ;

@end

@implementation PZViewController

@synthesize  tenKeyView ;

- (void) dealloc
{
	calcEngine = nil ;
	calcSheetDelegate = nil ;
	tenKeyDelegate = nil ;
}

- (void) viewDidLoad
{
	calcEngine = [[PZEngine alloc] init] ;
	
	tenKeyDelegate = [[PZTenKeyDelegate alloc] initWithController: self] ;
	self.tenKeyView.delegate = tenKeyDelegate ;
	self.tenKeyView.dataSource = tenKeyDelegate ;
	
	calcSheetDelegate = [[PZCalcSheetDelegate alloc] init] ;
	self.calcSheetView.delegate = calcSheetDelegate ;
	self.calcSheetView.dataSource = calcSheetDelegate ;
	
	[calcSheetDelegate linkWithResultTable: calcEngine.resultTable] ;
	
	[super viewDidLoad];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushTenKey: (PZKeyCode) code
{
	if([calcSheetDelegate pushTenKey: code]){
		NSUInteger	index = [calcSheetDelegate activeFieldIndex] ;
		NSString *	text  = [calcSheetDelegate activeFieldText] ;
		[calcEngine setSourceText: text atIndex: index] ;
	}
}

@end
