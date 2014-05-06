require 'rspec/given'
require 'clinica/models/agenda_consulta'

describe 'Agenda de Consulta' do

  describe "#initialize" do
    describe "usando Periodo como parametro" do
      let(:periodo_valido){ double }
      let(:repositorio){ double }
      context "sem receber um periodo deve gerar um erro" do
        When(:agenda){ AgendaConsulta.new }
        Then{ expect(agenda).to raise_error(ArgumentError) }
      end

      context "recebendo um periodo valido, mas sem referencia de repositorio" do
        When(:agenda){ AgendaConsulta.new(periodo: periodo_valido) }
        Then{ expect(agenda).to raise_error }
      end

      context "recebendo um periodo valido e com referencia de repositorio" do
        When(:agenda){ AgendaConsulta.new(periodo: periodo_valido, repositorio: repositorio) }
        Then{ expect{ agenda }.to_not raise_error }
      end

    end
  end

  describe "API" do
    let(:periodo_valido){ double }
    let(:repositorio){ double }

    Given(:agenda){ AgendaConsulta.new(periodo: periodo_valido, repositorio: repositorio) }

    context "deve responder ao periodo" do
      Then{ expect(agenda).to respond_to(:periodo) }
    end
    context "nao deve permitir alteracoes no periodo" do
      Then{ expect(agenda).to_not respond_to(:periodo=) }
    end

    context "deve responder ao metodo agendar_horario" do
      Then{ expect(agenda).to respond_to(:agendar_horario) }
    end
  end

  describe "#agendar_horario" do
    describe "sem receber o paciente deve lancar o erro" do
      pending
    end

    describe "sem receber o periodo da consulta deve lancar um erro" do
      pending
    end

    describe "com horario disponivel deve retornar um agendamento de consulta" do
      pending
    end

    describe "com horario nao disponivel deve lancar um erro" do
      pending
    end
  end

end