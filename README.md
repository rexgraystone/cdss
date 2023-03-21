# Compiler Design and System Software Lab

This repository contains all the C, Lex, and Yacc programs that I have executed for my CDSS Course in my 3rd Year of Computer Science Undergrad program at Dayananda Sagar University, Bengaluru, India in Q1-Q2 2023.

## List of Programs

| Serial No. | File Name | Description |
| :---: | :--- | :--- |
| 1a | [1a_CharCount.l](https://github.com/rexgraystone/cdss/blob/main/1a_CharCount.l) | A Lex program that count the number of characters, spaces, words and lines in a given text file. |
| 1b | [1b_IdentifierCount.l](https://github.com/rexgraystone/cdss/blob/main/1b_IdentifierCount.l) | A Lex program that count the number of identifiers in a given program file. |
| 2a | [2a_CommentCount.l](https://github.com/rexgraystone/cdss/blob/main/2a_CommentCount.l) | A Lex program that counts the number of comments in a given program file. It also removes the comments and stores the remaining text into a new file. |
| 2b | [2b_Sentences.l](https://github.com/rexgraystone/cdss/blob/main/2b_Sentences.l) | A Lex program that recognizes whether a given sentence is simple or compound. |
| 3a | [3a_IntFloatCount.l](https://github.com/rexgraystone/cdss/blob/main/3a_IntFloatCount.l) | A Lex program that counts the number of integers and fractions in a given file. |
| 3b | [3b_PrintfCountl](https://github.com/rexgraystone/cdss/blob/main/3b_PrintfCount.l) | A Lex program that counts the number of 'scanf' and 'printf' statements, and replaces them with 'readf' and 'writef' respectively. |
| 4 | [4_EvalExpressions.l](https://github.com/rexgraystone/cdss/blob/main/4_EvalExpressions.l) [4_EvalExpression.y](https://github.com/rexgraystone/cdss/blob/main/4_EvalExpressions.y) | A Yacc program that evaluates the given arithmetic expressions. |

## How to Run

1. Ensure that you have a C compiler installed on your system.

    ```bash
    gcc --version
    ```

    It should look something like this ![GCC Version](Images/GCC_Version.png "GCC Version")

    If you don't have a C compiler installed, you can download one from [here](https://sourceforge.net/projects/mingw/) or using your package manager.

    Examples:

    - Ubuntu -

    ```bash
    sudo apt install gcc
    ```

    - Arch Linux -

    ```bash
    sudo pacman -S gcc
    ```

    - macOS -

    ```bash
    brew install gcc
    ```

    Additionaly, if you are using Windows, follow the steps specified [here](https://www.scaler.com/topics/c/c-compiler-for-windows/).

2. Clone the repository using the following command:

    ``` bash
    gh repo clone rexgraystone/cdss
    ```

    or

    ``` bash
    git clone https://github.com/rexgraystone/cdss.git
    ```

3. Change the directory to the cloned repository:

    ``` bash
    cd cdss
    ```

**For Lex programs:**

1. Compile the Lex program using the following command:

    ``` bash
    lex <filename>.l
    ```

    Example:

    ``` bash
    lex 1a_CharCount.l
    ```

2. Compile the generated C file using the following command:

    ``` bash
    gcc lex.yy.c -ll -o <Output File Name>
    ```

3. Run the program using the following command:

    ``` bash
    ./<Output File Name>
    ```

**For YACC programs:**

1. Compile the YACC program using the following command:

    ``` bash
    yacc -d <filename>.y
    ```

    Example:

    ``` bash
    yacc -d 4_EvalExpressions.y
    ```

2. Compile the Lex program using the following command:

    ``` bash
    lex <filename>.l
    ```

    Example:

    ``` bash
    lex 4_EvalExpressions.l
    ```

3. Compile the generated C file using the following command:

    ``` bash
    gcc lex.yy.c y.tab.c -ll -ly -o <Output File Name>
    ```