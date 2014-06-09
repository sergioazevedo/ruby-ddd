require 'forwardable.rb'
class AgendamentoConsulta
  extend Forwardable

  def_delegator :@data_instance, :id, :paciente_id
  def_delegator :@data_instance, :nome, :paciente_nome

  def initialize(data_instance)
    @data_instance = data_instance
  end

  def periodo
    @periodo ||= Periodo.new( inicio: data_instance.data_hora_inicio, fim: data_instance.data_hora_fim )

    @periodo.freeze
  end

end