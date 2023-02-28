/*
    3b. Write a Lex program to count the number of 'scanf' and 'printf' statements. 
    Replace them with 'readf' and 'writef' respectively.
*/

%{
    #include <stdio.h>
    int scanfCount = 0, printfCount = 0;
%}

%%
"scanf" {
    scanfCount++;
    fprintf(yyout, "readf");
}
"printf" {
    printfCount++;
    fprintf(yyout, "writef");
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    if(yyin == NULL) {
        printf("File does not exist.\n");
    } else {
        yylex();
        printf("Total number of \'scanf\' statements: %d\n", scanfCount);
        printf("Total number of \'printf\' statements: %d\n", printfCount);
    }
    fclose(yyin);
    fclose(yyout);
    return 0;
}