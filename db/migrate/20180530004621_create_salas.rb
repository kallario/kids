class CreateSalas < ActiveRecord::Migration[5.2]
  def change
    create_table :salas do |t|
      t.string :nome_sala
      t.string :descricao
      t.integer :capacidade
      t.integer :turma_de
      t.integer :turma_ate

      t.timestamps
    end
  end
end
