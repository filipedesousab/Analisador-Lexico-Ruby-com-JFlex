package dlince;

public class Imprimir {
	
	StringBuffer nameValue = new StringBuffer();
	StringBuffer lineColumn = new StringBuffer();
	StringBuffer colum = new StringBuffer();
	StringBuffer desc = new StringBuffer();
	
	public Imprimir(String name, String value, int line, int column){
		tamNameValue(new StringBuffer(name), new StringBuffer(value));
		tamLineColumn(line, column);
		System.out.println(this.nameValue.toString() + this.lineColumn.toString());
	}
	
	public Imprimir(String name, String value, int line, int column, String desc ){
		tamNameValue(new StringBuffer(name), new StringBuffer(value));
		tamLineColumn(line, column);
		tamDesc(new StringBuffer(desc));
		System.out.println(this.nameValue.toString() + this.lineColumn.toString() + this.desc.toString()+"\n");
	}
	
	private void tamNameValue(StringBuffer name, StringBuffer value){
		this.nameValue.append( "< "+name+", "+value+" >" );
		int falta = 35 - this.nameValue.length();
		for(int i = 0; i<falta; i++){
			this.nameValue.append( " " );
		}
	}
	private void tamLineColumn(int line, int column){
		this.lineColumn.append( "Linha: "+line+" - Coluna: "+column );
		int falta = 28 - this.lineColumn.length();
		for(int i = 0; i<falta; i++){
			this.lineColumn.append( " " );
		}
	}
	private void tamDesc(StringBuffer desc){
		for(int i = 0; i<desc.length(); i++){
			if(i >= 40 && i%40 == 0){
				this.desc.append( "\n" );
				for(int j = 1; j<= 63; j++){
					this.desc.append( " " );
				}
			}
			this.desc.append( desc.substring(0+i, 1+i) );
		}
	}
}
