/*
    2b. Write a Lex Program to recognize whether a given sentence is simple or compound.
*/

%{
    #include <stdio.h>

    int flag = 0;
%}

space [ \t\n]
compound [([aA][nN][dD])|([bB][uU][tT])|([oO][rR])]

%%
[{space}+{compound}{space}+] { 
    flag = 1; 
}
. ;
\n {
    return 0;
}
%%

int yywrap(void) {
	return 1;
}

int main() {
	printf("Enter the sentence: \n");
	yylex();
	if(flag == 0)
		printf("The given sentence is a simple sentence.\n");
	else
		printf("The given sentence is a compound sentence.\n");
}