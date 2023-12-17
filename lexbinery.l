%{
#include <stdio.h>
%}

DIGIT  [0-1]
BINARY {DIGIT}+
%%
{BINARY} { printf("%s01\n", yytext); }
.|\n    { printf("Not a binary number.\n"); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
