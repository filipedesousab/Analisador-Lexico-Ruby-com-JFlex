#CALCULADORA SIMPLES

op =  ""
num1 = ""
num2 = ""
while true

	def somar(a,b)
		a+b
	end
	def subtrair(a,b)
		a-b
	end
	def multip(a,b)
		a*b
	end
	def div(a,b)
		a/b
	end

	print "Digite a operacao[+-*/] ou [x] para fechar: "
	op = gets.chomp
	if op == "x"
		break
	end

	puts "Digite um numero: "
	num1 = gets.to_f

	print "Digite o segundo numero: "
	num2 = gets.to_f

	if op == "+"
		resultado = somar(num1, num2)
	elsif op == "-"
		resultado = subtrair(num1, num2)
	elsif op == "*"
		resultado = multip(num1, num2)
	elsif op == "/"
		resultado = div(num1, num2)
	end
		
	puts resultado
end
