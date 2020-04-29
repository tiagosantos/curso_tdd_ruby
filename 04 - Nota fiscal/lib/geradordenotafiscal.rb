
require File.expand_path('./pedido.rb', File.dirname(__FILE__))
require File.expand_path('./notafiscal.rb', File.dirname(__FILE__))
require File.expand_path('./nf_dao.rb', File.dirname(__FILE__))

class GeradorDeNotaFiscal
    def initialize(acoes)
        @acoes = acoes
    end
    def gera pedido
        nf = NotaFiscal.new pedido.cliente,
        pedido.valor_total * 0.94, Time.now

        @acoes.each { |acao| acao.executa nf }
        
        nf
    end
end