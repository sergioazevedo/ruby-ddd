class AgendaConsultaRepository

  def initialize(data_object: nil, opts={})
    @data_object = data_object || AgendamentoConsultaData
    @factory = opts[:factory] || AgendamentoFactory.new
  end

  def obter_agenda_do_dia(dia)
    periodo = Periodo.do_dia_inteiro( dia )
    AgendaConsulta.new(periodo: periodo, repositorio: self)
  end

  #...para ser usado pelo AggregateRoot apenas
  def realizar_agendamento(novo_agendamento)

  end

  def periodo_disponivel_para_agendamneto?(periodo)
    agendamentos_data = dao.obter_agendamentos_no_periodo(periodo.data_inicio, periodo.data_fim)
    AgendamentoFactory.new.

  end

private
  def dao
    @data_object
  end

end