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

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
	return [super initWithNibName: nibName bundle: nibBundle] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
