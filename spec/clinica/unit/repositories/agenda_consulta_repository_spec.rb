require 'rspec/given'
require 'clinica/repositories/agenda_consulta_repository'

describe 'Repositorio de Agenda de Consultas' do

  Given(:repositorio){ AgendaConsultaRepository.new }

  describe "API" do
    Then{ expect(repositorio).to respond_to(:obter_agenda_do_dia) }
    Then{ expect(repositorio).to respond_to(:realizar_agendamento) }
    Then{ expect(repositorio).to respond_to(:periodo_disponivel_para_agendamento?) }
  end

  describe "#obter_agenda_do_dia" do
    context "deve retornar a agenda de consultas para o dia em questao" do
      Given(:data){ Time.local(2014, 6, 6, 9, 30) }
      When(:result){ repositorio.obter_agenda_do_dia(data) }
      Then{ expect(result).to be_an_instance_of(AgendaConsulta) }
    end
  end

  describe "#periodo_disponivel_para_agendamento?" do
    let(:data_inicio){ Time.local(2014, 6, 6, 9, 30) }
    let(:data_fim){ Time.local(2014, 6, 6, 10, 0) }
    let(:periodo){ Periodo.new(inicio: data_inicio, fim: data_fim)}

    context "com horario disponivel" do
      Given(:data_object){ double("dao", horario_disponivel_para_agendamento?: true) }
      Given(:repositorio){ AgendaConsultaRepository.new(data_object: data_object) }
      When(:result) { repositorio.periodo_disponivel_para_agendamento?(periodo) }
      Then{ expect(result).to be_true }
    end

    context "com horario indisponivel" do
      Given(:data_object){ double("dao", horario_disponivel_para_agendamento?: false) }
      Given(:repositorio){ AgendaConsultaRepository.new(data_object: data_object) }
      When(:result) { repositorio.periodo_disponivel_para_agendamento?(periodo) }
      Then{ expect(result).to be_false }
    end
  end

  describe "#realizar_agendamento" do
    let(:dao){ double }
    Given(:repositorio){ AgendaConsultaRepository.new(data_object: dao) }
    pending
  end

end