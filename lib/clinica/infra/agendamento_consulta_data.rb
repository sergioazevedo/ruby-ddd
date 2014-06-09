require 'active_record'
class AgendamentoConsultaData < ActiveRecord::Base
  self.table_name = :agendamento_consulta
  belongs_to :paciente, class_name: :PacienteData

  # validates :data_hora_inicio, presense: true
  # validates :data_hora_fim, presense: true

  def self.horario_disponivel_para_agendamento?(data_hora_inicio, data_hora_fim)
    where( data_hora_inicio: data_hora_inicio...data_hora_fim,
           data_hora_fim: data_hora_inicio..data_hora_fim ).empty?
  end
end