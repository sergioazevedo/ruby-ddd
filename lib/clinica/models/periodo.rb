class PeriodoInvalidoException < Exception; end

class Periodo
  attr_reader :data_inicio, :data_fim

  def initialize(inicio:, fim:)
    raise PeriodoInvalidoException.new if inicio > fim
    @data_inicio = inicio.freeze
    @data_fim = fim.freeze
  end

  def self.do_dia_inteiro(dia)
    inicio = Time.new(dia.year, dia.month, dia.day, 0, 0, 0)
    fim    = Time.new(dia.year, dia.month, dia.day, 23, 59, 59)

    self.new( inicio: inicio, fim: fim )
  end

end