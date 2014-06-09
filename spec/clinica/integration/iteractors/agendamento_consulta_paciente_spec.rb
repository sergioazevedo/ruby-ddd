require 'rspec/given'
require 'clinica/iteractors/agendamento_consulta_paciente'

describe 'Agendar Horario de Consulta para Paciente' do
  before :all do
    PacienteData.create(nome:'Joao Mendes')
  end

  let(:paciente_id){ 1 }
  let(:data_hora_inicio_consulta){ Time.local(2014, 6, 6, 9) }
  let(:data_hora_fim_consulta){ Time.local(2014, 6, 6, 9, 30) }

  Given(:iteractor) do
    AgendamentoConsultaPaciente.new(
      paciente_id: paciente_id,
      data_hora_inicio_consulta: data_hora_inicio_consulta,
      data_hora_fim_consulta: data_hora_fim_consulta )
  end

  context "com horario livre" do
    let(:periodo){ Periodo.new(inicio: data_hora_inicio_consulta, fim: data_hora_fim_consulta) }
    When(:result){ iteractor.execute }
    Then{ expect(result.periodo).to be == periodo }
  end

  context "com horario ocupado" do
    it "deve lancar uma excecao" do
     expect{iteractor.execute}.to raise_error(HorarioAgendamentoIndisponivelException)
   end
  end

end