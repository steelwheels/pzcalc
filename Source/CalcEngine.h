/**
 * @file	CalcEngine.h
 * @brief	Define MainController class
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <Foundation/Foundation.h>
#import <KiwiCode/KiwiCode.h>

@protocol CalcEngineOutputDelegate
- (void) outputResultString: (NSString *) str atIndex: (NSUInteger) index ;
@end

@interface CalcEngine : NSObject
{
	/** The member is CalcItem. It is defined in CalcEngine.m */
	NSMutableArray *	calcItemArray ;
}

@property (strong, nonatomic) id <CalcEngineOutputDelegate>		outputDelegate ;

- (instancetype) initWithItemCount: (NSUInteger) count ;
- (void) putExpressionString: (NSString *) str atIndex: (NSUInteger) index ;
- (void) redrawResultValue: (NSUInteger) index ;

  /**
   * @brief Get resilt value in the calc item
   * @retval val Result value
   * @retval nil No result value
   * @param index Index in the array of calc items
   */
- (KCValue *) resultValueAtIndex: (NSUInteger) index ;
- (BOOL) updateResultValueFormat: (KCValueFormat) format atIndex: (NSUInteger) index ;

@end
