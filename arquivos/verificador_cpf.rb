def verificar_cpf(cpf)
  if (cpf =~ /^(([0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2})|([0-9]{11}))$/)

    digitos_cpf = cpf.gsub(/[.-]/, "")

    i = 0
    multiplicador = 10
    primeira_soma = 0
    while i < 9
      primeira_soma += digitos_cpf[i].to_i * multiplicador
      i += 1
      multiplicador -= 1
    end
    primeiro_dv = (primeira_soma * 10) % 11
    if primeiro_dv > 9
      primeiro_dv = 0
    end

    if primeiro_dv.to_s.eql? digitos_cpf[9].to_s # se passar na validação do primeiro dígito entra no if
      i = 0
      multiplicador = 11
      segunda_soma = 0
      while i < 10
        primeira_soma += digitos_cpf[i].to_i * multiplicador
        i += 1
        multiplicador -= 1
      end
      segundo_dv = (segunda_soma * 10) % 11
      if segundo_dv > 9
        segundo_dv = 0
      end
      if segundo_dv.to_s.eql? digitos_cpf[10].to_s
        return true # o segundo dígito também é válido
      end
    end
  end

  return false

end

class VerificadorCpf

  puts "Caso deseje fechar o programa tecle \"x\" a qualquer momento.\n"

  while true
    puts "\nDigite o número do CPF no formato \"000.000.000-00\" ou somente os números: "
    cpf = gets.to_s

    if cpf.chomp == "x"
      break
    end

    if verificar_cpf(cpf)
      puts "CPF VÁLIDO\n"
    else
      puts "CPF INVÁLIDO\n"
    end
  end

end