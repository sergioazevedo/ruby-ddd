require 'rspec/given'
require 'clinica/repositories/agenda_consulta_repository'

describe 'Repositorio de Agenda de Consultas' do

  Given(:repositorio){ AgendaConsultaRepository.new }

  describe "#obter_agenda_do_dia" do
    context "deve retornar a agenda de consultas para o dia em questao" do
      Given(:data){ Time.local(2014, 6, 6, 9, 30) }
      When(:result){ repositorio.obter_agenda_do_dia(data) }
      Then{ expect(result).to be_an_instance_of(AgendaConsulta) }
    end
  end

end