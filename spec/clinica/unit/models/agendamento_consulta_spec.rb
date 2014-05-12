require 'db_helper'
require 'rspec/given'
require 'clinica/models/agendamento_consulta'
require 'clinica/infra/agendamento_consulta_data'

describe 'Agendamento Consulta' do

  describe "#initialize" do
    context "sem receber um data_instance deve lancar excecao" do
      When(:agendamento_consulta){ AgendamentoConsulta.new }
      Then{ expect(agendamento_consulta).to raise_error }
    end

  end

end