%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

%}

extern YYSTYPE yylval

%%
"("                           {return '(';}
")"                           {return ')';}
"{"                           {return '{';}
"}"                           {return '}';}
";"                           {return ';';}
[0-9]+                        {yylval = atoi(yytext); return INTEGER;}
"int"                         {return TYPE;}
"return"                      {return RETURN;}
[a-zA-Z][_a-zA-Z0-9]*         {return IDENTIFIER;}
[ \t\n]                       {;}
.                             {printf("unexpected character\n");}
%%
