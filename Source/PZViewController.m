/**
 * @file	PZViewController.m
 * @brief	PZViewController class
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */


#import "PZViewController.h"

@interface PZViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *tenKeyView;

@end

@implementation PZViewController

@synthesize  tenKeyView ;

- (void) dealloc
{
	tenKeyDelegate = nil ;
}

- (void) viewDidLoad
{
	tenKeyDelegate = [[PZTenKeyDelegate alloc] init] ;
	tenKeyView.delegate = tenKeyDelegate ;
	tenKeyView.dataSource = tenKeyDelegate ;
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
