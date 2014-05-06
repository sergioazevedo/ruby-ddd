ActiveRecord::Schema.define do
  create_table :pacientes, :force => true do |t|
    t.string :nome, null: false
  end

  create_table :agendamento_consulta do |t|
    t.date :data, null: false
    t.time :hora_inicio, null: false
    t.time :hora_fim, null: false
    t.references :paciente, index: {name: 'idx_agen_cons_pac'}
  end
  add_index :horarios_consulta, :data, name: 'idx_agen_data'
  add_index :horarios_consulta, [:data, :hora_inicio, :hora_fim], name: 'idx_agen_data_hora'
end
