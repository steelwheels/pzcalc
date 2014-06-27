/**
 * @file	PZCalcField.m
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZCalcField.h"

static inline NSString *
insertStringToString(NSString * dst, NSInteger idx, NSString * src)
{
	return [NSString stringWithFormat: @"%@%@%@", [dst substringToIndex: idx], src, [dst substringFromIndex: idx]];
}

static inline NSInteger
currentCursorPosition(UITextField * inputField)
{
	UITextRange *	 selRange = inputField.selectedTextRange ;
        UITextPosition * selStartPos = selRange.start ;
        return [inputField offsetFromPosition: inputField.beginningOfDocument toPosition: selStartPos];
}

static void
insertStringToTextField(UITextField * field, NSString * str)
{
	NSInteger curpos = currentCursorPosition(field) ;
	NSString * newstr = insertStringToString(field.text, curpos, str) ;
	field.text = newstr ;
}

@implementation PZCalcField

- (void) setup
{
	self.resultLabel.text = @"" ;
	self.expressionField.text = @"" ;

	/* To suppress display keyboard, give dummy view
	 * See http://stackoverflow.com/questions/5615806/disable-uitextfield-keyboard
	 */
	UIView * dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
	self.expressionField.inputView = dummyView; // Hide keyboard, but show blinking cursor
}

- (void) activate
{
	[self.expressionField becomeFirstResponder] ;
}

- (void) pushTenKey: (NSString *) key
{
	insertStringToTextField(self.expressionField, key) ;
}

@end



#if 0
/*
 * reference: http://stackoverflow.com/questions/1500233/control-cursor-position-in-uitextfield
 */
static void
selectTextForInput(UITextField * inputfield, const NSRange * range)
{
	UITextPosition *start = [inputfield positionFromPosition:[inputfield beginningOfDocument]
							  offset:range->location];
	UITextPosition *end = [inputfield positionFromPosition:start
							offset:range->length];
	[inputfield setSelectedTextRange:[inputfield textRangeFromPosition:start toPosition:end]];
}
#endif

