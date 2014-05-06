require 'rspec/given'
require 'clinica/models/periodo'

describe Periodo do
  Given(:data_hora_fim){ Time.local(2014, 6, 6, 9, 30) }
  Given(:data_hora_inicio){ Time.local(2014, 6, 6, 9) }

  describe "#initialize" do
    context "com data inicio e fim nulas deve gerar um erro" do
      When(:result){ Periodo.new }
      Then{ expect(result).to raise_error(ArgumentError) }
    end

    context "com apenas data de inicio deve gerar um erro" do
      When(:result){ Periodo.new(inicio: data_hora_inicio) }
      Then{ expect(result).to raise_error(ArgumentError) }
    end

    context "com apenas data de inicio maior que data final deve gerar um erro" do
      When(:result){ Periodo.new(inicio: data_hora_fim, fim: data_hora_inicio) }
      Then{ expect(result).to raise_error(PeriodoInvalidoError) }
    end

    context "com argumentos validos deve criar novo objeto" do
      When(:result){ Periodo.new(inicio: data_hora_inicio, fim: data_hora_fim) }
      Then{ expect(result.data_inicio).to be == data_hora_inicio }
      Then{ expect(result.data_fim).to be == data_hora_fim }
    end
  end

  describe ".do_dia_inteiro" do
    context "fornecendo uma data qualquer deve retornar o perido do todo dia em questao" do
      When(:result){ Periodo.do_dia_inteiro(data_hora_inicio) }
      Then{ expect(result.data_inicio).to be == Time.local(2014,6,6) }
      Then{ expect(result.data_fim).to be == Time.local(2014,6,6,23,59,59) }
    end
  end

  describe "Imutabilidade" do
    Given(:periodo){ Periodo.new(inicio: data_hora_inicio, fim: data_hora_fim) }

    context "nao deve permitir alterar o estado da data inicial" do
      Then{ expect(periodo).to_not respond_to(:data_inicio=) }
    end

    context "nao deve permitir alterar o estado da data final" do
      Then{ expect(periodo).to_not respond_to(:data_fim=) }
    end
  end

end