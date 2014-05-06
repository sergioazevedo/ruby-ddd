ActiveRecord::Schema.define do
  create_table :pacientes, :force => true do |t|
    t.string :nome, null: false
  end

  create_table :horarios_consulta do |t|
    t.date :data, null: false
    t.time :hora_inicio, null: false
    t.time :hora_fim, null: false
  end
  add_index :horarios_consulta, :data, name: 'horario_consulta_por_data'
  add_index :horarios_consulta, [:data, :hora_inicio, :hora_fim], name: 'horario_consulta_por_data_hora'
end
