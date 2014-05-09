require 'active_record'

ActiveRecord::Schema.define do
  create_table :pacientes, :force => true do |t|
    t.string :nome, null: false
  end

  create_table :agendamento_consulta do |t|
    t.datetime :data_hora_inicio, null: false
    t.datetime :data_hora_fim, null: false
    t.references :paciente, index: {name: 'idx_agen_cons_pac'}
  end
  add_index :horarios_consulta, [:data_hora_inicio, :data_hora_fim], name: 'idx_agen_data_hora'
  add_index :horarios_consulta, [:paciente, :data_hora_inicio, :data_hora_fim], name: 'idx_agen_paci_data_hora'
end