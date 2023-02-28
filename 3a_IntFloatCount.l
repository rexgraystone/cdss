/*
    3a. Write a lex program to count the number of positive and negative integers and floats.
*/

%{
    #include <stdio.h>
    int posInt = 0, negInt = 0, posFloat = 0, negFloat = 0;
%}

digit [0-9] 

%%
^-({digit})+ {
    negInt++;
}
({digit})+ {
    posInt++;
}
^-({digit})*[.]({digit})+ {
    negFloat++;
}
({digit})*[.]({digit})+ {
    posFloat++;
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("numbers.txt", "r");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    } else {
        yylex();
        printf("\nPositive integers = %d\nNegative integers = %d\nPositive floats = %d\nNegative floats = %d\n", posInt, negInt, posFloat, negFloat);
    }
    return 0;
}