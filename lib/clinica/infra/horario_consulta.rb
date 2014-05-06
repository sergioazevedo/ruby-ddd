class HorarioConsultaData < ActiveRecord::Base
  self.table_name = :horario_consulta

  attr_accessible :data, :hora_inicio, :hora_fim

  validates :data, presense: true
  validates :hora_inicio, presense: true
  validates :hora_fim, presense: true
end