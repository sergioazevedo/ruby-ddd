require_relative '../infra/agendamento_consulta_data'
class AgendaConsultaRepository

  def initialize(data_object: nil, opts: {})
    @data_object = data_object || AgendamentoConsultaData
    #@factory = opts[:factory] || AgendamentoFactory.new
  end

  def obter_agenda_do_dia(dia)
    periodo = Periodo.do_dia_inteiro( dia )
    AgendaConsulta.new(periodo: periodo, repositorio: self)
  end

  #...para ser usado pelo AggregateRoot apenas
  def realizar_agendamento(paciente:, periodo:)
    data_instance = AgendamentoConsultaData.create!({
      paciente_id: paciente.id,
      data_hora_inicio: periodo.data_inicio,
      data_hora_fim:  periodo.data_fim,
    })
    AgendamentoConsulta.new(data_instance)
  end

  def periodo_disponivel_para_agendamento?(periodo)
    dao.horario_disponivel_para_agendamento?(periodo.data_inicio, periodo.data_fim)
  end

private
  def dao
    @data_object
  end

end