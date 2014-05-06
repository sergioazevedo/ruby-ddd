class AgendaConsultaRepository

  def obter_agenda_do_dia(dia)
    periodo = Periodo.do_dia_inteiro( dia )
    AgendaConsulta.new(periodo: periodo, repositorio: self)
  end

  def realizar_agendamento(novo_agendamento)

  end

  def periodo_ja_agendado?(periodo)

  end

end