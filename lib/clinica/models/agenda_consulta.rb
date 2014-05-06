class AgendaConsulta

  def initialize(periodo:, repositorio:)
    @periodo = periodo
    @repositorio = repositorio
  end

  def periodo
    @periodo.freeze
  end

end