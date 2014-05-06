require 'rspec/given'
require 'clinica/repositories/agenda_consulta_repository'

describe 'Repositorio de Agenda de Consultas' do

  Given(:repositorio){ AgendaConsultaRepository.new }

  describe "API" do
    Then{ expect(repositorio).to respond_to(:obter_agenda_do_dia) }
    Then{ expect(repositorio).to respond_to(:realizar_agendamento) }
    Then{ expect(repositorio).to respond_to(:periodo_ja_agendado?) }
  end

  describe "#obter_agenda_do_dia" do
    context "deve retornar a agenda de consultas para o dia em questao" do
      Given(:data){ Time.local(2014, 6, 6, 9, 30) }
      When(:result){ repositorio.obter_agenda_do_dia(data) }
      Then{ expect(result).to be_an_instance_of(AgendaConsulta) }
    end
  end

  describe "#realizar_agendamento" do
    pending "reason"
  end

  describe "#periodo_ja_agendado?" do
    pending "reason"
  end

end