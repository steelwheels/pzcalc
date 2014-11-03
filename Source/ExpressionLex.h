/**
 * @file	KCExpressionLex.h
 * @brief	Define functions for lexical analyzer
 * @par Copyright
 *   Copyright (C) 2014 Steel Wheels Project
 */

#import <KiwiCode/KiwiCode.h>

typedef void *		kc_scanner_t ;
typedef void *		kc_parser_t ;

/** Additional parameter in the parser */
#define	YY_EXTRA_TYPE	kc_parser_t

/** Definition of parameters of sas_lex (yylex) function */
#define YYLEX_PARAM	yyscanner, yyparser

int kc_exp_lex_init(kc_scanner_t * scanner) ;

int kc_exp_lex(KCToken * param, kc_scanner_t scanner, kc_parser_t parser) ;

void kc_exp_set_extra (YY_EXTRA_TYPE user_defined , kc_scanner_t yyscanner) ;


