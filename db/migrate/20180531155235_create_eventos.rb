class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.references :pessoa, foreign_key: true
      t.integer :responsavel_id
      t.datetime :data_evento
      t.integer :tipo_evento

      t.timestamps
    end
  end
end
