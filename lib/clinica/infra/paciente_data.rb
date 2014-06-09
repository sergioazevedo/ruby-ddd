require "active_record"

class PacienteData < ActiveRecord::Base
  self.table_name = :pacientes

  def self.obter_por_id(id)
    find(id)
  end
end