%{
#include <stdio.h>
#include <string.h>

#define YYSTYPE int 

extern FILE *yyin;

static int returnVal;

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
	return 1;
}

void write_asm()
{
    FILE *out = fopen("assemblyFIle.s", "w");

    //writing out the assembly file manually for our simple program.
    //Only for learning purposes. In reality we have to create an AST and traverse it.
    fprintf(out, "	.section	__TEXT,__text,regular,pure_instructions\n");
    fprintf(out, "    .global _main\n\n");
    fprintf(out, "_main:\n");
    fprintf(out, "	.cfi_startproc\n");
    fprintf(out, "    ## %%bb.0:\n");
    fprintf(out, "    pushl    %%ebp\n");
    fprintf(out, "    .cfi_def_cfa_offset 8\n");
    fprintf(out, "    .cfi_offset %%ebp, -8\n");
    fprintf(out, "    movl    %%esp, %%ebp\n");
    fprintf(out, "    .cfi_def_cfa_register %%ebp\n");
    fprintf(out, "    pushl    %%eax\n");
    fprintf(out, "    movl    $0, -4(%%ebp)\n");
    fprintf(out, "    movl    $%d, %%eax\n", returnVal);
    fprintf(out, "    addl    $4, %%esp\n");
    fprintf(out, "    popl    %%ebp\n");
    fprintf(out, "    retl\n");
    fprintf(out, "    .cfi_endproc\n");

    fclose(out);

}

int main(int argc , char *argv[])
{
    ++argv, --argc;
    
    if(argc > 0) {
        yyin = fopen(argv[0], "r");     //input is our simple program
    } 
    else {
        yyin = stdin;
    }    
    
    yyparse();

    write_asm();

    return 0;
}

%}


%start   function
%token   INTEGER
%token   RETURN
%token   IDENTIFIER
%token   TYPE

%%

function    :       TYPE IDENTIFIER '(' ')' '{' statement '}'
            ;
statement   :       RETURN INTEGER ';'
                    { returnVal = $2; }
            ;

