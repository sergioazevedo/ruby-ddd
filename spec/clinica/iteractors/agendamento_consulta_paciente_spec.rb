require 'rspec/given'
require 'clinica/iteractors/agendamento_consulta_paciente'

describe 'Agendar Horario de Consulta para Paciente' do

  let(:paciente_id){ 1 }
  let(:data_hora_inicio_consulta){ Time.local(2014, 6, 6, 9) }
  let(:data_hora_fim_consulta){ Time.local(2014, 6, 6, 9, 30) }

  Given(:iteractor){ AgendamentoConsultaPaciente.new( paciente_id: paciente_id, data_hora_inicio_consulta: data_hora_inicio_consulta, data_hora_fim_consulta: data_hora_fim_consulta ) }

  context "com horario livre" do
    When(:result){ iteractor.execute }
    Then{ expect(result).to be true }
  end

end