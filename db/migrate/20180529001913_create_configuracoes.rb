class CreateConfiguracoes < ActiveRecord::Migration[5.2]
  def change
    create_table :configuracoes do |t|
      t.string :nome_empresa
      t.boolean :quiosque
      t.boolean :turmas
      t.boolean :salas
      t.boolean :usar_impressora
      t.string :nome_impressora
      t.string :layout_etiqueta
      t.boolean :usar_fotos

      t.timestamps
    end
  end
end
