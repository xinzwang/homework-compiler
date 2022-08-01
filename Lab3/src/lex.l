%{
#include<stdio.h>
int words;  //词数
int lstart; //起始列
int lfinish;//终止列
int lines;  //行数
int rows;   //列数
int chars;  //字母数

%}

notes \/\*(.|\r\n)*\*\/|\/\/(.)*
keywords auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|tpyedef|union|unsigned|void|volatile|while
op \[|\]|\(|\)|\{|\}|\.|\-\>|\+\+|\-\-|&|\*|\+|\-|~|!|\/|%|\<\<|\>\>|\<|\>|\<=|\>=|==|!=|\^|\||&&|\|\||\?|:|;|\.\.\.|=|\*=|!=|\/=|%=|\+=|\-=|\<\<=|\>\>=|&=|\^=|\|=|,|#|##|\<:|\<%|%\>|%:|%:%:

identifier [_a-zA-Z][_a-zA-Z0-9]*

intconst (([0-9]+)|([0-7]+)|((0x|0X)[0-9a-fA-F]+))(((u|U)?(l|L|ll|LL)?)|((l|L|ll|LL)?(u|U)?))

floatconst ((([0-9]+\.[0-9]*)|([0-9]+\.[0-9]*(e|E)(\+|\-)?[0-9]+))|(0x|0X)([0-9a-fA-F]+(\.[0-9a-fA-F]*)?(p|P)(\+|\-)?[0-9]+))([fFlL])?

charconst [uUL]?'([^']|(\\[0-9]*)|\\\'|\\\"|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v)'

stringconst (u|u8|U|L)?\"([0-9a-zA-Z\.\!~']|(\\[0-9]*)|\\\'|\\\"|\\\?|\\a|\\b|\\f|\\n|\\r|\\t|\\v)*\"


%%

<<EOF>> {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,"<EOF>","EOF",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    return 0;
    }

\n {
    lines++;
    rows = 0;
    chars++;
    } 
\r {
    rows=0;
    chars++;
    }
; {
    lstart = chars;
    lfinish = chars;
    fprintf(yyout,"[@%d,%d:%d='%s',<'%s'>,%d:%d]\n",words,lstart,lfinish,yytext,";",lines,rows);
    words++;
    rows++;
    chars++;
}
[\ \t] {
    rows++;
    chars++;
    }

{notes} {
    rows+=strlen(yytext);
    chars+=strlen(yytext);
    }

{keywords} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<'%s'>,%d:%d]\n",words,lstart,lfinish,yytext,yytext,lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{op} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<'%s'>,%d:%d]\n",words,lstart,lfinish,yytext,yytext,lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{identifier} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,yytext,"Identifier",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{intconst} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,yytext,"IntegerConstant",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{floatconst} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,yytext,"FloatingConstant",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{charconst} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,yytext,"CharacterConstant",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }
{stringconst} {
    lstart = chars;
    lfinish = chars+ strlen(yytext)-1;
    fprintf(yyout,"[@%d,%d:%d='%s',<%s>,%d:%d]\n",words,lstart,lfinish,yytext,"StringLiteral",lines,rows);
    words++;
    rows +=strlen(yytext);
    chars += strlen(yytext);
    }

. {fprintf(yyout,"Not know: %d %s\n",yytext[0],yytext);}
%%

int main(int argc,char*argv[]){
    if(argc==2){
        if(!(yyin = fopen(argv[1],"r"))){
            perror(argv[1]);
            return 1;
        }
    }
    else if(argc==3){
        if(!(yyin = fopen(argv[1],"r"))){
            perror(argv[1]);
            return 1;
        }
        if(!(yyout = fopen(argv[2],"w"))){
            perror(argv[2]);
            return 1;
        }
    }
    words = 0;
    lstart = 0;
    lfinish = 0;
    lines = 1;
    rows = 0;
    chars = 0;
    yylex();
    printf("2. LexAnalyse finished! \(WXZ\)\n");
}