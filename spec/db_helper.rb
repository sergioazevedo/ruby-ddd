require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => ":memory:"
)

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Schema.define do
  create_table :pacientes, :force => true do |t|
    t.string :nome, null: false
  end

  create_table :agendamento_consulta do |t|
    t.datetime :data_hora_inicio, null: false
    t.datetime :data_hora_fim, null: false
    t.references :paciente, index: {name: 'idx_agen_cons_pac'}
  end
  add_index :agendamento_consulta, [:data_hora_inicio, :data_hora_fim], name: 'idx_agen_data_hora'
  add_index :agendamento_consulta, [:paciente_id, :data_hora_inicio, :data_hora_fim], name: 'idx_agen_paci_data_hora'
end