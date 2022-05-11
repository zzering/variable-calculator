%{
#include "y.tab.h"
#include "sym.h"
%}

%%
([0-9]+|([0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?) {
    yylval.dval = atof(yytext);
    return NUMBER;
    }

[ \t] ; /* ignore whitespace */

[A-Za-z][A-Za-z0-9]* {
    /* return symbol pointer */
    symtablegen();
    yylval.symptr = sym_lookup(yytext);
    return NAME;
    }

"showvar\n" { 
        symtablegen();
        printsymbols(); }

"$" { return 0; }

. return yytext[0];
\n return yytext[0];

%%

int yywrap() { return 1; }
