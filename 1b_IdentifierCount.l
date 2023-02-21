/*
    1b. Write a Lex Program to recognize and count the number of identifiers in a file.
*/

%{ 
    #include <stdio.h> 
    
    int idCount=0; 
%}
letter [a-zA-Z] 
digit [0-9] 
%% 
{letter}({letter}|{digit})* {
    idCount++;
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("lex.yy.c", "r");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    } else {
        yylex();
        printf("\nTotal number of identifiers: %d\n", idCount);
    }
    return 0;
}
