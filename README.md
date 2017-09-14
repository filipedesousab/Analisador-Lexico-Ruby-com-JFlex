Regras e Classes Java para análise lexica de programas Ruby, utilizando JFlex.

Classes:
- Gerador.java: Classe para chamar a o método `jflex.Main.generate(file);` e gerar o código Java para fazer a análise.
- Analisador.java: Classe gerada pelo `Gerador` para fazer a análise lexica.
- Analisar.java: Classe que irá chamar o `Analisador` passando o arquivo com o programa Ruby a ser analisado.
- TokenRuby.java: Classe para os objetos de Token que serão instanciado no `Analisador`, e posteriormente impresso no `Analisador`.
- linguagem.lex: Arquivo contendo as regras lexicas, que será passado para o JFlex para gerar a classe `Analisador`.