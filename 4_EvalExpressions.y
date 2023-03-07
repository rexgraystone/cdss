/*
    4. Write a YACC program to evaluate arithmetic expressions involving operators +, -, *, /.
*/

%{
    #include<stdio.h>
    int flag = 0;
    void yyerror();
    int yylex();
%}
%token NUM

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
         printf("\nResult = %d\n",$$);
         return 0;
        }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUM {$$=$1;}
;
%%

int main() {
    printf("\nEnter Any Arithmetic Expression:\n");
    yyparse();
    if(flag == 0)
        printf("\nEntered arithmetic expression is Valid\n\n");
    return 0;
}

void yyerror(char *s) {
    printf("\n%s\n",s);
}