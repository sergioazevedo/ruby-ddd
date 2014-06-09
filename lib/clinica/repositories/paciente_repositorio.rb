require_relative '../infra/paciente_data.rb'
class PacienteRepositorio

  def initialize(data_object: nil, opts: {})
    @data_object = data_object || PacienteData
  end

  def obter_por_id(id)
    dao.obter_por_id(id)
  end

private

  def dao
    @data_object
  end


end