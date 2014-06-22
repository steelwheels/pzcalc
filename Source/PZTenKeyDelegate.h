/**
 * @file	PZTenKeyDelegate.h
 * @brief	Data source and delegate for ten key view
 * @par Copyright
 *   Copyright (C) 2011 Steel Wheels Project
 */

#import <UIKit/UIKit.h>

typedef enum {
	PZDecTenKeyState		= 0,
	PZHexTenKeyState		= 1,
	PZFloatTenKeyState		= 2,
	PZFuncTenKeyState		= 3
} PZTenKeyState ;

@interface PZTenKeyDelegate : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) PZTenKeyState			tenKeyState ;
@property (nonatomic) NSMutableArray *			buttonArray ;

- (id) init ;

@end
