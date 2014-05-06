class AgendaConsultaRepository

  def obter_agenda_do_dia(dia)
    periodo = Periodo.do_dia_inteiro( dia )
    AgendaConsulta.new(periodo: periodo, repositorio: self)
  end

end