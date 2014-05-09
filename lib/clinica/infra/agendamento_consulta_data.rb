class AgendamentoConsultaData < ActiveRecord::Base
  self.table_name = :agendamento_consulta

  attr_accessible :data_hora_inicio, :data_hora_fim
  belongs_to :paciente, class_name: :PacienteData

  validates :data_hora_inicio, presense: true
  validates :data_hora_fim, presense: true

  def self.horario_disponivel_para_agendamneto?(data_hora_inicio, data_hora_fim)
    where( data_hora_inicio: data_hora_inicio...data_hora_fim,
           data_hora_fim: data_hora_fim..data_hora_inicio )
  end
end