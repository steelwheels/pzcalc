/**
 * @file	KCExpressionSyntax.h
 * @brief	Define expression parser function
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <KiwiCode/KiwiCode.h>
#import "ExpressionLex.h"

KCExpression *
KCParseExpression(NSString * srcstr, NSArray ** errors) ;



