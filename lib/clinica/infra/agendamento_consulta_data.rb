class AgendamentoConsultaData < ActiveRecord::Base
  self.table_name = :agendamento_consulta

  attr_accessible :data, :hora_inicio, :hora_fim
  belongs_to :paciente

  validates :data, presense: true
  validates :hora_inicio, presense: true
  validates :hora_fim, presense: true
end