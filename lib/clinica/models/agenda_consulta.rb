class AgendaConsulta

  def initialize(periodo:, repositorio:)
    @periodo = periodo
    @repositorio = repositorio
  end

  def periodo
    @periodo.freeze
  end

  def agendar_horario(paciente:, periodo:)
    AgendamentoConsulta.new
  end

end