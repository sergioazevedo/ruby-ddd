# encoding: utf-8

require 'db_helper'
require 'rspec/given'
require 'clinica/models/agendamento_consulta'
require 'clinica/infra/agendamento_consulta_data'

describe 'Agendamento Consulta' do
  describe "API" do
    let(:data_instance){ double }
    subject(:agendamento){ AgendamentoConsulta.new(data_instance) }

    it "deve responder ao método #periodo" do
      expect(agendamento).to respond_to(:periodo)
    end

    it "deve ser capaz de responder ao nome do paciente" do
      expect(agendamento).to respond_to(:paciente_nome)
    end

    it "deve ser capaz de responder ao id do paciente" do
      expect(agendamento).to respond_to(:paciente_id)
    end
  end

  describe "#initialize" do
    context "sem receber um data_instance deve lancar excecao" do
      When(:agendamento_consulta){ AgendamentoConsulta.new }
      Then{ expect(agendamento_consulta).to raise_error }
    end
  end

  describe "Relacionamento com Paciente" do
    let(:data_instance){ double(:dao, nome: 'Ricardo') }
    subject(:agendamento){ AgendamentoConsulta.new(data_instance) }

    it "deve retornar um valor nao nulo para nome do paciente" do
      expect(agendamento.paciente_nome).to_not be nil
    end
  end

end