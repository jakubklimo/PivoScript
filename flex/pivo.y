%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int yylex();
    void yyerror(const char *s);

    void print_tree(const char *node) {
        printf("%s\n", node);
    }
%}

/* Definice datových typů */
%union {
    char *sval;
    int ival;
}

/* Tokeny */
%token TOKEN_DEJMI TOKEN_HELE TOKEN_JINAC TOKEN_JESTEJEDNO TOKEN_KECNI
%token TOKEN_AND TOKEN_OR TOKEN_NOT
%token TOKEN_EQ TOKEN_NEQ TOKEN_GT TOKEN_GTE TOKEN_LT TOKEN_LTE
%token TOKEN_PLUS TOKEN_MINUS TOKEN_MULTIPLY TOKEN_DIVIDE TOKEN_INTDIV TOKEN_FACTORIAL
%token TOKEN_LPAREN TOKEN_RPAREN TOKEN_LBRACE TOKEN_RBRACE TOKEN_SEMICOLON TOKEN_ASSIGN
%token <sval> TOKEN_IDENTIFIER TOKEN_STRING
%token <ival> TOKEN_NUMBER TOKEN_BINNUMBER TOKEN_HEXNUMBER

%type <sval> expression print_statement

/* ⚠ Přidání priority operátorů */
%left TOKEN_OR 
%left TOKEN_AND 
%left TOKEN_EQ TOKEN_NEQ
%left TOKEN_GT TOKEN_GTE TOKEN_LT TOKEN_LTE
%left TOKEN_PLUS TOKEN_MINUS
%left TOKEN_MULTIPLY TOKEN_DIVIDE TOKEN_INTDIV
%right TOKEN_NOT
%right TOKEN_FACTORIAL

%%

program:
    statements { print_tree("Program"); }
    ;

statements:
    statement statements
    | /* empty */
    ;

statement:
    variable_declaration
    | assignment
    | expression_statement
    | if_statement
    | loop
    | print_statement
    ;

variable_declaration:
    TOKEN_DEJMI TOKEN_IDENTIFIER TOKEN_ASSIGN expression TOKEN_SEMICOLON {
        print_tree("Proměnná");
        printf("  Název: %s\n", $2);
    }
    ;

assignment:
    TOKEN_IDENTIFIER TOKEN_ASSIGN expression TOKEN_SEMICOLON {
        print_tree("Přiřazení");
        printf("  Proměnná: %s\n", $1);
    }
    ;

expression_statement:
    expression TOKEN_SEMICOLON { print_tree("Výraz"); }
    ;

expression:
    expression TOKEN_PLUS expression { print_tree("Sčítání"); }
    | expression TOKEN_MINUS expression { print_tree("Odčítání"); }
    | expression TOKEN_MULTIPLY expression { print_tree("Násobení"); }
    | expression TOKEN_DIVIDE expression { print_tree("Dělení"); }
    | expression TOKEN_INTDIV expression { print_tree("Celé dělení"); }
    | expression TOKEN_GT expression { print_tree("Větší než"); }
    | expression TOKEN_GTE expression { print_tree("Větší nebo rovno"); }
    | expression TOKEN_LT expression { print_tree("Menší než"); }
    | expression TOKEN_LTE expression { print_tree("Menší nebo rovno"); }
    | expression TOKEN_EQ expression { print_tree("Rovnost"); }
    | expression TOKEN_NEQ expression { print_tree("Nerovnost"); }
    | expression TOKEN_AND expression { print_tree("Logické AND"); }
    | expression TOKEN_OR expression { print_tree("Logické OR"); }
    | TOKEN_NOT expression { print_tree("Logické NOT"); }
    | TOKEN_NUMBER { print_tree("Číslo"); printf("  Hodnota: %d\n", $1); }
    | TOKEN_BINNUMBER { print_tree("Číslo binární"); printf("  Hodnota: %d\n", $1); }
    | TOKEN_HEXNUMBER { print_tree("Číslo hexadecimální"); printf("  Hodnota: %d\n", $1); }
    | TOKEN_STRING { print_tree("Řetězec"); printf("  Hodnota: %s\n", $1); }
    | TOKEN_IDENTIFIER { print_tree("Identifikátor"); printf("  Název: %s\n", $1); }
    | TOKEN_LPAREN expression TOKEN_RPAREN { print_tree("Závorkový výraz"); }
    ;

print_statement:
    TOKEN_KECNI TOKEN_LPAREN expression TOKEN_RPAREN TOKEN_SEMICOLON {
        print_tree("Výpis");
        printf("  Hodnota: %s\n", $3);
    }
    ;

/* ⚠ Opravený if-else */
if_statement:
    TOKEN_HELE TOKEN_LPAREN expression TOKEN_RPAREN block %prec TOKEN_HELE {
        print_tree("Podmínka");
    }
    | TOKEN_HELE TOKEN_LPAREN expression TOKEN_RPAREN block TOKEN_JINAC block {
        print_tree("Podmínka s jinak");
    }
    ;

loop:
    TOKEN_JESTEJEDNO TOKEN_LPAREN TOKEN_IDENTIFIER TOKEN_ASSIGN expression TOKEN_SEMICOLON expression TOKEN_SEMICOLON TOKEN_IDENTIFIER TOKEN_ASSIGN expression TOKEN_RPAREN block {
        print_tree("Cyklus");
    }
    ;

block:
    TOKEN_LBRACE statements TOKEN_RBRACE { print_tree("Blok"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "❌ Chyba: %s\n", s);
}

int main() {
    printf("Spouštím parser...\n");
    return yyparse();
}
