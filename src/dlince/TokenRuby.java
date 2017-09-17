package dlince;

public class TokenRuby {

	public String name;
    public String value;
    public int line;
    public int column;
    public String desc;
    
    public TokenRuby(String string, String yytext, int yyline, int yycolumn) {
		this.name = string;
        this.value = yytext;
        this.line = yyline;
        this.column = yycolumn;
        this.desc = "";
	}
    
	public TokenRuby(String string, String yytext, int yyline, int yycolumn, String desc) {
		this.name = string;
        this.value = yytext;
        this.line = yyline;
        this.column = yycolumn;
        this.desc = desc;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setLine(int line) {
		this.line = line;
	}

	public void setColumn(int column) {
		this.column = column;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getName() {
		return name;
	}

	public String getValue() {
		return value;
	}

	public int getLine() {
		return line;
	}

	public int getColumn() {
		return column;
	}
	
	public String getDesc() {
		return desc;
	}
	
}
