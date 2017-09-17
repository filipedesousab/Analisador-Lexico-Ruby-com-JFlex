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
"+="						{ return new TokenRuby("PLUSEQ", yytext(), yyline, yycolumn, "(a += b) equivalente a (a = a + b)"); }
"-="						{ return new TokenRuby("SUBEQ", yytext(), yyline, yycolumn, "(a -= b) equivalente a (a = a - b)"); }
"*="						{ return new TokenRuby("MULTEQ", yytext(), yyline, yycolumn, "(a *= b) equivalente a (a = a * b)"); }
"/="						{ return new TokenRuby("DIVEQ", yytext(), yyline, yycolumn, "(a /= b) equivalente a (a = a / b)"); }
"%="						{ return new TokenRuby("MODEQ", yytext(), yyline, yycolumn, "(a %= b) equivalente a (a = a % b)"); }
"**="						{ return new TokenRuby("EXPEQ", yytext(), yyline, yycolumn, "(a **= b) equivalente a (a = a ** b)"); }
"**"						{ return new TokenRuby("EXP", yytext(), yyline, yycolumn, "Exponenciação: 2**3 = 8"); }
"=~"						{ return new TokenRuby("CORRESP", yytext(), yyline, yycolumn, "Correspondência padrão, usado para expressão regular. O explo a seguie irá retornar 4, que é a posição que corresponde a expressão regular: \"abc 123\" =~ /[0-9]/"); }
"!~"						{ return new TokenRuby("NOTCORRESP", yytext(), yyline, yycolumn, "Não-Correspondência padrão, usado para expressão regular, retorna true quando a string não corresponde a expressão regular, ou false quando corresponde."); }
"==="						{ return new TokenRuby("EQEQEQ", yytext(), yyline, yycolumn, "Verifica se um subconjunto etá contido em um conjunto. No exmplo a seguir irá retornar true, pois abc está contido no conjunto de letras de a à z: /[a-z]/ === \"abc\""); }
"=="						{ return new TokenRuby("EQEQ", yytext(), yyline, yycolumn, "Verifica se dois operandos são iguais: (a == a) retorna true, (a == b) retorna false"); }
"^="						{ return new TokenRuby("BITXOREQ", yytext(), yyline, yycolumn, "Faz uma operação binária XOR e atribui a variável. 10^3 retorna 9"); }
"||="						{ return new TokenRuby("ORBOOLEQ", yytext(), yyline, yycolumn, "Operador condicional, se 'a' for true mantenha 'a', se for false atribua 'b': a ||= b "); }
"|="						{ return new TokenRuby("OREQ", yytext(), yyline, yycolumn, "Retorna e atribui true se pelomenos um dos operandos for true: A |= B é equivalente a A = A | B" ); }
"!="						{ return new TokenRuby("DIFERENTE", yytext(), yyline, yycolumn, "Retorna true se os operandos forem diferente: a != b retorna true"); }
"<=>"						{ return new TokenRuby("COMPCOMB", yytext(), yyline, yycolumn, "A <=> B avalia para -1, 0 ou 1; se A for menor do que, igual ou maior do que B, respectivamente"); }
"<<="						{ return new TokenRuby("SHIFTLEQ", yytext(), yyline, yycolumn, "Left Shift com atribuição: A <<= B é equivalente a A = A << B"); }
">>="						{ return new TokenRuby("SHIFTREQ", yytext(), yyline, yycolumn, "Right Shift com atribuição: A >>= B é equivalente a A = A >> B"); }
">="						{ return new TokenRuby("MAIOREQ", yytext(), yyline, yycolumn, "Retorna true se o valor da esquerda for maior que o da direita ou igual: 10 >= 5"); }
"<="						{ return new TokenRuby("MENOREQ", yytext(), yyline, yycolumn, "Retorna true se o valor da esquerda for menor que o da direita ou igual: 5 <= 10"); }
"<<"						{ return new TokenRuby("SHIFTL", yytext(), yyline, yycolumn, "Left Shift, faz o deslocamento binário a esquerda, ocorrendo uma multiplicação: 10<<1 == 20"); }
">>"						{ return new TokenRuby("SHIFTR", yytext(), yyline, yycolumn, "Left Right, faz o deslocamento binário a direita, ocorrendo uam divisão: 10>>1 == 5"); }
"="							{ return new TokenRuby("EQ", yytext(), yyline, yycolumn, "Atribuição de valores"); }
"+"							{ return new TokenRuby("PLUS", yytext(), yyline, yycolumn, "Operador de soma"); }
"-"							{ return new TokenRuby("SUB", yytext(), yyline, yycolumn, "Operador de subtração"); }
"*"							{ return new TokenRuby("MULT", yytext(), yyline, yycolumn, "Operador de multiplicação"); }
"/"							{ return new TokenRuby("DIV", yytext(), yyline, yycolumn, "Operador de divisão"); }
"%"							{ return new TokenRuby("MOD", yytext(), yyline, yycolumn, "Operador de modulo, retorna o resto de ums divisão"); }
"["							{ return new TokenRuby("COLCHETE", yytext(), yyline, yycolumn, "Usado em Arrays: ary = [1, \"two\", 3.0]."); }
"]"							{ return new TokenRuby("COLCHETE2", yytext(), yyline, yycolumn, "Usado em Arrays: ary = [1, \"two\", 3.0]."); }
"{"							{ return new TokenRuby("CHAVE", yytext(), yyline, yycolumn, "Usado para delimitar Hash: h = { 7 => 35, \"c\" => 2, \"a\" => 1 }"); }
"}"							{ return new TokenRuby("CHAVE2", yytext(), yyline, yycolumn, "Usado para delimitar Hash: h = { 7 => 35, \"c\" => 2, \"a\" => 1 }"); }
"("							{ return new TokenRuby("PARENTESE", yytext(), yyline, yycolumn, "Usado para limitar um conjundo de dados: \"(1 + 2)*5\" ou \"for a in (1..6)\""); }
")"							{ return new TokenRuby("PARENTESE2", yytext(), yyline, yycolumn, "Usado para limitar um conjundo de dados: \"(1 + 2)*5\" ou \"for a in (1..6)\""); }
"@@"						{ return new TokenRuby("ARROBA2", yytext(), yyline, yycolumn, "Prescede uma variável de classe, equivalente ao atributo estático do Java."); }
"@"							{ return new TokenRuby("ARROBA", yytext(), yyline, yycolumn, "Prescede uma variável de instancia \"Atributo do objeto\"."); }
"$"							{ return new TokenRuby("DOLAR", yytext(), yyline, yycolumn, "Prescede uma variável global."); }
";"							{ return new TokenRuby("PONTOVIRG", yytext(), yyline, yycolumn, "Delimitador de instrução, pode ser omitido."); }
"."							{ return new TokenRuby("PONTO", yytext(), yyline, yycolumn, "Usado para trabalhar com objetos: \"arr = Array.new(3)\" ou \"arr.drop(3)\"."); }
","							{ return new TokenRuby("VIRGULA", yytext(), yyline, yycolumn, "Usado para separar identificadores e dados: \"ary = [1, \"two\", 3.0]\" ou \"Array.new(3, true)\"."); }
"||"						{ return new TokenRuby("ORBOOL", yytext(), yyline, yycolumn, "Operador lógico, retorna true se pelomenos um dos operandos forem true"); }
"|"							{ return new TokenRuby("BITOR", yytext(), yyline, yycolumn, "Operador OR binário: 1010 | 0011 = 1011"); }
"?"							{ return new TokenRuby("INTERROG", yytext(), yyline, yycolumn, "Aplicado noperador ternário"); }
"!"							{ return new TokenRuby("NOT", yytext(), yyline, yycolumn, "Inverte o estado da lógica do operando: !true é equivalente a false"); }
"::"						{ return new TokenRuby("DOISPONTDUP", yytext(), yyline, yycolumn, "Permite acessar uma constante, módulo ou classe definida dentro de outra classe ou módulo."); }
":"							{ return new TokenRuby("DOISPONTOS", yytext(), yyline, yycolumn,"Aplicado no operador ternário"); }
"^"							{ return new TokenRuby("BITXOR", yytext(), yyline, yycolumn, "Operador binário XOR: 1010 ^ 0011 = 1001"); }
"~"							{ return new TokenRuby("BITCOMP", yytext(), yyline, yycolumn, "Operador de complemento binário: ~10 retorna -11"); }
"&&="						{ return new TokenRuby("ANDBOOLEQ", yytext(), yyline, yycolumn,"Operador lógico AND: A &&= B é equivalente a A = A && B "); }
"&&"						{ return new TokenRuby("ANDBOOL", yytext(), yyline, yycolumn, "Operador lógico AND: (a==true && b==true) retorna true "); }
"&="						{ return new TokenRuby("BITANDEQ", yytext(), yyline, yycolumn, "Operador AND binário com atribuição, sendo a=10 e b=3, a recebe o valor 2: a &= b, a == 2 "); }
"&"							{ return new TokenRuby("BITAND", yytext(), yyline, yycolumn, "Operador AND binário: 1010 & 0011 = 0010"); }
"<"							{ return new TokenRuby("MENOR", yytext(), yyline, yycolumn, "Retorna true se o operando da esquerda for menor que o da direita: 5<10"); }
">"							{ return new TokenRuby("MAIOR", yytext(), yyline, yycolumn, "Retorna true se o operando da esquerda for maior que o da direita: 10>5"); }


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

