package dlince;

public class TokenRuby {

	public String name;
    public String value;
    public Integer line;
    public Integer column;

	public TokenRuby(String string, String yytext, int yyline, int yycolumn) {
		this.name = name;
        this.value = value;
        this.line = line;
        this.column = column;
	}
}
