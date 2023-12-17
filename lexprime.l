%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
%}

DIGIT  [0-9]
NUMBER {DIGIT}+
%%
{NUMBER}    {
    int num = atoi(yytext);
    if (isPrime(num)) {
        printf("%d is a prime number.\n", num);
    } else {
        printf("%d is not a prime number.\n", num);
    }
}

%%

bool isPrime(int n) {
    if (n <= 1) {
        return false;
    }
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
