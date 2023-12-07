#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include <stdbool.h>


void extractstr(FILE *inputFile) {
    char str[100]; 

    while(fgets(str, sizeof(str), inputFile) != NULL) 
    {
        //printf("%s",str);
        
    }
}

int main() {
    FILE *inputFile = fopen("const.txt", "r"); 
    if (inputFile == NULL) {
        printf("Error opening the file.\n");
        return 1;
    }

    extractstr(inputFile);

    fclose(inputFile);
    return 0;
}

