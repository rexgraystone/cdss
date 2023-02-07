/*
    1a. Write a C Program to count the number of characters, words, spaces and lines in a given input file.
*/

#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *filePointer;
    char ch;
    int charCount = 0, wordCount = 0, spaceCount = 0, lineCount = 0;
    filePointer = fopen("test.txt", "r");
    if (filePointer == NULL) {
        printf("File does not exist.");
    }
    else {
        while ((ch = fgetc(filePointer)) != EOF) {
            charCount++;
            if (ch == ' ' || ch == '\t' || ch == '\n' || ch == '\0') {
                spaceCount++;
            }
            if (ch == '\n' || ch == '\0') {
                lineCount++;
            }
        }
        wordCount = spaceCount + 1;
        printf("Number of characters: %d", charCount);
        printf("\nNumber of words: %d", wordCount);
        printf("\nNumber of spaces: %d", spaceCount);
        printf("\nNumber of lines: %d\n", lineCount);
    }
    fclose(filePointer);
    return 0;
}

 