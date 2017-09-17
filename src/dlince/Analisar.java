package dlince;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Analisar {

	public static void main(String[] args) throws IOException {
		
		File codigoRuby = new File("arquivos/" + "codigoRuby1" + ".rb");
		FileReader codigoRubyReader = new FileReader(codigoRuby);
		Analisador lexical = new Analisador(codigoRubyReader);

		
        TokenRuby token;
		while ((token = lexical.yylex()) != null) {
			new Imprimir(token.getName(), token.getValue(), token.getLine(), token.getColumn(), token.getDesc());
        }

	}

}
