require 'rspec/given'
require 'clinica/models/agenda_consulta'
require 'clinica/models/agendamento_consulta'

describe 'Agenda de Consulta' do
  let(:periodo_valido){ double }
  let(:repositorio){ double }

  describe "#initialize" do
    describe "usando Periodo como parametro" do
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
    let(:paciente){ double }
    Given(:agenda){ AgendaConsulta.new(periodo: periodo_valido, repositorio: repositorio) }

    describe "sem receber o paciente e o periodo deve lancar o erro" do
      When(:result){ agenda.agendar_horario }
      Then{ expect(result).to raise_error }
    end

    describe "sem receber o paciente deve lancar o erro" do
      When(:result){ agenda.agendar_horario( periodo: periodo_valido ) }
      Then{ expect(result).to raise_error }
    end

    describe "sem receber o periodo da consulta deve lancar um erro" do
      When(:result){ agenda.agendar_horario( paciente: paciente ) }
      Then{ expect(result).to raise_error }
    end

    describe "com horario disponivel deve retornar um agendamento de consulta" do
      When(:result){ agenda.agendar_horario( paciente: paciente, periodo: periodo_valido ) }
      Then{ expect(result).to_not raise_error }
      Then{ expect(result).to be_a_instance_of(AgendamentoConsulta) }
    end

    describe "com horario nao disponivel deve lancar um erro" do
      pending
    end
  end

end