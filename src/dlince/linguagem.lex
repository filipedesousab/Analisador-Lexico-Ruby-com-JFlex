package dlince;

%%

%public
%class Analisador
%unicode
%line
%column
%type TokenRuby

%{
	StringBuffer string = new StringBuffer();
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

Identificador = [a-zA-Z_] [a-zA-Z0-9_]*
IdentificadorMetodo = [a-zA-Z_] [a-zA-Z0-9_]*("!"|"?")?
Digito = [0-9]
Inteiro = {Digito}+("_"{Digito}+)*
Decimal = {Digito}+"."{Digito}+|"."{Digito}+|{Digito}+"."
DecOrInt = {Decimal}|{Inteiro}

%state STRING
%state CHAR

%%

<YYINITIAL> {
/* SIMBOLOS */
"+="						{ return new TokenRuby("PLUSEQ", yytext(), yyline, yycolumn); }
"-="						{ return new TokenRuby("SUBEQ", yytext(), yyline, yycolumn); }
"*="						{ return new TokenRuby("MULTEQ", yytext(), yyline, yycolumn); }
"/="						{ return new TokenRuby("DIVEQ", yytext(), yyline, yycolumn); }
"%="						{ return new TokenRuby("MODEQ", yytext(), yyline, yycolumn); }
"**="						{ return new TokenRuby("EXPEQ", yytext(), yyline, yycolumn); }
"**"						{ return new TokenRuby("EXP", yytext(), yyline, yycolumn); }
"=~"						{ return new TokenRuby("CORRESP", yytext(), yyline, yycolumn); }
"==="						{ return new TokenRuby("EQEQEQ", yytext(), yyline, yycolumn); }
"=="						{ return new TokenRuby("EQEQ", yytext(), yyline, yycolumn); }
"^="						{ return new TokenRuby("BITXOREQ", yytext(), yyline, yycolumn); }
"||="						{ return new TokenRuby("ORBOOLEQ", yytext(), yyline, yycolumn); }
"|="						{ return new TokenRuby("OREQ", yytext(), yyline, yycolumn); }
"!="						{ return new TokenRuby("DIFERENTE", yytext(), yyline, yycolumn); }
"<=>"						{ return new TokenRuby("COMPCOMB", yytext(), yyline, yycolumn); }
"<<="						{ return new TokenRuby("SHIFTLEQ", yytext(), yyline, yycolumn); }
">>="						{ return new TokenRuby("SHIFTREQ", yytext(), yyline, yycolumn); }
">="						{ return new TokenRuby("MAIOREQ", yytext(), yyline, yycolumn); }
"<="						{ return new TokenRuby("MENOREQ", yytext(), yyline, yycolumn); }
"<<"						{ return new TokenRuby("SHIFTL", yytext(), yyline, yycolumn); }
">>"						{ return new TokenRuby("SHIFTR", yytext(), yyline, yycolumn); }
"="							{ return new TokenRuby("EQ", yytext(), yyline, yycolumn); }
"+"							{ return new TokenRuby("PLUS", yytext(), yyline, yycolumn); }
"-"							{ return new TokenRuby("SUB", yytext(), yyline, yycolumn); }
"*"							{ return new TokenRuby("MULT", yytext(), yyline, yycolumn); }
"/"							{ return new TokenRuby("DIV", yytext(), yyline, yycolumn); }
"%"							{ return new TokenRuby("MOD", yytext(), yyline, yycolumn); }
"["							{ return new TokenRuby("COLCHETE", yytext(), yyline, yycolumn); }
"]"							{ return new TokenRuby("COLCHETE2", yytext(), yyline, yycolumn); }
"{"							{ return new TokenRuby("CHAVE", yytext(), yyline, yycolumn); }
"}"							{ return new TokenRuby("CHAVE2", yytext(), yyline, yycolumn); }
"("							{ return new TokenRuby("PARENTESE", yytext(), yyline, yycolumn); }
")"							{ return new TokenRuby("PARENTESE2", yytext(), yyline, yycolumn); }
"@@"						{ return new TokenRuby("ARROBA2", yytext(), yyline, yycolumn); }
"@"							{ return new TokenRuby("ARROBA", yytext(), yyline, yycolumn); }
"$"							{ return new TokenRuby("DOLAR", yytext(), yyline, yycolumn); }
";"							{ return new TokenRuby("PONTOVIRG", yytext(), yyline, yycolumn); }
"."							{ return new TokenRuby("PONTO", yytext(), yyline, yycolumn); }
","							{ return new TokenRuby("VIRGULA", yytext(), yyline, yycolumn); }
"||"						{ return new TokenRuby("ORBOOL", yytext(), yyline, yycolumn); }
"|"							{ return new TokenRuby("BITOR", yytext(), yyline, yycolumn); }
"?"							{ return new TokenRuby("INTERROG", yytext(), yyline, yycolumn); }
"!"							{ return new TokenRuby("NOT", yytext(), yyline, yycolumn); }
"::"						{ return new TokenRuby("DOISPONTDUP", yytext(), yyline, yycolumn); }
":"							{ return new TokenRuby("DOISPONTOS", yytext(), yyline, yycolumn); }
"^"							{ return new TokenRuby("BITXOR", yytext(), yyline, yycolumn); }
"~"							{ return new TokenRuby("BITCOMP", yytext(), yyline, yycolumn); }
"&&="						{ return new TokenRuby("ANDBOOLEQ", yytext(), yyline, yycolumn); }
"&&"						{ return new TokenRuby("ANDBOOL", yytext(), yyline, yycolumn); }
"&="						{ return new TokenRuby("BITANDEQ", yytext(), yyline, yycolumn); }
"&"							{ return new TokenRuby("BITAND", yytext(), yyline, yycolumn); }
"<"							{ return new TokenRuby("MENOR", yytext(), yyline, yycolumn); }
">"							{ return new TokenRuby("MAIOR", yytext(), yyline, yycolumn); }


/* PALAVRAS RESERVADAS */
"alias"						{ return new TokenRuby("ALIAS", yytext(), yyline, yycolumn); }
"and"						{ return new TokenRuby("AND", yytext(), yyline, yycolumn); }
"BEGIN"						{ return new TokenRuby("BEGIN", yytext(), yyline, yycolumn); }
"begin"						{ return new TokenRuby("BEGIN2", yytext(), yyline, yycolumn); }
"break"						{ return new TokenRuby("BREAK", yytext(), yyline, yycolumn); }
"case"						{ return new TokenRuby("CASE", yytext(), yyline, yycolumn); }
"class"						{ return new TokenRuby("CLASS", yytext(), yyline, yycolumn); }
"def"						{ return new TokenRuby("DEF", yytext(), yyline, yycolumn); }
"defined?"					{ return new TokenRuby("DEFINED?", yytext(), yyline, yycolumn); }
"do"						{ return new TokenRuby("DO", yytext(), yyline, yycolumn); }
"else"						{ return new TokenRuby("ELSE", yytext(), yyline, yycolumn); }
"elsif"						{ return new TokenRuby("ELSIF", yytext(), yyline, yycolumn); }
"END"						{ return new TokenRuby("END", yytext(), yyline, yycolumn); }
"end"						{ return new TokenRuby("END2", yytext(), yyline, yycolumn); }
"ensure"					{ return new TokenRuby("ENSURE", yytext(), yyline, yycolumn); }
"false"						{ return new TokenRuby("FALSE", yytext(), yyline, yycolumn); }
"for"						{ return new TokenRuby("FOR", yytext(), yyline, yycolumn); }
"if"						{ return new TokenRuby("IF", yytext(), yyline, yycolumn); }
"in"						{ return new TokenRuby("IN", yytext(), yyline, yycolumn); }
"module"					{ return new TokenRuby("MODULE", yytext(), yyline, yycolumn); }
"next"						{ return new TokenRuby("NEXT", yytext(), yyline, yycolumn); }
"nil"						{ return new TokenRuby("NIL", yytext(), yyline, yycolumn); }
"not"						{ return new TokenRuby("NOT", yytext(), yyline, yycolumn); }
"or"						{ return new TokenRuby("OR", yytext(), yyline, yycolumn); }
"redo"						{ return new TokenRuby("REDO", yytext(), yyline, yycolumn); }
"rescue"					{ return new TokenRuby("RESCUE", yytext(), yyline, yycolumn); }
"retry"						{ return new TokenRuby("RETRY", yytext(), yyline, yycolumn); }
"return"					{ return new TokenRuby("RETURN", yytext(), yyline, yycolumn); }
"self"						{ return new TokenRuby("SELF", yytext(), yyline, yycolumn); }
"super"						{ return new TokenRuby("SUPER", yytext(), yyline, yycolumn); }
"then"						{ return new TokenRuby("THEN", yytext(), yyline, yycolumn); }
"true"						{ return new TokenRuby("TRUE", yytext(), yyline, yycolumn); }
"undef"						{ return new TokenRuby("UNDEF", yytext(), yyline, yycolumn); }
"unless"					{ return new TokenRuby("UNLESS", yytext(), yyline, yycolumn); }
"until"						{ return new TokenRuby("UNTIL", yytext(), yyline, yycolumn); }
"when"						{ return new TokenRuby("WHEN", yytext(), yyline, yycolumn); }
"while"						{ return new TokenRuby("WHILE", yytext(), yyline, yycolumn); }
"yield"						{ return new TokenRuby("YIELD", yytext(), yyline, yycolumn); }
"__FILE__"					{ return new TokenRuby("__FILE__", yytext(), yyline, yycolumn); }
"__LINE__"					{ return new TokenRuby("__LINE__", yytext(), yyline, yycolumn); }

}

<YYINITIAL> {
/* IDENTIFICADORES */ 
{Identificador}				{ return new TokenRuby("IDENTIFICADOR", yytext(), yyline, yycolumn, "Identificador de métodos, variáveis, constante, etc"); }
{IdentificadorMetodo}			{ return new TokenRuby("IDENTIFICADOR_METODO", yytext(), yyline, yycolumn); }

/* NÚMEROS */
{DecOrInt}("e"|"E")("+"|"-")?{DecOrInt} { return new TokenRuby("NOTACAO_CIENTIFICA", yytext(), yyline, yycolumn); }
{Inteiro}					{ return new TokenRuby("INTEIRO", yytext(), yyline, yycolumn); }
{Decimal}					{ return new TokenRuby("DECIMAL", yytext(), yyline, yycolumn); }


\"							{ string.setLength(0); yybegin(STRING); }

/* COMENTÁRIO */
"=begin"(.*{LineTerminator}*)*"=end" | "#"+.+	{ /* ignore */ }

/* espaço em branco */
{WhiteSpace}				{ /* ignore */ }
}

/* ESTÁDO PARA TRATAR STRINGS */
<STRING> {
\"							{ 
                              new TokenRuby("STRING", string.toString(), yyline, yycolumn); 
                              yybegin(YYINITIAL); 
							}

/* CONDIÇÃO PARA TRATAR O CHAR
   CASO A LÍNGUÁGEM TIVESSE
   COMENTAMOS POIS O RUBY NÃO PRECISA */
/* [^\n\r]						{ string.append( yytext() ); yybegin(CHAR); } */

[^\n\r\"\\]+				{ string.append( yytext() ); }
\\t							{ string.append('\t'); }
\\n							{ string.append('\n'); }

\\r							{ string.append('\r'); }
\\\"						{ string.append('\"'); }
\\							{ string.append('\\'); }
}

/* ESTADOS PARA TRATAR CHAR
   DEIXAMOS APENAS PARA PROVA DE CONCEITO
 */
<CHAR> {
\"							{ 
                              new TokenRuby("CHAR", string.toString(), yyline, yycolumn);
                              yybegin(YYINITIAL);  
							}
}

/* Exceção caso entre caractére inválido */
.							{ 
							  throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); 
							}

