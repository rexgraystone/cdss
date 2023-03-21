/*
    5. Write a YACC Program to recognize a valid variable which starts with a letter, followed by any number of letters or digits
*/

%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
[a-zA-Z_][a-zA-Z_0-9]* {
    return letter;
}
[0-9] {
    return digit;
}
. {
    return yytext[0];
}
\n {
    return 0;
}
%%

int yywrap(void) {
    return 1;
}
