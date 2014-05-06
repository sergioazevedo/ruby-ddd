class AgendamentoConsultaPaciente

  def initialize(paciente_id:, data_hora_inicio_consulta:, data_hora_fim_consulta:, opts: {})
    @paciente_id = paciente_id
    @data_hora_inicio_consulta = data_hora_inicio_consulta
    @data_hora_fim_consulta = data_hora_fim_consulta
    @agenda_consulta_repositorio = opts[:agenda_consulta_repositorio] || AgendaConsultaRepositorio.new
    @paciente_repositorio = opts[:paciente_repositorio] || PacienteRepositorio.new
  end

  def execute
    paciente = @paciente_repositorio.obter_por_id(@paciente_id)
    agenda_consulta = @agenda_consulta_repositorio.obter_agenda_do_dia(@data_hora_inicio_consulta)

    agendamento_consulta = agenda_consulta.agendar_horario(paciente: paciente, inicio: @data_hora_inicio_consulta, fim: @data_hora_fim_consulta)

    agendamento_consulta
  end
end
