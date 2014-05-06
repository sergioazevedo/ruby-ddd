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
        Then{ expect(agenda).to raise_error(ArgumentError) }
      end

      context "recebendo um periodo valido e com referencia de repositorio" do
        When(:agenda){ AgendaConsulta.new(periodo: periodo_valido, repositorio: repositorio) }
        Then{ expect(agenda).to_not raise_error(ArgumentError) }
      end

    end
  end

  describe "#agendar_horario" do
    pending "reason"
  end

end