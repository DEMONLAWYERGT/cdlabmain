%{
#include <stdio.h>
#include <string.h>
%}

DIGIT [0-1]

%%

{DIGIT}+ {
    int isBinary = 1;
    int len = yyleng;
    for (int i = 0; i < len; i++) {
        if (yytext[i] != '0' && yytext[i] != '1') {
            isBinary = 0;
            break;
        }
    }
    if (isBinary) {
        printf("Input is a binary number: %s\n", yytext);
        if (len >= 2 && yytext[len - 2] == '0' && yytext[len - 1] == '1') {
            printf("Last two digits are 01.\n");
        } else {
            printf("Last two digits are not 01.\n");
        }
    } else {
        printf("Not a binary number: %s\n", yytext);
    }
}

.|\n {
    printf("Invalid input: %s\n", yytext);
}

%%

int main() {
    yylex();
    return 0;
}
