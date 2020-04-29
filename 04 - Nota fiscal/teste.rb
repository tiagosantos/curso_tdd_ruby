require 'test/unit'
require 'mocha/setup'
require File.expand_path('lib/pedido.rb', File.dirname(__FILE__))
require File.expand_path('lib/notafiscal.rb', File.dirname(__FILE__))
require File.expand_path('lib/geradordenotafiscal.rb', File.dirname(__FILE__))

class GeradorDeNotaFiscalTest < Test::Unit::TestCase
    def teste_deve_gerar_NF_com_valor_de_imposto_descontado
        # criando o mock
        dao = mock

        dao.expects(:persiste)
        sap = mock.tap{|sap| sap.expects(:envia)}

        gerador = GeradorDeNotaFiscal.new dao, sap
        pedido = Pedido.new('Mauricio', 1000, 1)

        nf = gerador.gera pedido

        assert_equal 1000 * 0.94, nf.valor
    end

    def teste_deve_persistir_NF_gerada
        # criando o mock
        dao = mock

        dao.expects(:persiste)

        sap = mock.tap{|sap| sap.expects(:envia)}

        gerador = GeradorDeNotaFiscal.new dao, sap
        pedido = Pedido.new('Mauricio', 1000, 1)

        nf = gerador.gera pedido
    end

    def teste_deve_enviar_NF_gerada_para_SAP
        dao = stub_everything
        sap = mock.tap{|sap| sap.expects(:envia)}

        gerador = GeradorDeNotaFiscal.new dao, sap
        pedido = Pedido.new('Mauricio', 1000, 1)

        nf = gerador.gera pedido
    end
    
end