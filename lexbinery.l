%{
#include <stdio.h>
%}

digit       [0-1]
binary      {digit}+
%%
{binary}    printf("Input is a binary number\n");
.*01        printf("Binary number ending with '01' found: %s\n", yytext);
\n          /* Ignore newline character */
.           printf("Invalid input\n");
%%

int main() {
    yylex();
    return 0;
}
