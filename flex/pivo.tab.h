/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TOKEN_DEJMI = 258,
     TOKEN_HELE = 259,
     TOKEN_JINAC = 260,
     TOKEN_JESTEJEDNO = 261,
     TOKEN_KECNI = 262,
     TOKEN_AND = 263,
     TOKEN_OR = 264,
     TOKEN_NOT = 265,
     TOKEN_EQ = 266,
     TOKEN_NEQ = 267,
     TOKEN_GT = 268,
     TOKEN_GTE = 269,
     TOKEN_LT = 270,
     TOKEN_LTE = 271,
     TOKEN_PLUS = 272,
     TOKEN_MINUS = 273,
     TOKEN_MULTIPLY = 274,
     TOKEN_DIVIDE = 275,
     TOKEN_INTDIV = 276,
     TOKEN_FACTORIAL = 277,
     TOKEN_LPAREN = 278,
     TOKEN_RPAREN = 279,
     TOKEN_LBRACE = 280,
     TOKEN_RBRACE = 281,
     TOKEN_SEMICOLON = 282,
     TOKEN_ASSIGN = 283,
     TOKEN_IDENTIFIER = 284,
     TOKEN_STRING = 285,
     TOKEN_NUMBER = 286,
     TOKEN_BINNUMBER = 287,
     TOKEN_HEXNUMBER = 288
   };
#endif
/* Tokens.  */
#define TOKEN_DEJMI 258
#define TOKEN_HELE 259
#define TOKEN_JINAC 260
#define TOKEN_JESTEJEDNO 261
#define TOKEN_KECNI 262
#define TOKEN_AND 263
#define TOKEN_OR 264
#define TOKEN_NOT 265
#define TOKEN_EQ 266
#define TOKEN_NEQ 267
#define TOKEN_GT 268
#define TOKEN_GTE 269
#define TOKEN_LT 270
#define TOKEN_LTE 271
#define TOKEN_PLUS 272
#define TOKEN_MINUS 273
#define TOKEN_MULTIPLY 274
#define TOKEN_DIVIDE 275
#define TOKEN_INTDIV 276
#define TOKEN_FACTORIAL 277
#define TOKEN_LPAREN 278
#define TOKEN_RPAREN 279
#define TOKEN_LBRACE 280
#define TOKEN_RBRACE 281
#define TOKEN_SEMICOLON 282
#define TOKEN_ASSIGN 283
#define TOKEN_IDENTIFIER 284
#define TOKEN_STRING 285
#define TOKEN_NUMBER 286
#define TOKEN_BINNUMBER 287
#define TOKEN_HEXNUMBER 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "pivo.y"
{
    char *sval;
    int ival;
}
/* Line 1529 of yacc.c.  */
#line 120 "pivo.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

