%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "pivo.tab.h"

    void yyerror(const char *s);
%}

%option noyywrap

%%

"dejmi"          { return TOKEN_DEJMI; }
"hele"           { return TOKEN_HELE; }
"jinac"          { return TOKEN_JINAC; }
"jestejedno"     { return TOKEN_JESTEJEDNO; }
"kecni"          { return TOKEN_KECNI; }

"tojejasny"      { return TOKEN_AND; }
"nebojak"        { return TOKEN_OR; }
"nenekamo"       { return TOKEN_NOT; }

"=="             { return TOKEN_EQ; }
"!="             { return TOKEN_NEQ; }
">"              { return TOKEN_GT; }
">="             { return TOKEN_GTE; }
"<"              { return TOKEN_LT; }
"<="             { return TOKEN_LTE; }

"+"              { return TOKEN_PLUS; }
"-"              { return TOKEN_MINUS; }
"*"              { return TOKEN_MULTIPLY; }
"/"              { return TOKEN_DIVIDE; }
"!"              { return TOKEN_FACTORIAL; }

"("              { return TOKEN_LPAREN; }
")"              { return TOKEN_RPAREN; }
"{"              { return TOKEN_LBRACE; }
"}"              { return TOKEN_RBRACE; }
";"              { return TOKEN_SEMICOLON; }
"="              { return TOKEN_ASSIGN; }

[0-9]+           { yylval.ival = atoi(yytext); return TOKEN_NUMBER; }
0b[01]+          { yylval.ival = strtol(yytext+2, NULL, 2); return TOKEN_BINNUMBER; }
0x[0-9a-fA-F]+   { yylval.ival = strtol(yytext+2, NULL, 16); return TOKEN_HEXNUMBER; }

\"[^\"]*\"       { yylval.sval = strdup(yytext); return TOKEN_STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return TOKEN_IDENTIFIER; }

[ \t\r\n]+       { /* Ignorujeme mezery */ }
.                { printf("❌ Neznámý znak: %s\n", yytext); }

%%
