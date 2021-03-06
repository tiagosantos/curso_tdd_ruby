# frozen_string_literal: true

require 'test/unit'
require File.expand_path('lib/calculadora_de_salario.rb',
                         File.dirname(__FILE__))
require File.expand_path('lib/funcionario.rb',
                         File.dirname(__FILE__))

class CalculadoraDeSalarioTest < Test::Unit::TestCase
  def teste_deve_calcular_salario_para_desenvolvedores_com_salario_abaixo_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 1500.0, Cargo::DESENVOLVEDOR)
    salario = calculadora.calcula_salario desenvolvedor
    assert_equal 1500 * 0.9, salario
  end
  def teste_deve_calcular_salario_para_desenvolvedores_com_salario_acima_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 4000.0, Cargo::DESENVOLVEDOR)
    salario = calculadora.calcula_salario desenvolvedor
    assert_equal 4000 * 0.8, salario
  end
  def teste_deve_calcular_salario_para_DBAs_com_salario_abaixo_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 500.0, Cargo::DBA)
    salario = calculadora.calcula_salario desenvolvedor
    assert_equal 500 * 0.85, salario
  end
  def teste_deve_calcular_salario_para_DBAs_com_salario_cima_do_limite
    calculadora = CalculadoraDeSalario.new
    desenvolvedor = Funcionario.new('Mauricio', 4500.0, Cargo::DBA)
    salario = calculadora.calcula_salario desenvolvedor
    assert_equal 4500 * 0.75, salario
  end
end