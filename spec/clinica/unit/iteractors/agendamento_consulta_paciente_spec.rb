require 'rspec/given'
require 'clinica/iteractors/agendamento_consulta_paciente'

describe 'Agendar Horario de Consulta para Paciente' do

  let(:paciente_id){ 1 }
  let(:data_hora_inicio_consulta){ Time.local(2014, 6, 6, 9) }
  let(:data_hora_fim_consulta){ Time.local(2014, 6, 6, 9, 30) }
  let(:paciente){double}
  let(:paciente_repositorio){double(:paciente_repositorio, obter_por_id: paciente)}

  Given(:iteractor) do
    AgendamentoConsultaPaciente.new(
      paciente_id: paciente_id,
      data_hora_inicio_consulta: data_hora_inicio_consulta,
      data_hora_fim_consulta: data_hora_fim_consulta,
      opts: { agenda_consulta_repositorio: agenda_consulta_repositorio, paciente_repositorio: paciente_repositorio } )
  end

  context "com horario livre" do
    let(:agenda){ double(:agenda, agendar_horario: true) }
    let(:agenda_consulta_repositorio) { double(:agenda_repositorio, obter_agenda_do_dia: agenda) }

    When(:result){ iteractor.execute }
    Then{ expect(result).to be true }
  end

  context "com horario ocupado" do
    let(:agenda){ double(:agenda, agendar_horario: false) }
    let(:agenda_consulta_repositorio) { double(:agenda_repositorio, obter_agenda_do_dia: agenda) }

    When(:result){ iteractor.execute }
    Then{ expect(result).to be false }
  end

end