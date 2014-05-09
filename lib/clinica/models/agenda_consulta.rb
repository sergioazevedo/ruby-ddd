class HorarioAgendamentoIndisponivelException < Exception; end

class AgendaConsulta

  def initialize(periodo:, repositorio:)
    @periodo = periodo
    @repositorio = repositorio
  end

  def periodo
    @periodo.freeze
  end

  def agendar_horario(paciente:, periodo:)
    if repositorio.periodo_disponivel_para_agendamneto?(periodo)
      repositorio.realizar_agendamento(paciente: paciente, periodo: periodo)
    else
      raise HorarioAgendamentoIndisponivelException.new
    end
  end

private
  def repositorio
    @repositorio
  end

end