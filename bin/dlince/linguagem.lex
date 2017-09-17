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
"alias"						{ return new TokenRuby("ALIAS", yytext(), yyline, yycolumn, "mantém a definição atual do método, mesmo quando os métodos são substituídos."); }
"and"						{ return new TokenRuby("AND", yytext(), yyline, yycolumn, "é equivalente a &&.Avalia o lado esquerdo e, se o resultado for verdadeiro, avalia o lado direito."); }
"BEGIN"						{ return new TokenRuby("BEGIN", yytext(), yyline, yycolumn, "Registra a rotina de inicialização. O bloco seguido depois BEGIN é avaliado antes de qualquer outra declaração nesse arquivo"); }
"begin"						{ return new TokenRuby("BEGIN2", yytext(), yyline, yycolumn, "expressão executa seu corpo e retorna o valor da última expressão avaliada."); }
"break"						{ return new TokenRuby("BREAK", yytext(), yyline, yycolumn, "Sai do loop mais interno. O break não sai da expressão case"); }
"case"						{ return new TokenRuby("CASE", yytext(), yyline, yycolumn, "As case expressões também são para execução condicional. sendo que suas comparações equivale ao mesmo que ===."); }
"class"						{ return new TokenRuby("CLASS", yytext(), yyline, yycolumn, "Define uma nova classe."); }
"def"						{ return new TokenRuby("DEF", yytext(), yyline, yycolumn, " palavra para indentificar métodos, a partir dela que o programa identifica a palavra a frente como um método"); }
"defined?"					{ return new TokenRuby("DEFINED?", yytext(), yyline, yycolumn, "Retorna false se a expressão não estiver definida. Retorna a seqüência de caracteres que descreve um tipo de expressão."); }
"do"						{ return new TokenRuby("DO", yytext(), yyline, yycolumn, Define uma estrutura de repetição sem condição ); }
"else"						{ return new TokenRuby("ELSE", yytext(), yyline, yycolumn, "Representa a execução de um comando quando a condição não é validada"); }
"elsif"						{ return new TokenRuby("ELSIF", yytext(), yyline, yycolumn, "Equivale ao fechamento de uma condição e abertura de outra, mas resumida em uma unica palavra."); }
"END"						{ return new TokenRuby("END", yytext(), yyline, yycolumn, "Define o final da Rotina de inicialização, finaliza o bloco"); }
"end"						{ return new TokenRuby("END2", yytext(), yyline, yycolumn, Define o final de um bloco de Expressões); }
"ensure"					{ return new TokenRuby("ENSURE", yytext(), yyline, yycolumn, "seu corpo de cláusula é executado sempre que o begincorpobegin for encerrado."); }
"false"						{ return new TokenRuby("FALSE", yytext(), yyline, yycolumn, "a única instância da classe FalseClass (representa falso)"); }
"for"						{ return new TokenRuby("FOR", yytext(), yyline, yycolumn, , "palavra para estrutura de repetição, Executa o corpo para cada elemento no resultado da expressão."); }
"if"						{ return new TokenRuby("IF", yytext(), yyline, yycolumn, "expressãos usadas para execução condicional. Os valores false e nil são falsos, e tudo o mais é verdade."); }
"in"						{ return new TokenRuby("IN", yytext(), yyline, yycolumn, "Define um contado para uma estrutura de Repetição For"); }
"module"					{ return new TokenRuby("MODULE", yytext(), yyline, yycolumn, " tipo de objeto, que é usado para armazenar comandos, valores e fórmulas, é mais pratico pois não é necessário que seja inicializado "); }
"next"						{ return new TokenRuby("NEXT", yytext(), yyline, yycolumn, "Salta para a próxima iteração do loop mais interno."); }
"nil"						{ return new TokenRuby("NIL", yytext(), yyline, yycolumn, "é equivalente a Nulo.a única instância da Classe NilClass (representa falso)"); }
"not"						{ return new TokenRuby("NOT", yytext(), yyline, yycolumn, "Retorna verdadeiro se for falso, falso se verdadeiro."); }
"or"						{ return new TokenRuby("OR", yytext(), yyline, yycolumn, "é equivalente a ||.Avalia o lado esquerdo, então se o resultado for falso, avalia o lado direito"); }
"redo"						{ return new TokenRuby("REDO", yytext(), yyline, yycolumn, "Reinicia a iteração do loop mais interno, sem verificar a condição do loop."); }
"rescue"					{ return new TokenRuby("RESCUE", yytext(), yyline, yycolumn, "cláusula com o tipo de exceção de um Bloco correspondente"); }
"retry"						{ return new TokenRuby("RETRY", yytext(), yyline, yycolumn, "reinicia a invocação de uma chamada"); }
"return"					{ return new TokenRuby("RETURN", yytext(), yyline, yycolumn, "Sai do método com o valor de retorno."); }
"self"						{ return new TokenRuby("SELF", yytext(), yyline, yycolumn, "o receptor do método atual"); }
"super"						{ return new TokenRuby("SUPER", yytext(), yyline, yycolumn, "chama o método que substitui o método atual"); }
"then"						{ return new TokenRuby("THEN", yytext(), yyline, yycolumn, " indica o proximo comando a ser executado. sua colocação é opcional "); }
"true"						{ return new TokenRuby("TRUE", yytext(), yyline, yycolumn, "a única instância da classe TrueClass (valor verdadeiro típico)"); }
"undef"						{ return new TokenRuby("UNDEF", yytext(), yyline, yycolumn, "Cancela a definição do método."); }
"unless"					{ return new TokenRuby("UNLESS", yytext(), yyline, yycolumn, "expressões usadas para a execução condicional reversa. É equivalente a: if !(cond) ... else ...end"); }
"until"						{ return new TokenRuby("UNTIL", yytext(), yyline, yycolumn, "Executa o corpo até a expressão de condição retornar verdadeira."); }
"when"						{ return new TokenRuby("WHEN", yytext(), yyline, yycolumn, "Palavra utilizada para subdividir as condições em uma expressão case"); }
"while"						{ return new TokenRuby("WHILE", yytext(), yyline, yycolumn, "Executa o corpo enquanto a expressão de condição retorna verdadeira."); }
"yield"						{ return new TokenRuby("YIELD", yytext(), yyline, yycolumn, "Avalia o bloco dado ao método atual com argumentos, se nenhum argumento for dado, nil é usado como um argumento."); }
"__FILE__"					{ return new TokenRuby("__FILE__", yytext(), yyline, yycolumn, "O nome do arquivo fonte atual"); }
"__LINE__"					{ return new TokenRuby("__LINE__", yytext(), yyline, yycolumn, "o número da linha atual no arquivo de origem."); }

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

