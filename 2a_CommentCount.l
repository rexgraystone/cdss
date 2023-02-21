/*
    2a. Write a Lex count the numbers of comment lines in a given C program. Also, eliminate them and copy the resulting program into separate file.
*/

%{ 
    #include <stdio.h> 
    int comCount=0; 
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {
    comCount++;
}
"//"[a-zA-Z0-9\n\t ]*"\n"   {
    comCount++;
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    } else {
        yylex();
        printf("Total number of comments: %d\n", comCount);
    }
    return 0;
}