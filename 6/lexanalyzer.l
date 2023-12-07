%{
#include<stdio.h>
#include<string.h>
char key[100][100],head[100][100],dig[100][100],op[100][100],id[100][100];
int i=0,j=0,k=0,l=0,a=0,b=0,c=0,d=0,m=0,n=0;
%}
KW "int"|"while"|"if"|"else"|"for"|"char"|"float"|"case"|"switch"
HF "#include<".*">"
OP "+"|"-"|"*"|"/"|"="
DIG [0-9]*|[0-9]*"."[0-9]+
ID [a-zA-Z][a-zA-Z0-9]*
%%
{KW} {strcpy(key[i],yytext);i++;}
{HF} {strcpy(head[j],yytext);j++;}
{DIG} {strcpy(dig[k],yytext);k++;}
{OP} {strcpy(op[m],yytext);m++;}
{ID} {strcpy(id[n],yytext);n++;}
. {}
%%
int main()
{
 yyin=fopen("intputlex.c","r+");
 yylex();
 printf("\nThe keywords are");
 for(a=0;a<i;a++)
 {
  printf("\n%s",key[a]);
 }
 printf("\nThe headerfiles are ");
 for (b=0;b<j;b++)
 {
  printf("\n%s",head[b]);
 }
 printf("\nThe digits are");
 for(c=0;c<k;c++)
 {
  printf("\n%s",dig[c]);
 }
 printf("\noperators ...");
 for (d=0;d<m;d++)
 {
  printf("\n%s",op[d]);
 }
 printf("\nidentifiers....");
 for(d=0;d<n;d++)
 {
  printf("\n%s",id[d]);
 }
}
int yywrap()
{
return 1;
}
