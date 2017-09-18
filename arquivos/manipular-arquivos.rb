#Pequena demonstração de manipulação de arquivos
for i in 0..10
	arq = File.new("arquivo#{i}.txt", "w+")
	arq.write "arquivo#{i}.txt Foi criado com sucesso"
	arq.close
	puts File.readlines("arquivo#{i}.txt")
end
	for i in 0..10
		File.rename("arquivo#{i}.txt", "file#{i}.txt")
	end
print "Deseja excluir os arquivos: "
entrada = gets.chomp
if entrada == "s"
	for i in 0..10
		File.delete("file#{i}.txt")
	end
end
