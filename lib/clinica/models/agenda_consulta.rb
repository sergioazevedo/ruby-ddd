class HorarioAgendamentoIndisponivelException < Exception; end

class AgendaConsulta

  def initialize(periodo:, repositorio:)
    @periodo = periodo
    @repositorio = repositorio
  end

  def periodo
    @periodo.freeze
  end

  def horario_disponivel?(periodo)
    repositorio.periodo_disponivel_para_agendamento(periodo)
  end

  def agendar_horario(paciente:, periodo:)
    if horario_disponivel?(periodo)
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