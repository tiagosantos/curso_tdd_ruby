# frozen_string_literal: true

require 'test/unit'

require File.expand_path('lib/conversor_de_numero_romano.rb',
                         File.dirname(__FILE__))

class ConversorDeNumeroRomanoTest < Test::Unit::TestCase
  def teste_deve_entender_o_simbolo_I
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'I'
    assert_equal 1, numero
  end

  def teste_deve_entender_o_simbolo_V
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'V'
    assert_equal 5, numero
  end

  def teste_deve_entender_o_simbolo_II
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'II'
    assert_equal 2, numero
  end

  def teste_deve_entender_o_simbolo_XXII
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'XXII'
    assert_equal 22, numero
  end

  def teste_deve_entender_o_simbolo_IX
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'IX'
    assert_equal 9, numero
  end

  def teste_deve_entender_o_simbolo_XXIV
    romano = ConversorDeNumeroRomano.new
    numero = romano.converte 'XXIV'
    assert_equal 24, numero
  end
end
