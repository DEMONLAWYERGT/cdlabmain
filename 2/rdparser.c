//Recursive descend parser
#include <stdio.h>  
#include <string.h>  
#define SUCCESS 1  
#define FAILED 0  
int E(), Edash(), T(), Tdash(), F();  
const char *cursor;  
char string[64];  
      
int main()  
{  
  printf("Enter the string to parse (model 'i+(i+i)*i'):\n");  
  scanf("%s", string);    
  cursor = string;   
  printf("Input   Action\n");  
  printf("--------------------------------\n");  
      
  if (E() && *cursor == '\0') 
  {  
    printf("--------------------------------\n");  
    printf("String is successfully parsed\n");  
    return 0;  
  }
  else
  {  
    printf("--------------------------------\n");  
    printf("Error in parsing String\n");  
    return 1;  
  }  
}  
      
int E()  
{  
  printf("%s \tE -> TE'\n", cursor);  
  if (T()) 
  {  
    if (Edash())  
       return SUCCESS;  
    else  
       return FAILED;  
  }
  else  
       return FAILED;  
    
}  
      
int Edash()  
{  
  if (*cursor == '+') 
  {  
     printf("%s \tE' -> +TE'\n", cursor);  
     cursor++;  
     if (T()) 
     {  
      if (Edash())  
         return SUCCESS;  
      else  
         return FAILED;  
     }
     else  
         return FAILED;  
  }
  else 
  {  
     printf("%s \tE' -> $\n", cursor);  
     return SUCCESS;  
  }  
}  
      
int T()  
{  
  printf("%s \tT -> FT'\n", cursor);  
  if (F()) 
  {  
    if (Tdash())  
       return SUCCESS;  
    else  
       return FAILED;  
  }
  else  
       return FAILED;  
}  
      
int Tdash()  
{  
  if (*cursor == '*') 
  {  
      printf("%s \tT' -> *FT'\n", cursor);  
      cursor++;  
      if (F()) 
      {  
         if (Tdash())  
            return SUCCESS;  
         else  
            return FAILED;  
      }
      else  
         return FAILED;  
  } 
  else 
  {  
    printf("%s \tT' -> $\n", cursor);  
    return SUCCESS;  
  }
    
}  
      
int F()  
{  
  if (*cursor == '(') 
  {  
    printf("%s \tF -> ( E )\n", cursor);  
    cursor++;  
    if (E()) 
    {  
       if (*cursor == ')') 
       {  
          cursor++;  
          return SUCCESS;  
       } 
       else  
          return FAILED;  
    } 
    else  
        return FAILED;  
  } 
  else if (*cursor == 'i') 
  {  
    cursor++;  
    printf("%s \tF -> i\n", cursor);  
    return SUCCESS;  
  } 
  else  
    return FAILED;  

}  
