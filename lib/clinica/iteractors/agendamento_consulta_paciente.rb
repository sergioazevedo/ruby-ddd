class AgendamentoConsultaPaciente

  def initialize( paciente_id:, data_hora_inicio_consulta:, data_hora_fim_consulta: )
    @paciente_id = paciente_id
    @data_hora_inicio_consulta = data_hora_inicio_consulta
    @data_hora_fim_consulta = data_hora_fim_consulta
  end

  def execute
    true
  end
end
