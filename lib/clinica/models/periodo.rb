class PeriodoInvalidoError < Exception; end

class Periodo
  attr_reader :data_inicio, :data_fim

  def initialize(inicio:, fim:)
    raise PeriodoInvalidoError.new if inicio > fim
    @data_inicio = inicio.freeze
    @data_fim = fim.freeze
  end

end