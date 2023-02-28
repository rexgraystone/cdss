/*
    2a. Write a Lex program to count the numbers of comment lines in a given C program. Also, eliminate them and copy the resulting program into separate file.
*/

%{ 
    #include <stdio.h> 
    int comCount=0; 
%}

%s comment

%%
"/*" {
    BEGIN comment;
}
<comment>"*/" {
    BEGIN 0;
    comCount++;
}
<comment>\n {
    comCount++;
}
<comment>. { 
    ;
}
"//".* {
    ; 
    comCount++;
}
.|\n {
    fprintf(yyout, "%s", yytext);
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
    fclose(yyin);
    fclose(yyout);
    return 0;
}