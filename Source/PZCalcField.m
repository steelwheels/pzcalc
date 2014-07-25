/**
 * @file	PZCalcField.m
 * @brief	Cell on the calc sheet
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import "PZCalcField.h"
#import "PZCalcSheetDelegate.h"

/*
 * @par reference
 * http://glayash.blogspot.jp/2012/08/uitextfielduitextrageuitextposition.html
 */
static inline void
moveForward(UITextField * field)
{
	UITextRange *currange = field.selectedTextRange;
        if([currange.start isEqual: field.endOfDocument]){
                return;
        }
	
        UITextPosition *newpos = [field positionFromPosition: currange.start offset:+1];
	
        UITextRange *newrange;
        if([currange isEmpty]){
                newrange = [field textRangeFromPosition: newpos
                                             toPosition: newpos];
        } else {
                newrange = [field textRangeFromPosition: newpos
                                             toPosition: currange.end];
        }
        field.selectedTextRange = newrange;
}

static inline void
moveBackword(UITextField * field)
{
	UITextRange *currange = field.selectedTextRange;
        if([currange.start isEqual: field.beginningOfDocument]){
                return;
        }
	
        UITextPosition *newpos = [field positionFromPosition: currange.start offset:-1];
	
        UITextRange *newrange;
        if([currange isEmpty]){
                newrange = [field textRangeFromPosition: newpos
                                             toPosition: newpos];
        } else {
                newrange = [field textRangeFromPosition: newpos
                                             toPosition: currange.end];
        }
        field.selectedTextRange = newrange;
}

static inline void
insertStringToTextField(UITextField * field, NSString * str)
{
	[field insertText: str] ;
}

static void
deleteCharAtCurrentPosition(UITextField * inputfield)
{
	UITextRange *		selrange = inputfield.selectedTextRange ;
	if(selrange.empty){
		/* delete previous character */
		[inputfield deleteBackward] ;
	} else {
		/* change the ca */
		UITextPosition * pos = selrange.start ;
		UITextRange * newrange = [inputfield textRangeFromPosition: pos toPosition: pos] ;
		[inputfield setSelectedTextRange: newrange] ;
	}
}

static inline void
clearStringInTextField(UITextField * field)
{
	field.text = @"" ;
}

@implementation PZCalcField

- (void) setup: (PZCalcSheetDelegate *) parent
{
	self.resultLabel.text = @"" ;
	self.expressionField.text = @"" ;

	/* To suppress display keyboard, give dummy view
	 * See http://stackoverflow.com/questions/5615806/disable-uitextfield-keyboard
	 */
	UIView * dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
	self.expressionField.inputView = dummyView; // Hide keyboard, but show blinking cursor
	
	/*
	 * Set delegate for text editing
	 */
	[self.expressionField setDelegate: parent] ;
}

- (void) activate
{
	[self.expressionField becomeFirstResponder] ;
}

- (BOOL) pushTenKey: (PZKeyCode) code
{
	BOOL	edited = true ;
	
	UITextField * infield = self.expressionField ;
	switch(code){
		case PZNopKey:
		case PZDecStateKey:
		case PZHexStateKey:
		case PZOpStateKey:
		case PZFuncStateKey: {
			/* nothing have to do */
		} break ;
		case PZClearKey: {
			clearStringInTextField(infield) ;
		} break ;
		case PZMovLeftKey: {
			moveBackword(infield) ;
			edited = false ;
		} break ;
		case PZMovRightKey: {
			moveForward(infield) ;
			edited = false ;
		} break ;
		case PZRetKey: {
			edited = false ;
		} break ;
		case PZDelKey: {
			deleteCharAtCurrentPosition(infield) ;
		} break ;
		case PZAddKey: {
			insertStringToTextField(infield, @"+") ;
		} break ;
		case PZSubKey: {
			insertStringToTextField(infield, @"-") ;
		} break ;
		case PZMulKey: {
			insertStringToTextField(infield, @"*") ;
		} break ;
		case PZDivKey: {
			insertStringToTextField(infield, @"/") ;
		} break ;
		case PZModKey: {
			insertStringToTextField(infield, @"%") ;
		} break ;
		case PZLessKey: {
			insertStringToTextField(infield, @"<") ;
		} break ;
		case PZGreaterKey: {
			insertStringToTextField(infield, @">") ;
		} break ;
		case PZEqualKey: {
			insertStringToTextField(infield, @"=") ;
		} break ;
		case PZNotKey: {
			insertStringToTextField(infield, @"!") ;
		} break ;
		case PZLeftParKey: {
			insertStringToTextField(infield, @"(") ;
		} break ;
		case PZRightParKey: {
			insertStringToTextField(infield, @")") ;
		} break ;
		case PZ0Key: {
			insertStringToTextField(infield, @"0") ;
		} break ;
		case PZ1Key: {
			insertStringToTextField(infield, @"1") ;
		} break ;
		case PZ2Key: {
			insertStringToTextField(infield, @"2") ;
		} break ;
		case PZ3Key: {
			insertStringToTextField(infield, @"3") ;
		} break ;
		case PZ4Key: {
			insertStringToTextField(infield, @"4") ;
		} break ;
		case PZ5Key: {
			insertStringToTextField(infield, @"5") ;
		} break ;
		case PZ6Key: {
			insertStringToTextField(infield, @"6") ;
		} break ;
		case PZ7Key: {
			insertStringToTextField(infield, @"7") ;
		} break ;
		case PZ8Key: {
			insertStringToTextField(infield, @"8") ;
		} break ;
		case PZ9Key: {
			insertStringToTextField(infield, @"9") ;
		} break ;
		case PZAKey: {
			insertStringToTextField(infield, @"A") ;
		} break ;
		case PZBKey: {
			insertStringToTextField(infield, @"B") ;
		} break ;
		case PZCKey: {
			insertStringToTextField(infield, @"C") ;
		} break ;
		case PZDKey: {
			insertStringToTextField(infield, @"D") ;
		} break ;
		case PZEKey: {
			insertStringToTextField(infield, @"E") ;
		} break ;
		case PZFKey: {
			insertStringToTextField(infield, @"F") ;
		} break ;
		case PZDotKey: {
			insertStringToTextField(infield, @".") ;
		} break ;
		case PZ0XKey: {
			insertStringToTextField(infield, @"0x") ;
		} break ;
	}
	return edited ;
}

- (void) setResultValue: (KCValue *) value
{
	NSString * str = [value toString] ;
	self.resultLabel.text = str ;
}

@end




