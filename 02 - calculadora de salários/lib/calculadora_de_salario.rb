require File.expand_path('./funcionario.rb',
    File.dirname(__FILE__))

class CalculadoraDeSalario
    def calcula_salario funcionario
        funcionario.salario * (
            salario_acima_do_limite(funcionario) ? 
            funcionario.cargo[:porcentagem_acima_do_limite] : 
            funcionario.cargo[:porcentagem_base]
        )
    end
    def salario_acima_do_limite funcionario
        funcionario.salario > funcionario.cargo[:limite]
    end
end

