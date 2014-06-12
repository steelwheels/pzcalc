/**
 * @file	PZTenKeyDelegate.h
 * @brief	Data source and delegate for collection view
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

typedef enum {
	PZDecTenKeyState,
	PZHexTenKeyState,
	PZFloatTenKeyState
} PZTenKeyState ;

@interface PZTenKeyDelegate : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) PZTenKeyState			tenKeyState ;

- (id) init ;

@end
