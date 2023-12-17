%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int isPrime(int num) {
    if (num <= 1) return 0;
    if (num <= 3) return 1;
    if (num % 2 == 0 || num % 3 == 0) return 0;
    for (int i = 5; i * i <= num; i += 6) {
        if (num % i == 0 || num % (i + 2) == 0) return 0;
    }
    return 1;
}
%}

%%
[0-9]+ {
    int number = atoi(yytext);
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }
}
.|\n
%%

int main() {
    yylex();
    return 0;
}
