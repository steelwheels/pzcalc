/**
 * @file	MainController.h
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <UIKit/UIKit.h>
#import <PzTenKeyView/PzTenKeyView.h>
#import <PzSheetView/PzSheetView.h>

@interface MainController : UIViewController

@property (weak, nonatomic) IBOutlet PzTenKeyView *tenKeyView;

@end

