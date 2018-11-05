class CreateTurmas < ActiveRecord::Migration[5.2]
  def change
    create_table :turmas do |t|
      t.string :nome_turma
      t.string :descricao
      t.integer :idade_inicial
      t.integer :idade_final

      t.timestamps
    end
  end
end
