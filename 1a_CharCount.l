/*
    1a. Write a C Program to count the number of characters, words, spaces and lines in a given input file.
*/

%{
    #include <stdio.h>
    #include <stdlib.h>

    int charCount = 0, wordCount = 0, spaceCount = 0, lineCount = 0;
%}

%%
[\n\0]+  { 
            lineCount++; 
            charCount+=yyleng;
}
[  \t]  { 
            spaceCount++; 
            charCount+=yyleng;
}
[^\t\n ]+   { 
                wordCount++;  
                charCount+=yyleng;
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    char ch;
    yyin = fopen("test.txt", "r");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    }
    else {
        yylex();
        printf("Number of characters: %d", charCount);
        printf("\nNumber of words: %d", wordCount);
        printf("\nNumber of spaces: %d", spaceCount);
        printf("\nNumber of lines: %d\n", lineCount);
    }
    fclose(yyin);
    return 0;
}

 