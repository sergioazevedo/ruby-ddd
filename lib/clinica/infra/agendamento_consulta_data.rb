require 'active_record'
class AgendamentoConsultaData < ActiveRecord::Base
  self.table_name = :agendamento_consulta
  belongs_to :paciente, class_name: :PacienteData

  attr_accessible :paciente, :data_hora_inicio, :data_hora_fim

  validates :data_hora_inicio, presense: true
  validates :data_hora_fim, presense: true

  def self.horario_disponivel_para_agendamneto?(data_hora_inicio, data_hora_fim)
    where( data_hora_inicio: data_hora_inicio...data_hora_fim,
           data_hora_fim: data_hora_fim..data_hora_inicio )
  end
end