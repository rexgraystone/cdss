/*
    1b. Write a Lex Program to recognize and count the number of identifiers in a file.
*/

%{ #include<stdio.h> 
    int idCount=0; 
%} op [+-*/] 
letter [a-zA-Z] 
digitt [0-9] 
id {letter}*|({letter}{digitt})+ 
notid ({digitt}{letter})+ 
%% 
[\t\n]+ 
("int")|("float")|("char")|("case")|("default")|("if")|("for")|("printf")|("scanf")|("NULL")|("return") {
    printf("%s is a keyword\n", yytext);
} 
{id} {
    printf("%s is an identifier\n", yytext); 
    idCount++;
} 
{notid} {
    printf("%s is not an identifier\n", yytext);
}
[/{*}{letter}*|/*]+ { ;} 
%%


int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("1b_IdentifierCount.l", "r");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    }
    else {
        yylex();
        printf("\nTotal number of identifiers: %d\n", idCount);
    }
    return 0;
}
