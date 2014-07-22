/**
 * @file	PZMain.h
 * @brief	Define main function
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

#import "PZAppDelegate.h"
#import <KiwiCode/KiwiCode.h>

int main(int argc, char * argv[])
{
	@autoreleasepool {
		KCSetupFramework() ;
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([PZAppDelegate class]));
	}
}
