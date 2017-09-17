package dlince;

public class Imprimir {
	
	StringBuffer nameValue = new StringBuffer();
	StringBuffer lineColumn = new StringBuffer();
	StringBuffer colum = new StringBuffer();
	
	public Imprimir(String name, String value, int line, int column ){
		tamNameValue(name, value);
		tamLineColumn(line, column);
		System.out.println(this.nameValue.toString() + this.lineColumn.toString());
	}
	
	private void tamNameValue(String name, String value){
		this.nameValue.append( "<"+name+", "+value+">" );
		int falta = 35 - this.nameValue.length();
		for(int i = 0; i<falta; i++){
			this.nameValue.append( " " );
		}
	}
	private void tamLineColumn(int line, int column){
		this.lineColumn.append( "Linha: "+line+" - Coluna: "+column );
		int falta = 35 - this.lineColumn.length();
		for(int i = 0; i<falta; i++){
			this.lineColumn.append( " " );
		}
	}
}
